use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Copy, Serialize, Deserialize)]
pub struct Color {
    pub r: u8,
    pub g: u8,
    pub b: u8
}

impl Color {
    pub fn to_rgb_string(&self) -> String {
        return format!("rgb({}, {}, {})", self.r, self.g, self.b);
    }

    pub fn to_hex_string(&self) -> String {
        // cannot include the # since some apps don't like it
        return format!("{:02x}{:02x}{:02x}", self.r, self.g, self.b);
    }
}

