awk '{print $1}' aur.txt | cut -f1 | xargs yay -S --noconfirm
