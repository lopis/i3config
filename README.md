# i3config

myi3config

### Dependencies

```
fonts-font-awesome
i3blocks
    # You'll need to get i3blocks-contrib to get all scripts in ~/.config/i3blocks
    # You'll need i3blocks 1.5 or higher to get dynamic props working
scrot
xclip
telegram
light (git@github.com:haikarainen/light.git)
playerctl (for media controls)
blueman
galculator
hsetroot (for background)
picom
lm-sensors
yad # for calendar 
    # for i3blocks temperature
```

### Extra setup

* Clone this repo into ~/.config/i3, or link it

* Change theme in `lxappearance` `gtk-chtheme` and `qt4-qtconfig`

* Enable natural scrolling, tap-to-click, and 2- and 3-finger taps

Edit the file `/usr/share/X11/xorg.conf.d/40-libinput.conf` and add the following lines to the "touchpad" section:

    Option "NaturalScrolling" "on"
    Option "Tapping" "on"  

### Current issues

* not saving/restoring workspace layouts

* `light` doesn't work unless I run `sudo chown me /sys/class/backlight/intel_backlight/brightness`
