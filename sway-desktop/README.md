# Sway Desktop

Sway 3-monitor multihead configuration with nice soothing pastel Catppuccin color palette.

## Install (Arch Linux)

1. Get needed packages.

```bash
sudo pacman -S --needed swaybg jq cmake cmocka sway wofi waybar \
reflector mtools zsh \
papirus-icon-theme noto-fonts-emoji ttf-hack wl-clipboard \
translate-shell slurp grim light pamixer wmname dmenu xdg-desktop-portal \
kanshi gnome-keyring alacritty kitty pavucontrol playerctl wayvnc pkcs11-helper \
mako swaylock
```

2. Clone the repository

```bash
cd ~
git clone https://github.com/ShiftHackZ/Dotfiles-Linux.git
cd Dotfiles-Linux/sway-desktop
```

3. Change shell to ZSH

```bash
chsh -s /bin/zsh $USER
```

4. Install OhMyZSH + Powerlevel10k theme + autosuggestions

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestion
```

5. Copy needed fonts

```bash
sudo mkdir -p /usr/share/fonts/TTF
sudo mkdir /usr/share/fonts/TTF
fc-cache
```

6. Copy needed configs

//ToDo write exactly

7. Instal yay

```bash
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..
```

8. Install needed packages from Arch AUR repository

```bash
yay -S wob nwg-launchers wlsunset azote
```

9. (Optional) Install networkmanager-dmenu (if using networkmanager)

```bash
yay -S networkmanager-dmenu-git
```

