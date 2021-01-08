# i3config
myi3config

### Dependencies

```
i3gaps 
    # sudo add-apt-repository ppa:kgilmer/speed-ricer
    # sudo apt install i3-gaps
i3blocks
scrot
xclip
telegram
light (git@github.com:haikarainen/light.git)
playerctl (for media controls)
blueman
galculator
feh (for backgrounds)
```

### Extra setup

* Clone this repo into ~/.config/i3, or link it

* Change theme in `lxappearance` `gtk-chtheme` and `qt4-qtconfig`

* Enable natural scrolling
    
Edit the file `/usr/share/X11/xorg.conf.d/40-libinput.conf` and add the following lines to the "touchpad" section (and optionally the "pointer" section too):

    Option "NaturalScrolling" "on"
    
    

### Current issues

* not saving/restoring workspace layouts

* `light` doesn't work unless I run `sudo chown me /sys/class/backlight/intel_backlight/brightness`
