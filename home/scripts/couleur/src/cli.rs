use clap::{Parser, Subcommand};

use crate::config::ThemeableName;

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
    Render { themeable_name: Option<ThemeableName> }
}
