#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

# Packages you want to stow
PACKAGES=("kitty" "hypr" "zsh" "wofi" "waybar")

# Default config paths to safely remove (mapped to package names)
declare -A PATH_MAP
PATH_MAP["hypr"]="$HOME/.config/hypr"
PATH_MAP["zsh"]="$HOME/.zshrc"
PATH_MAP["kitty"]="$HOME/.config/kitty"
PATH_MAP["wofi"]="$HOME/.config/wofi"
PATH_MAP["waybar"]="$HOME/.config/waybar"

# ---------------------------------------------------------------------------
# Helper functions
# ---------------------------------------------------------------------------

info() { echo -e "\033[1;34m[INFO]\033[0m $1"; }
warn() { echo -e "\033[1;33m[WARN]\033[0m $1"; }
error() { echo -e "\033[1;31m[ERR ]\033[0m $1"; }

# ---------------------------------------------------------------------------
# Remove existing configs before stowing
# ---------------------------------------------------------------------------

remove_existing_config() {
    local pkg=$1
    local target=${PATH_MAP[$pkg]}

    # 2. Missing PATH_MAP entry
    if [ -z "$target" ]; then
        warn "No path mapping found for $pkg — skipping cleanup."
        return
    fi

    # 3. Already a symlink
    if [ -L "$target" ]; then
        info "$target already a symlink — OK."
        return
    fi

    # Exists but is NOT a symlink
    if [ -e "$target" ]; then
        warn "$target exists and is NOT a symlink."

        read -p "Delete it? [y/N]: " ans
        if [[ "$ans" =~ ^[Yy]$ ]]; then
            rm -rf "$target"
            info "Deleted $target"
        else
            info "Skipping deletion of $target"
        fi
    fi
}

# ---------------------------------------------------------------------------
# Stow a package
# ---------------------------------------------------------------------------

stow_package() {
    local pkg=$1
    info "Stowing $pkg..."

    # 1 + 5. Use explicit target and fail properly
    stow --target="$HOME" -R "$pkg" || error "Failed to stow $pkg"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

main() {
    info "Dotfiles install script started."

    # 6. Validate dotfiles directory exists
    if [ ! -d "$DOTFILES_DIR" ]; then
        error "Dotfiles directory not found at $DOTFILES_DIR"
        exit 1
    fi

    # Only install stow if missing.
    if ! command -v stow >/dev/null 2>&1; then
        info "Installing stow..."
        sudo pacman -S --needed --noconfirm stow
    fi

    cd "$DOTFILES_DIR"

    for pkg in "${PACKAGES[@]}"; do
        info "Processing package: $pkg"
        remove_existing_config "$pkg"
        stow_package "$pkg"
    done

    info "Dotfiles setup completed successfully!"
}

main
