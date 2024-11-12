#!/usr/bin/env python3

import os
from re import A
import toml
from pathlib import Path

from couleur.cli import build_argument_parser
from couleur.configurable import Configurable

COULEUR_ROOT_DIR = Path(__file__).parent.parent
CONFIGURABLE_ROOT_DIR = os.path.join(Path.home(), ".dotfiles", "home")

def main():
    global COULEUR_ROOT_DIR, CONFIGURABLE_ROOT_DIR

    configurables = [
        Configurable(os.path.join(CONFIGURABLE_ROOT_DIR, "hypr", "modules", "variables.template.conf")),
        Configurable(os.path.join(CONFIGURABLE_ROOT_DIR, "kitty", "current-theme.template.conf")),
        Configurable(os.path.join(CONFIGURABLE_ROOT_DIR, "mako", "config.template")),
        Configurable(os.path.join(CONFIGURABLE_ROOT_DIR, "waybar", "style.template.css")),
        Configurable(os.path.join(CONFIGURABLE_ROOT_DIR, "wlogout", "style.template.css")),
        Configurable(os.path.join(CONFIGURABLE_ROOT_DIR, "wofi", "style.template.css"))
    ]

    print(configurables)

    args = build_argument_parser().parse_args()

    config = toml.load(os.path.join(COULEUR_ROOT_DIR, "colors.toml"))
    current_theme = config["current_theme"]
    all_themes = config["themes"].keys()

    if args.command == "list-themes":
        for theme in all_themes:
            print(theme)

    elif args.command == "get-theme":
        print(current_theme)

    elif args.command == "set-theme":
        new_theme = args.theme_name

        if new_theme in all_themes:
            config["current_theme"] = new_theme
            with open(os.path.join(COULEUR_ROOT_DIR, "colors.toml"), "w") as config_file:
                toml.dump(config, config_file)

            for configurable in configurables:
                configurable.handle_set_theme(config["themes"][new_theme])
        else:
            print(f"Theme {new_theme} is not defined")

    print()

if __name__ == "__main__":

    main()