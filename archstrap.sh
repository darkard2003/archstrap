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
