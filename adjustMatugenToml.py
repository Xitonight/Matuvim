import toml
from os.path import expanduser


def ensure_toml_config(file_path):
    required_config = {
        "config": {
            "reload_apps": True,
            "wallpaper": {
                "command": "swww",
                "arguments": [
                    "img",
                    "-t",
                    "outer",
                    "--transition-duration",
                    "1.5",
                    "--transition-step",
                    "255",
                    "--transition-fps",
                    "60",
                    "-f",
                    "Nearest",
                ],
                "set": True,
            },
        },
        "templates": {
            "nvim": {
                "input_path": "~/.config/nvim/pywal/matugen.lua",
                "output_path": "~/.cache/wal/base46-dark.lua",
            },
            "pywal": {
                "input_path": "~/.config/matugen/templates/colors-pywal",
                "output_path": "~/.cache/wal/colors",
            },
        },
    }

    try:
        with open(file_path, "r") as f:
            current_config = toml.load(f)
    except FileNotFoundError:
        current_config = {}

    def merge_dicts(base, updates):
        for key, value in updates.items():
            if isinstance(value, dict):
                base[key] = merge_dicts(base.get(key, {}), value)
            else:
                base.setdefault(key, value)
        return base

    updated_config = merge_dicts(current_config, required_config)

    with open(file_path, "w") as f:
        toml.dump(updated_config, f)

    print(f"Updated configuration saved to {file_path}")


ensure_toml_config(expanduser("~/.config/matugen/config.toml"))

