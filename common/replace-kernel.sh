wget -O - https://liquorix.net/liquorix-keyring.gpg | apt-key add -
echo "deb http://liquorix.net/debian stable main" > /etc/apt/sources.list.d/liquorix.list
apt-get update -y
apt-get install linux-image-liquorix-amd64 -y
apt-get install linux-headers-liquorix-amd64 -y
