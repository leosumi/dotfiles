#! /bin/bash
# Get LanguageTool for dpelle/vim-LanguageTool
# by Léo Sumi

version="stable"

mkdir $HOME/languagetool
if [ $? -ne 0 ]; then
    echo "The $HOME/languagetool already exists. Remove it and run again."
    exit 1
fi
pushd $HOME/languagetool
wget https://languagetool.org/download/LanguageTool-$version.zip
unzip LanguageTool-$version.zip
rm LanguageTool-$version.zip
ln -s $HOME/languagetool/LanguageTool-*/languagetool-commandline.jar $HOME/languagetool/languagetool-commandline.jar
popd
