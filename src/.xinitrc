#!/bin/bash

# This file is built to work on Linux and OSX(Darwin) machines.
# If a user shares a home directory on Mac and Linux the typical linux .xinitrc
# file would cause problems on the OSX machine. We detect which OS we are on
# using uname and use that to properly initialize the xsession.

UNAME=`uname -s`
if [ $UNAME == "Linux" ]; then
	#
	# linux stuff goes here
	#

	# Allow the user to change their x setup while still being able to push
	# changes in this file to all users with out breaking their changes.
	usermodmap="$HOME/.Xmodmap";
	if [ -f "$usermodmap" ]; then
		xmodmap "$usermodmap"
	fi

	userresources="${HOME}/.Xresources";
	if [ -e "$userresources" ]; then
		xrdb -merge "$userresources";
	fi

	# Turn the bell off so as not to annoy people sitting near by.
	xset b off

	# Adjust the key delay and repeat rate to be a bit more responsive.
	xset r rate 250 40

	# Turn on numlock by default
	numlockx

	# Load user's nvidia-settings-rc file
	NVCONF="/etc/.nvidia-settings-rc";
	if [ -e "$NVCONF" ];then
		nvidia-settings -l --config $NVCONF
	fi

	# Start the screensaver deamon.
	xscreensaver &

	#x11vnc -forever -passwd vncadmin &

	# Run the window manager and wait for it to exit
	#exec ck-xinit-session gnome-session
	#exec ck-xinit-session startxfce4
	#exec ck-xinit-session mwm
	export PATH="/opt/fvwm/fvwm-2.6.5/bin:$PATH";
	export MANPATH="/opt/fvwm/fvwm-2.6.5/share/man:$MANPATH";
	export LD_LIBRARY_PATH="/opt/fvwm/fvwm-2.6.5/lib:$LD_LIBRARY_PATH";
	exec ck-xinit-session fvwm

elif [ $UNAME == "Darwin" ]; then
	#
	# mac stuff goes here
	#
	userresources=$HOME/.Xresources
	usermodmap=$HOME/.Xmodmap
	sysresources=/etc/X11/xinit/.Xresources
	sysmodmap=/etc/X11/xinit/.Xmodmap

	# merge in defaults and keymaps

	if [ -f "$sysresources" ]; then
	    xrdb -merge "$sysresources"
	fi

	if [ -f "$sysmodmap" ]; then
	    xmodmap "$sysmodmap"
	fi

	if [ -f "$userresources" ]; then
	    xrdb -merge "$userresources"
	fi

	if [ -f "$usermodmap" ]; then
	    xmodmap "$usermodmap"
	fi

	# start some nice programs

	xterm &

	# start the window manager

	exec quartz-wm

else
	echo "##### UNKNOWN OS: $UNAME #####"
fi
