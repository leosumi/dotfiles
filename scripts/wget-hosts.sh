#! /bin/sh
# Get hosts file from StevenBlack
# by Léo Sumi

hosts_bak="/etc/hosts.bak"
hosts="/etc/hosts"

# Save the original hosts file (Do not delete it)
if [ ! -e "$hosts_bak" ]; then
    sudo cp $hosts $hosts_bak
fi

# Get the new hosts file
cd /tmp || exit 1
wget -O new-hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts

# Check for date
new_hosts_date=$(grep "# Date:" new-hosts | cut -d " " -f 3,4,5)
cur_hosts_date=$(grep "# Date:" $hosts | cut -d " " -f 3,4,5)
if [ "$cur_hosts_date" = "$new_hosts_date" ]; then
    echo "The hosts file is already up-to-date: $cur_hosts_date"
    rm new-hosts
    exit 0
fi

# Update the current hosts file
echo "The hosts file is out-of-date"
echo "current version: $cur_hosts_date"
echo "latest version: $new_hosts_date"
sudo cp $hosts_bak $hosts
cat new-hosts | sudo tee -a $hosts > /dev/null
rm new-hosts
cd - || exit
