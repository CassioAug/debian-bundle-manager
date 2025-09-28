#!/bin/bash
#
# bundle-manager.sh
# Copyright (C) 2025 Cássio Augusto Couto Soares
#
# This program is licensed under the MIT License.
# You can find a copy of the license in the LICENSE file.

LANGUAGE=${LANG%%.*}
if [ -f "locales/$LANGUAGE.sh" ]; then
    source "locales/$LANGUAGE.sh"
else
    source "locales/en.sh"
fi
# ---

[ -z "$1" ] && printf "$MSG_USAGE" "$0" && exit 1
[ ! -f "$1" ] && printf "$MSG_FILE_NOT_FOUND" "$1" && exit 1

printf "$MSG_INSTALLING_FROM" "$1"

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
            printf "$MSG_ALREADY_INSTALLED" "$app_id"
        else
            printf "$MSG_INSTALLING" "$app_id"

            if flatpak install -y flathub "$app_id"; then
                clean_terminal
                printf "$MSG_SUCCESS" "$app_id"
            else
                clean_terminal
                printf "$MSG_FAIL" "$app_id"
            fi
        fi
    else
        if is_apt_installed "$pkg"; then
            printf "$MSG_ALREADY_INSTALLED" "$pkg"
        else
            printf "$MSG_INSTALLING" "$pkg"
            sudo apt install -y "$pkg" || printf "$MSG_FAIL" "$pkg"
        fi
    fi
done

printf "$MSG_COMPLETE"