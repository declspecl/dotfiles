use std::{collections::HashSet, fs};

use clap::Parser;
use cli::Cli;
use config::{Configuration, ThemeName, Themeable, ThemeableName};

mod cli;
mod config;
mod model;

const CONFIG_FILE_PATH: &str = "/home/dec/.dotfiles/couleur.toml";

fn main() {
    let cli = Cli::parse();

    if !fs::exists(CONFIG_FILE_PATH).expect(&format!("Failed to check if config at path \"{}\" exists", CONFIG_FILE_PATH)) {
        println!("Creating default configuration file at path \"{}\"", CONFIG_FILE_PATH);

        let default_configuration = Configuration::default();

        fs::write(
            CONFIG_FILE_PATH,
            toml_edit::ser::to_string(&default_configuration).expect("Failed to serialize default config")
        )
        .expect(&format!(
            "Failed to write config to config file at path \"{}\"",
            CONFIG_FILE_PATH
        ));
    }

    let config_string = fs::read_to_string(CONFIG_FILE_PATH).expect(&format!("Failed to open config file at path \"{}\"", CONFIG_FILE_PATH));
    let config: Configuration = toml_edit::de::from_str(&config_string).expect(&format!("Failed to parse config file at path \"{}\"", CONFIG_FILE_PATH));

    match cli.command {
        cli::Commands::GetTheme => {
            println!("Current theme: {}", config.current_theme);
        },
        cli::Commands::ListThemes => {
            let all_theme_names = config.themes.keys().collect::<HashSet<&ThemeName>>();

            println!("Themes: {:?}", all_theme_names);
        },
        cli::Commands::ListThemeables => {
            let all_themeable_names = config.themeables.keys().collect::<HashSet<&ThemeableName>>();

            println!("Themeables: {:?}", all_themeable_names);
        },
        cli::Commands::Render { themeable_name } => {
            let try_render_themeable = |themeable: &Themeable| {
                if let Some(theme) = config.themes.get(&config.current_theme) {
                    println!("Rendering themeable \"{}\" with theme \"{}\"", themeable.name, theme.name);

                    let rendered_themeable = themeable.render(theme);

                    fs::write(&themeable.output_file_path, rendered_themeable).expect(&format!(
                        "Failed to write rendered themeable \"{}\" to path \"{}\"",
                        themeable.name,
                        themeable.output_file_path.to_string_lossy()
                    ));
                }
                else {
                    println!("Cannot render themeables with unknown theme \"{}\"", config.current_theme);
                }
            };

            if let Some(themeable_name) = themeable_name {
                if let Some(themeable) = config.themeables.get(&themeable_name) {
                    try_render_themeable(themeable);
                }
                else {
                    println!("Unknown themeable \"{}\"", themeable_name);
                }
            }
            else {
                for (_, themeable) in config.themeables.iter() {
                    try_render_themeable(themeable);
                }
            }
        }
    }
}
