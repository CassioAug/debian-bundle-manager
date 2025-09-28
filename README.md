# Debian Bundle Manager

A simple but powerful Bash script to automate the installation of software packages on Debian-based systems.

This script reads a list of applications from a text file and installs them using either the APT package manager or Flatpak. It's designed to make setting up a new machine or synchronizing software across multiple computers quick and easy.

## ✨ Features

- **Dual Package Manager Support:** Installs software from both standard APT repositories and Flatpak.

- **Smart Installation:** Checks if a package is already installed before attempting to install it, saving time and preventing errors.

- **Simple Bundle Format:** Uses a plain text file to list the software you want, which is easy to create and edit.

- **Comments Support:** You can add comments (lines starting with #) in your bundle file to keep it organized.

- **Multi-language Support:** Automatically displays messages in English or Brazilian Portuguese based on your system's language.

## ⚙️ Requirements

- A Debian-based Linux distribution (e.g., Ubuntu, Debian, Linux Mint).

- Bash (which is standard on almost all Linux systems).

- Flatpak must be installed if you intend to install Flatpak applications.

## 🚀 How to Use

### 1. Make the script executable

Before you can run the script, you need to give it permission to execute. Open terminal at the path the script was placed and run:

```shell
chmod +x bundle-manager.sh
```

### 2. Create your bundle file

Create a .txt file and list the packages you want to install. See the format guide below.

### 3. Run the script

Execute the script from your terminal, providing the path to your bundle file as an argument.

Ps.: the script needs administrator privileges to work.

```shell
./bundle-manager.sh my-apps.txt
```

## 📝 Bundle File Format

The bundle file is a simple text file where each line contains one package to be installed.

For APT packages, just write the name of the package.

```
vim
neovim
gimp
```

For Flatpak packages, prefix the application ID with 'flatpak:'.

```
flatpak:com.bitwarden.desktop
flatpak:org.jdownloader.JDownloader
```

For comments, start the line with a #:

```
# This is a comment and will be ignored
```

### Example (bundle-example.txt):

```
# APT Applications:
neovim
ripgrep
fzf

# Flatpak Applications:
flatpak:com.borgbase.Vorta
flatpak:io.github.peazip.PeaZip
```
