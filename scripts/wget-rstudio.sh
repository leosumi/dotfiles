#! /bin/bash
# Get Rstudio (Ubuntu 16.04+/Debian 9+ 64-bit)
# by Léo Sumi

latest_ver=$(curl -s http://download1.rstudio.org/current.ver)
installed_ver=$(apt-cache show rstudio | grep Version: | cut -d " " -f 2)

# Modify latest version
latest_ver=$(echo "$latest_ver" | cut -d "-" -f 1)

# Check the installed version of Rstudio
if [ "$installed_ver" = "$latest_ver" ]; then
    echo "Rstudio is already up-to-date ($installed_ver)"
    exit 0
fi

# Check if gdebi is installed
dpkg-query -l gdebi-core > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "gdebi is not installed: install gdebi-core"
    sudo apt install gdebi-core
fi

# wget and install Rstudio
echo "Rstudio is out-of-date"
echo "current version: $installed_ver"
echo "latest version:  $latest_ver"
pushd /tmp
wget -O rstudio.deb https://download1.rstudio.org/desktop/bionic/amd64/rstudio-$latest_ver-amd64.deb
sudo gdebi rstudio.deb
rm rstudio.deb
popd
