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
light (see setup)
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

* Set keyboard layout with `setxkbmap -layout pt`


#### Enable natural scrolling, tap-to-click, and 2- and 3-finger taps

Edit the file `/usr/share/X11/xorg.conf.d/40-libinput.conf` and add the following lines to the "touchpad" section:

    Option "NaturalScrolling" "on"
    Option "Tapping" "on"

Or if using Synaptics, add to `/usr/share/X11/xorg.conf.d/70-synaptics.conf`

```conf
Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "VertEdgeScroll" "off"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "off"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "off"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "30"
        Option "FingerHigh" "50"
        Option "MaxTapTime" "125"
        Option "VertScrollDelta" "-111"
EndSection
```

#### dmenu

You need the line-height patch for dmenu. https://tools.suckless.org/dmenu/patches/line-height/
Which requires installing a few extra things:

```sh
sudo apt install gcc libx11-dev libxinerama-dev libxft-dev
git clone https://git.suckless.org/dmenu
cd dmenu
wget https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-5.2.diff
git apply dmenu-lineheight-5.2.diff
```

#### i3blocks

This i3blocks config needs some features from the main branch.

```sh
sudo apt install dh-autoreconf
g clone git@github.com:vivien/i3blocks.git
cd i3blocks
./autogen.sh
./configure
make
sudo make install
```

#### i3 (gaps)

This config currently uses the lopis/i3 fork of i3 to customize how tabs look,
so building i3 from source is required.

```
sudo apt install python3-pip python3-setuptools python3-wheel ninja-build python3-mesonpy
sudo apt install libstartup-notification0-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-util-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxcb-xrm-dev libxkbcommon-x11-dev libyajl-dev libpcre2-dev libcairo2-dev libpango1.0-dev libev-dev
g clone git@github.com:lopis/i3.git # Might need to be rebased
cd i3
meson setup build
meson compile -C build
sudo ninja -C build install
```

#### dunst (notifications)

```sh
mkdir dunst
ln -s ~/dev/i3config/dunstrc ~/.config/dunst/dunstrc
```

#### light

```sh
sudo apt install light
sudo chmod +s /usr/bin/light
```


### Current issues

* `light` doesn't work unless I run `sudo chown me /sys/class/backlight/intel_backlight/brightness`
