# detect additional fonts in non-default location
xset +fp /usr/share/fonts/local
xset fp rehash

# Import Xresources settings
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

# calibrate the monitor colors
[[ -f ~/.colorprofiles/default.icc ]] && xcalib ~/.colorprofiles/default.icc

# start screensaver
/usr/bin/xscreensaver &

# start synocloud
/opt/CloudStation/bin/syno-cloud-linux

# start window manager
exec awesome
