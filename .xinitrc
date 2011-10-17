#!/bin/bash
xcompmgr &
#Turn off bell
xset -b b off 
xset +fp /usr/share/fonts/local
xset fp rehash
xsetroot -cursor_name left_ptr
xsetroot -solid midnightblue
urxvtd -o -f -o
 
xscreensaver -no-splash &
 
exec xmonad
