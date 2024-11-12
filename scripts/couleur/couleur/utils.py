def rgb_string_to_hex(rgb: str) -> str:
    cleaned_string = rgb.replace("rgb(", "").replace(")", "")
    r, g, b = cleaned_string.split(", ")

    return rgb_to_hex((int(r), int(g), int(b)))

def rgb_to_hex(rgb: tuple[int, int, int]) -> str:
    r, g, b = rgb

    return ("{:02x}" * 3).format(r, g, b)

def hex_string_to_rgb(hex: str) -> tuple[int, int, int]:
    return hex_to_rgb(hex.replace("#", ""))

def hex_to_rgb(hex: str) -> tuple[int, int, int]:
    return tuple(int(hex[i:i+2], 16) for i in (0, 2, 4))
