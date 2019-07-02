# i3config
myi3config

### Dependencies

```
scrot
xclip
telegram
light (git@github.com:haikarainen/light.git)
playerctl (for media controls)
i3gaps
blueman
```

### Extra setup

* Clone this repo into ~/.config/i3, or link it

* Make Telegram executable from the Terminal: `sudo ln -s /opt/telegram/telegram /usr/local/bin/telegram`

* Change theme in `lxappearance` `gtk-chtheme` and `qt4-qtconfig`

### Current issues

* not saving/restoring workspace layouts

* `light` doesn't work unless I run `sudo chown me /sys/class/backlight/intel_backlight/brightness`
