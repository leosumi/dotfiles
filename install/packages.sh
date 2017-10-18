#! /bin/bash

# Checking packages list
tput setaf 2
echo "Checking packages list"
echo "======================"
tput sgr0
while read package ; do
    # skip empty lines
    [ -z "$package" ] && continue
    # lines with # are comment
    [[ "$package" =~ ^#.*$ ]] && continue

    echo "Checking $package"
    apt show $package > /dev/null 2>&1
    if [ "$?" -ne "0" ]; then
        tput setaf 1; echo "WARNING $package does not exist"; tput sgr0
    fi
done < packages.list

# Installation
tput setaf 2
echo ""
echo "Installation"
echo "============"
tput sgr0
while read package ; do
    # skip empty lines
    [ -z "$package" ] && continue
    # lines with # are comment
    [[ "$package" =~ ^#.*$ ]] && continue

    apt show $package > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
        echo "Installing $package"
        apt install --assume-yes $package > /dev/null 2>> packages.log
    fi
done < packages.list

