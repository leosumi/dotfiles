#!/bin/sh
# packages.sh -- installation of packages from packages.csv
# By Léo Sumi

packages_file="packages.csv"
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

pkgcheck()
{
    msg "Checking if $1 package exists -- $2"
    pacman -Si $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        # Package could be a group
        pacman -Sg $1 > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            return 0
        fi
        warning "$1 does not exist"
        return 1
    fi
}

pkginstall()
{
    if pkgcheck $1; then
        msg "Installing $1 package -- $2"
        sudo pacman --noconfirm -S $1 2>&1 | tee -a $log_file
    fi
}

aurcheck()
{
    msg "AUR: Checking if $1 package exists -- $2"
    yay -Si $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        warning "$1 does not exist"
        return 1
    fi
}

aurinstall()
{
    if aurcheck $1; then
        msg "AUR: Installing $1 package -- $2"
        yay --noconfirm -S $1 2>&1 | tee -a $log_file
    fi
}

check()
{
    echo "Checking packages list"
    echo "======================"
    sed "s/\s*#.*//g; /^\s*$/ d" $packages_file | while IFS=, read tag pkg description ; do
        case $tag in
            "a") aurinstall $pkg $description ;;
            *) pkginstall $pkg $description ;;
        esac
    done
}

install()
{
    echo "Installation"
    echo "============"
    sed "s/\s*#.*//g; /^\s*$/ d" $packages_file | while IFS=, read tag pkg description ; do
        case $tag in
            "a") aurcheck $pkg $description ;;
            *) pkgcheck $pkg $description ;;
        esac
    done
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
