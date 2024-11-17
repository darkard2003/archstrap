# Ask for sudo password upfront
sudo -v

# Install packages in swayreq file
for package in $(cat swayreq); do
    echo "Installing $package"
    sudo pacman -S $package --noconfirm
    echo "Installed $package"
    sleep 1
done

# Copy config file to config directory
cp -r ./config $HOME/.config/sway
