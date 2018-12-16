#! /bin/bash

# packages.sh -- installation of packages from packages.list
# By Léo Sumi

helpmsg() {
    echo "Use --check or --install argument"
}

echowarning() {
    tput setaf 1; echo $1; tput sgr0
}

debcheck() {
    echo "Checking if $1 deb package exists"
    apt show $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echowarning "WARNING $1 does not exist"
	return 1
    fi
}

debinstall() {
    if debcheck "$1"; then
        echo "Installing $1 deb package"
        sudo apt install --assume-yes $1 > /dev/null 2>> packages.log
    fi
}

snapcheck() {
    echo "Checking if $1 snap package exists"
    snap info $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echowarning "WARNING $1 does not exist"
	return 1
    fi
}

snapinstall() {
    if snapcheck "$1"; then
        echo "Installing $1 snap package"
        sudo snap install $1 > /dev/null 2>> packages.log
    fi
}

check() {
    tput setaf 2
    echo "Checking packages list"
    echo "======================"
    tput sgr0
    sed "s/\s*#.*//g; /^\s*$/ d" packages.list | while read package ; do
        debcheck "$package"
    done
}

install() {
    tput setaf 2
    echo ""
    echo "Installation"
    echo "============"
    tput sgr0
    sed "s/\s*#.*//g; /^\s*$/ d" packages.list | while read package ; do
	    debinstall "$package"
    done < packages.list
}

# execution

# no argument
if [ -z "$1" ]; then
    helpmsg
    exit 1
fi


if [ "$1" = "--check" ]; then
    check
    exit
fi

if [ "$1" = "--install" ]; then
    install
    exit
fi

# invalid arguments
if [ "$1" ]; then
    echo "packages.sh error: Invalid argument"
    helpmsg
    exit 1
fi
