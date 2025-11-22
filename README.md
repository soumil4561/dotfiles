# Dotfiles
This repository serves as the source of truth for all my system configurations and dotfiles.
It uses GNU Stow to manage symlinks cleanly and keep the $HOME directory uncluttered.

## Installation
To set up the dotfiles on a new machine (or a new install), first make sure to have 
`git` and `stow` installed. Then, clone this repository and use `stow` to create symlinks for the desired configurations.

```bash
git clone https://github.com/soumil4561/dotfiles.git
cd dotfiles
```
To stow a specific configuration (for example, `zsh`), run:
```bash
stow zsh
```
Repeat this for other configurations as needed.

## Notes

Always run stow from the root of the dotfiles repo.

Editing files inside ~/.config edits the files inside this repository, since they are symlinked.

Adding new config files inside a package does not require re-stowing unless new directories are added.

This system makes migrating to a new machine trivial — just clone and stow.

## Install Script (Automatic Setup, Optional)

This repository includes an optional install.sh script that automates the entire dotfiles setup process.

Instead of manually deleting old configs and stowing each package, the script:

Ensures required tools (like stow) are installed

Removes or backs up any existing configs that would block symlinks

Stows all configured packages automatically

Validates that the dotfiles directory exists

Ensures configs are linked correctly to $HOME

This makes it ideal for fresh installs or new machines.

Run the installer:
```bash
./install.sh
```

This will handle everything for you, making the setup process quick and hassle-free.