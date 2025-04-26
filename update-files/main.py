import os

PATHS = [
    ("~/.alacritty.toml", "alacritty")
    ("~/.config/nvim/**", "nvim")
    ("~/.config/Code - OSS/User/settings.json", "vscode")
    ("~/.zshrc", "zshell")
    ("~/.p10k.zsh", "zshell")
]


def copy_file(original_path: str, folder: str):
    ...


def copy_folder(original_path: str, folder: str):
    ...



def main():
    for original_path, folder in PATHS:
        if original_path.endswith("**"):
            copy_folder(original_path, folder)
        else:
            copy_file(original_path, folder)


if __name__ == "__main__":
    main()
