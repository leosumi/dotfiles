#!/bin/sh
# packages.sh -- installation of packages from packages.list
# By Léo Sumi

packages_file="packages.list"

help_msg()
{
    echo "Use --check or --install argument"
}

echo_red()
{
    tput setaf 1; echo $1; tput sgr0
}

echo_green()
{
    tput setaf 2; echo $1; tput sgr0
}

warning()
{
    echo_red "WARNING: $1"
}

error()
{
    echo_red "ERROR: $1"
}

debcheck()
{
    echo "Checking if $1 deb package exists"
    apt show $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
	    return 1
    fi
}

debinstall()
{
    if debcheck $1; then
        echo "Installing $1 deb package"
        sudo apt install --assume-yes $1 > /dev/null 2>> packages.log
    fi
}

snapcheck()
{
    echo "Checking if $1 snap package exists"
    snap info $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
	    return 1
    fi
}

snapinstall()
{
    if snapcheck $1; then
        echo "Installing $1 snap package"
        sudo snap install $1 > /dev/null 2>> packages.log
    fi
}

pacmancheck()
{
    echo "Checking if $1 package exists"
    pacman -Si $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
        return 1
    fi
}

pacmaninstall()
{
    if pacmancheck $1; then
        echo "Installing $1 package"
        sudo pacman -S $1 > /dev/null 2>> packages.log
    fi
}

aurcheck()
{
    echo "Checking if $1 package exists in AUR"
    pamac info $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
        return 1
    fi
}

aurinstall()
{
    if aurcheck $1; then
        echo "Installing $1 package from AUR"
        sudo pamac install $1 > /dev/null 2>> packages.log
    fi
}

ubuntu_check()
{
    sed "s/\s*#.*//g; /^\s*$/ d" $packages_file | while IFS=, read ubuntu_tag manjaro_tag package ; do
        case $ubuntu_tag in
            "d") debcheck $package ;;
            "s") snapcheck $package ;;
            "") continue ;;
            *) error "Invalid ubuntu tag in $packages_file" ;;
        esac
    done
}

ubuntu_install()
{
    sed "s/\s*#.*//g; /^\s*$/ d" $packages_file | while IFS=, read ubuntu_tag manjaro_tag package ; do
        case $ubuntu_tag in
            "d") debinstall $package ;;
            "s") snapinstall $package ;;
            "") continue ;;
            *) error "Invalid ubuntu tag in $packages_file" ;;
        esac
    done
}

manjaro_check()
{
    sed "s/\s*#.*//g; /^\s*$/ d" $packages_file | while IFS=, read ubuntu_tag manjaro_tag package ; do
        case $manjaro_tag in
            "p") pacmancheck $package ;;
            "a") aurcheck $package ;;
            "s") snapcheck $package ;;
            "") continue ;;
            *) error "Invalid manjaro tag in $packages_file" ;;
        esac
    done
}

manjaro_install()
{
    sed "s/\s*#.*//g; /^\s*$/ d" $packages_file | while IFS=, read ubuntu_tag manjaro_tag package ; do
        case $manjaro_tag in
            "p") pacmaninstall $package ;;
            "a") aurinstall $package ;;
            "s") snapinstall $package ;;
            "") continue ;;
            *) error "Invalid manjaro tag in $packages_file" ;;
        esac
    done
}

check()
{
    echo_green "Checking packages list"
    echo_green "======================"
    current_distribution=`lsb_release --short --id`
    case "$current_distribution" in
        "Ubuntu") ubuntu_check ;;
        "ManjaroLinux") manjaro_check ;;
        *) error "Your distribution is not compatible" ;;
    esac
}

install()
{
    echo_green "Installation"
    echo_green "============"
    current_distribution=`lsb_release --short --id`
    case "$current_distribution" in
        "Ubuntu") ubuntu_install ;;
        "ManjaroLinux") manjaro_install ;;
        *) error "Your distribution is not compatible" ;;
    esac
}

# execution

# no argument
if [ -z "$1" ]; then
    help_msg
    exit
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
    error "Invalid arguments"
    help_msg
    exit 1
fi
