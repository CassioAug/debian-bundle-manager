#!/bin/bash

[ -z "$1" ] && echo "Usage: $0 <bundle-file.txt>" && exit 1
[ ! -f "$1" ] && echo "File $1 not found!" && exit 1

echo "Installing from: $1"

# Function: checking APT package installation
is_apt_installed() {
    dpkg -l "$1" 2>/dev/null | grep -q "^ii"
}

# Function: checking Flatpak package installation
is_flatpak_installed() {
    flatpak list --app --columns=application | grep -q "^$1$"
}

# Function: cleaning up terminal
clean_terminal() {
    printf "\033[2J\033[H"
}

sudo apt update

# Reading bundle file into an array
mapfile -t packages < "$1"

# Processing each line from the array
for pkg in "${packages[@]}"; do
    # Skipping comments and empty lines
    [[ "$pkg" =~ ^# ]] || [[ -z "$pkg" ]] && continue
    
    if [[ "$pkg" =~ ^flatpak: ]]; then
        app_id="${pkg#flatpak:}"
        if is_flatpak_installed "$app_id"; then
            echo "✅ $app_id (already installed)"
        else
            echo "📥 Installing: $app_id"

            if flatpak install -y flathub "$app_id"; then
                clean_terminal
                echo "✅ Successfully installed: $app_id"
            else
                clean_terminal
                echo "❌ Failed to install: $app_id"
            fi
        fi
    else
        if is_apt_installed "$pkg"; then
            echo "✅ $pkg (already installed)"
        else
            echo "📥 Installing: $pkg"
            sudo apt install -y "$pkg" || echo "❌ Failed to install: $pkg"
        fi
    fi
done

echo "Installation process completed!"