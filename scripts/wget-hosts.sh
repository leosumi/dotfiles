#! /bin/sh
# Get hosts file from StevenBlack
# by Léo Sumi

hosts_bak="/etc/hosts.bak"
hosts="/etc/hosts"
hosts_dl="/tmp/new-hosts"

whitelist()
{
    sudo sed -i '/^# Reddit$/,/^$/d' $hosts
}

# Save the original hosts file (Do not delete it)
if [ ! -e "$hosts_bak" ]; then
    sudo cp $hosts $hosts_bak
fi

# Get the new hosts file
wget -qO $hosts_dl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts

# Check for date and update the current hosts file if out-of-date
new_hosts_date=$(grep "# Date:" $hosts_dl | cut -d " " -f 3,4,5)
cur_hosts_date=$(grep "# Date:" $hosts | cut -d " " -f 3,4,5)
if [ "$cur_hosts_date" = "$new_hosts_date" ]; then
    echo "The hosts file is already up-to-date ($cur_hosts_date)."
else
    echo "The hosts file is out-of-date"
    echo "Old version: $cur_hosts_date"
    echo "New version: $new_hosts_date"
    sudo cp $hosts_bak $hosts
    cat $hosts_dl | sudo tee -a $hosts > /dev/null
    whitelist
fi

rm $hosts_dl
