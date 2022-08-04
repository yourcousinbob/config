awk '{print $1}' pacman.txt | cut -f1 | xargs pacman -S --noconfirm
