from argparse import ArgumentParser

def build_argument_parser() -> ArgumentParser:
    parser = ArgumentParser()
    subparsers = parser.add_subparsers(dest="command", help="Commands")
    list_parser = subparsers.add_parser("list-themes", help="List all available themes")
    get_parser = subparsers.add_parser("get-theme", help="Get the current theme")
    set_parser = subparsers.add_parser("set-theme", help="Set the current theme")
    set_parser.add_argument("theme_name", help="Name of the theme to set")

    return parser