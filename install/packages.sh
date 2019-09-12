#!/bin/sh
# packages.sh -- installation of packages from packages.list
# By Léo Sumi

packages_file="packages.list"
log_file="packages.log"

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

msg()
{
    echo_green "MESSAGE: $1" | tee -a $log_file
}

warning()
{
    echo_red "WARNING: $1" | tee -a $log_file
}

error()
{
    echo_red "ERROR: $1" | tee -a $log_file
}

debcheck()
{
    msg "Checking if $1 deb package exists"
    apt-cache show $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
	    return 1
    fi
}

debinstall()
{
    if debcheck $1; then
        msg "Installing $1 deb package"
        sudo apt-get install --assume-yes $1 2>&1 | tee -a $log_file
    fi
}

snapcheck()
{
    msg "Checking if $1 snap package exists"
    snap info $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
	    return 1
    fi
}

snapinstall()
{
    if snapcheck $1; then
        msg "Installing $1 snap package"
        sudo snap install $1 2>&1 | tee -a $log_file
    fi
}

pacmancheck()
{
    msg "Checking if $1 package exists"
    pacman -Si $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
        return 1
    fi
}

pacmaninstall()
{
    if pacmancheck $1; then
        msg "Installing $1 package"
        sudo pacman --noconfirm -S $1 2>&1 | tee -a $log_file
    fi
}

aurcheck()
{
    msg "Checking if $1 package exists in AUR"
    yay -Si $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
        return 1
    fi
}

aurinstall()
{
    if aurcheck $1; then
        msg "Installing $1 package from AUR"
        yay --noconfirm -S $1 2>&1 | tee -a $log_file
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
    # Check for snap support
    snap > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "snap packages are not supported, install snapd"
    fi

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
    # Enable snap support
    snap > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        aurinstall snapd
        sudo systemctl enable --now snapd.socket
    fi

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
    echo "Checking packages list"
    echo "======================"
    current_distribution=`lsb_release --short --id`
    case "$current_distribution" in
        "Ubuntu") ubuntu_check ;;
        "ManjaroLinux") manjaro_check ;;
        *) error "Your distribution is not compatible" ;;
    esac
}

install()
{
    echo "Installation"
    echo "============"
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
