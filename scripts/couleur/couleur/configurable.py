from couleur.utils import rgb_string_to_hex

class Configurable:
    def __init__(self, template_file_path: str):
        self.template_file_path = template_file_path

    def get_configurable_file_path(self) -> str:
        return self.template_file_path.replace(".template", "")

    def handle_set_theme(self, theme: dict[str, str]) -> bool:
        template = None
        with open(self.template_file_path, "r") as template_file:
            template = template_file.read()

        for color_name, color_rgb_string in theme.items():
            template = template.replace(f"%{color_name}%", color_rgb_string).replace(f"%hex:{color_name}%", rgb_string_to_hex(color_rgb_string))

        with open(self.get_configurable_file_path(), "w+") as configurable_file:
            print(f"Writing to {self.get_configurable_file_path()}")
            configurable_file.write(template)

    def __str__(self) -> str:
        return "Configurable(template_file_path='{}')".format(self.template_file_path)
    
    def __repr__(self) -> str:
        return str(self)