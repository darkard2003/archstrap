# Ask for sudo password upfront
sudo -v

# Install packages in swayreq file
for package in $(cat swayreq); do
    echo "Installing $package"
    sudo pacman -S $package --noconfirm
    echo "Installed $package"
    sleep 1
done

# Move sway config to config folder
git clone https://github.com/darkard2003/swayconfig.git ~/.config/sway

# Move waybar config to config folder
git clone https://github.com/darkard2003/waybarconfig.git ~/.config/waybar

if ! [ command -v nvim &> /dev/null ]; then
    echo "Installing nvim"
    sudo pacman -S neovim --noconfirm
    echo "Installed nvim"
fi

# Move nvim config to config folder
git clone https://github.com/darkard2003/nvim_config_darkchoclate.git ~/.config/nvim

# Move kitty config to config folder
git clone https://github.com/darkard2003/kittyconfig.git ~/.config/kitty
