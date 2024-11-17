# Ask for sudo password upfront
sudo -v

set -e

function install_package {
    echo "Installing $1"
    if ! [ command -v $1 &> /dev/null ]; then
        sudo pacman -S $1 --noconfirm
        echo "Installed $1"
    else
        echo "$1 is already installed"
    fi
    sleep 1
}

# Install packages in swayreq file
for package in $(cat swayreq); do
    install_package $package
done

# Move sway config to config folder
echo "Moving sway config to config folder"
git clone https://github.com/darkard2003/swayconfig.git ~/.config/sway

# Move waybar config to config folder
echo "Moving waybar config to config folder"
git clone https://github.com/darkard2003/waybarconfig.git ~/.config/waybar

if ! [ command -v nvim &> /dev/null ]; then
    echo "Installing nvim"
    sudo pacman -S neovim --noconfirm
    echo "Installed nvim"
fi

# Move nvim config to config folder
echo "Moving nvim config to config folder"
git clone https://github.com/darkard2003/nvim_config_darkchoclate.git ~/.config/nvim

# Move kitty config to config folder
echo "Moving kitty config to config folder"
git clone https://github.com/darkard2003/kittyconfig.git ~/.config/kitty
