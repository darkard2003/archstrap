# Ask for sudo password upfront
sudo -v

set -e

function install_package {
    echo "Installing $1"
    if ! [ command -v $1 &> /dev/null ]; then
        yay -S $1
        echo "Installed $1"
    else
        echo "$1 is already installed"
    fi
    sleep 1
}

function update_repo {
    echo "Updating $1"
    if ! [ -d $1 ]; then
        echo "$1 is not a directory"
        exit 1
    fi
    cd $1
    git pull
    echo "Updated $1"
    cd -
    sleep 1
}

function clone_repo {
    echo "Cloning $1"
    if ! [ -d $1 ]; then
        git clone $2 $1
        echo "Cloned $1"
    else
        echo "$1 is already cloned"
        update_repo $1
        echo "Updated $1"
    fi
}

if ! [ command -v yay &> /dev/null ]; then
    echo "Setting up AUR"
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    echo "Installed yay"
fi

# Install packages in swayreq file
for package in $(cat swayreq); do
    install_package $package
done

# Move sway config to config folder
echo "Moving sway config to config folder"
clone_repo ~/.config/sway https://github.com/darkard2003/swayconfig.git

# Move waybar config to config folder
echo "Moving waybar config to config folder"
clone_repo ~/.config/waybar https://github.com/darkard2003/waybarconfig.git

# Move swaync config to config foler
clone_repo ~/.config/swaync https://github.com/darkard2003/archstrap.git

if ! [ command -v nvim &> /dev/null ]; then
    echo "Installing nvim"
    sudo pacman -S neovim --noconfirm
    echo "Installed nvim"
fi

# Move nvim config to config folder
echo "Moving nvim config to config folder"
clone_repo ~/.config/nvim https://github.com/darkard2003/nvim_config_darkchoclate.git

# Move kitty config to config folder
echo "Moving kitty config to config folder"
clone_repo ~/.config/kitty https://github.com/darkard2003/kittyconfig.git


