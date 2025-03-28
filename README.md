# DOTFILES

My dotfiles and developer tools configurations.

## Installation on macOS
1. Install [Homebrew](https://brew.sh/).

2. Clone the repository and run the `script/bootstrap` script.
```sh
git clone https://github.com/yuriihabrusiev/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

3. Install apps and tools.
```sh
brew bundle install --global
```

## Installation on Linux

Visual Studio Code Dev Containers extension automatically installs dotfiles with the following configuration:
```json
{
  "dotfiles.repository": "yuriihabrusiev/dotfiles",
  "dotfiles.targetPath": "~/.dotfiles",
  "dotfiles.installCommand": "script/bootstrap"
}
```

GitHub Codespaces automatically installs dotfiles when new codespace is creted.

Everywhere else you can install the dotfiles manually, similar to the macOS installation.
