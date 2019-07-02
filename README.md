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
```

### Extra setup

* Clone this repo into ~/.config/i3, or link it

* Make Telegram executable from the Terminal: `sudo ln -s /opt/telegram/telegram /usr/local/bin/telegram`

* Change theme in `lxappearance` `gtk-chtheme` and `qt4-qtconfig`

* Setup the gnome keyring: https://wiki.archlinux.org/index.php/GNOME/Keyring

### Current issues

* no keyring
* not saving/restoring workspace layouts
