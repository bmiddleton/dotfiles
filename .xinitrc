#!/bin/bash
xcompmgr &
#Turn off bell
xset -b b off 
xset +fp /usr/share/fonts/local
xset fp rehash
hsetroot
xsetroot -cursor_name left_ptr
xsetroot -solid midnightblue
xmodmap ~/nocaps
urxvtd -o -f -o
 
xscreensaver -no-splash &
 
exec xmonad
