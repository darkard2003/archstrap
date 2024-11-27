for package in $(cat ./swayreq); do
	sudo pacman -Rs $package
done
	
