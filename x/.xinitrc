# Monitor Config
xrandr --mode 2560x1440 --rate 144.00

# Options
xset s off
xset -dpms
xset s noblank
xset -b
xset r rate 210 40

# remap caps to escape
setxkbmap -option caps:escape
# remap alt and windows
setxkbmap -option altwin:swap_lalt_lwin

qtile start
