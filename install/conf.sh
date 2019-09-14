#!/bin/sh

DOTFILES_DIR=$HOME/.dotfiles

for file in bashrc profile; do
    diff /etc/skel/.$file ~/.$file > /dev/null
    if [ $? -eq 0 ]; then
        echo Adding commands to .$file
        cat $DOTFILES_DIR/$file >> ~/.$file
    else
        echo .$file differs from skel, .$file was modified.
        echo Can not perform configuration
    fi
done
