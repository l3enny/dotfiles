# detect additional fonts in non-default location
xset +fp /usr/share/fonts/local
xset fp rehash

# make sure to merge the Xresources settings
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# calibrate the monitor colors
[[ -f ~/.colorprofiles/default.icc ]] && xcalib ~/.colorprofiles/default.icc

# start screensaver
/usr/bin/xscreensaver &

# start window manager
exec awesome
