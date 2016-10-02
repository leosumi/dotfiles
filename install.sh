#! /bin/bash

echo "Installing dotfiles"

if [ "$(lsb_release -is)" = "Ubuntu" ]; then
  echo "Running on Linux"

  echo "Creating directories in home"
  mkdir $HOME/bin $HOME/Info

  echo "Configuring locale"
  source install/locale.sh

  echo "Installing packages"
  source install/packages.sh

  echo "Linking dotfiles"
  source install/link.sh

  echo "Installing plugin"
  source install/pluginsInstall.sh
elif [ "$(lsb_release -is)" = "Debian" ]; then
  echo "Check package.list"
else
  echo "Not on Debian based OS"
fi

echo "Done."

