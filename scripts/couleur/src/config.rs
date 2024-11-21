use std::{collections::HashMap, path::PathBuf};

use serde::{Serialize, Deserialize};

use crate::model::Color;

pub type ThemeName = String;
pub type ThemeableName = String;
pub type Template = String;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Configuration {
    pub current_theme: ThemeName,
    pub themes: HashMap<ThemeName, Theme>,
    pub themeables: HashMap<ThemeableName, Themeable>
}

impl Default for Configuration {
    fn default() -> Self {
        return Self {
            current_theme: String::from("none"),
            themes: HashMap::new(),
            themeables: HashMap::new()
        };
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Theme {
    pub name: ThemeName,
    pub base00: Color,
    pub base01: Color,
    pub base02: Color,
    pub base03: Color,
    pub base04: Color,
    pub base05: Color,
    pub base06: Color,
    pub base07: Color,
    pub base08: Color,
    pub base09: Color,
    pub base0a: Color,
    pub base0b: Color,
    pub base0c: Color,
    pub base0d: Color,
    pub base0e: Color,
    pub base0f: Color
}

impl Theme {
    pub fn colors(&self) -> HashMap<&str, &Color> {
        return HashMap::from([
            ("base00", &self.base00),
            ("base01", &self.base01),
            ("base02", &self.base02),
            ("base03", &self.base03),
            ("base04", &self.base04),
            ("base05", &self.base05),
            ("base06", &self.base06),
            ("base07", &self.base07),
            ("base08", &self.base08),
            ("base09", &self.base09),
            ("base0a", &self.base0a),
            ("base0b", &self.base0b),
            ("base0c", &self.base0c),
            ("base0d", &self.base0d),
            ("base0e", &self.base0e),
            ("base0f", &self.base0f)
        ]);
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Themeable {
    pub name: ThemeableName,
    pub template: Template,
    pub output_file_path: PathBuf,
    pub theme_overrides: HashMap<ThemeName, Template>
}

impl Themeable {
    pub fn render(&self, theme: &Theme) -> String {
        let mut rendered_template = self.template.clone();

        for (color_name, color) in theme.colors().into_iter() {
            rendered_template = rendered_template.replace(&format!("%{color_name}%"), &color.to_rgb_string());
            rendered_template = rendered_template.replace(&format!("%rgb:{color_name}%"), &color.to_rgb_string());
            rendered_template = rendered_template.replace(&format!("%hex:{color_name}%"), &color.to_hex_string());
        }

        return rendered_template;
    }
}


