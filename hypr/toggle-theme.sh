#!/bin/bash
if [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-dark'" ]; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
    kitty +kitten themes --reload-in=all "Gruvbox Material Light Soft"
    cp -f ~/.config/hypr/hyprland_light.conf ~/.config/hypr/hyprland.conf
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    kitty +kitten themes --reload-in=all "Gruvbox Material Dark Soft"
    cp -f ~/.config/hypr/hyprland_dark.conf ~/.config/hypr/hyprland.conf
fi
