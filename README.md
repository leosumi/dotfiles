# Léo - Dotfiles

## After Arch Installation

Remember what packages were installed.

```
pacman -Q > pkgs.txt
pacman -Qe > explicit-pkgs.txt
pacman -Qd > deps-pkgs.txt

pacman -Qq > pkgs-names.txt
pacman -Qeq > explicit-pkgs-names.txt
pacman -Qdq > deps-pkgs-names.txt
```

Do a first update.

```
sudo pacman -Syu
sudo pacman -S git base-devel
```

### AUR helper

Install `yay` as an AUR helper.

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sri
```

## Repo Install

```
git clone https://github.com/leosumi/dotfiles ~/.dotfiles
cd ~/.dotfiles
git submodule update --init --recursive
```

