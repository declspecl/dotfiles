use clap::{Parser, Subcommand};

use crate::config::{ThemeName, ThemeableName};

#[derive(Parser)]
#[command(version, about)]
pub struct Cli {
    #[command(subcommand)]
    pub command: Commands
}

#[derive(Subcommand)]
pub enum Commands {
    GetTheme,
    ListThemes,
    ListThemeables,
    SetTheme {
        theme_name: ThemeName
    },
    Render {
        themeable_name: Option<ThemeableName>
    }
}

