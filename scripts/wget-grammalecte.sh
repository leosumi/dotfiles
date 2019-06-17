#! /bin/bash
# Get grammalecte for dpelle/vim-Grammalecte
# by Léo Sumi

version=1.1.1

mkdir $HOME/grammalecte
if [ $? -ne 0 ]; then
    echo "The $HOME/grammalecte already exists. Remove it and run again."
    exit 1
fi
pushd $HOME/grammalecte
wget https://grammalecte.net/grammalecte/zip/Grammalecte-fr-v$version.zip
unzip Grammalecte-fr-v$version.zip
rm Grammalecte-fr-v$version.zip
popd
