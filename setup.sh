#!/bin/bash

DIR=$(cd $(dirname $0) && pwd)
CONFIG_PATH=~/.config/awesome

# install pro theme
if [ -d $CONFIG_PATH ]; then
    rm -rf $CONFIG_PATH.bak
    mv $CONFIG_PATH/ $CONFIG_PATH.bak
fi
git clone https://github.com/barwinko/pro.git $CONFIG_PATH

# install cycle focus
if [ -d $CONFIG_PATH/cyclefocus ]; then
    rm -rf $CONFIG_PATH/cyclefocus.bak
    mv $CONFIG_PATH/cyclefocus $CONFIG_PATH/cyclefocus.bak
fi
git clone https://github.com/blueyed/awesome-cyclefocus $CONFIG_PATH/cyclefocus

# install lain
if [ -d $CONFIG_PATH/lain ]; then
    rm -rf $CONFIG_PATH/lain.bak
    mv $CONFIG_PATH/lain $CONFIG_PATH/lain.bak
fi
git clone https://github.com/copycat-killer/lain.git $CONFIG_PATH/lain

# install my configurations
if [ -f $CONFIG_PATH/rc.lua ]; then
    rm -f $CONFIG_PATH/rc.lua.bak
    mv $CONFIG_PATH/rc.lua $CONFIG_PATH/rc.lua.bak
fi

# ln -s $DIR/config/awesome/rc.lua.pro $CONFIG_PATH/rc.lua
ln -s $DIR/config/awesome/rc.lua.orig $CONFIG_PATH/rc.lua

# install my themes
ln -s $DIR/config/awesome/themes/default $CONFIG_PATH/themes/default

# install mlterm seeting
if [ -d ~/.mlterm ]; then
    rm -rf ~/.mlterm.bak
    mv ~/.mlterm  ~/.mlterm.bak
fi
# mkdir ~/.mlterm
cp -ri $DIR/mlterm ~/.mlterm/
