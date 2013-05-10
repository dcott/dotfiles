# .bash_profile
# This file is read when you login

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

################################################
# User specific environment and startup programs

export PATH="$HOME/cabinet/opt/bin:$PATH";
export CVSROOT="$HOME/cabinet/cvs-rep";
export XBMLANGPATH="$HOME/.Xbitmaps/%B:$XBMLANGPATH";

# add pixie env
export PIXIEHOME="/opt/pixie/pixie-2.2.6";
export LD_LIBRARY_PATH="$PIXIEHOME/lib:$LD_LIBRARY_PATH";
export PATH="$PIXIEHOME/bin:$PATH";

# add custom python env
export PATH="/opt/python/python-2.7.3/bin:$PATH";
export LD_LIBRARY_PATH="/opt/python/python-2.7.3/lib:$LD_LIBRARY_PATH";

# add custom qt4 env
export PATH="/opt/qt/qt-4.7.4/bin:$PATH";
export LD_LIBRARY_PATH="/opt/qt/qt-4.7.4/lib:$LD_LIBRARY_PATH";
