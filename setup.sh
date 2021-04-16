# DHT
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat

TRACKER=$(curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',')
ran=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

echo "Update tracker $TRACKER"
echo "bt-tracker=$TRACKER" >> /app/aria2.conf

echo "Update peer-id-prefix=-TR2940-$ran"
echo "peer-id-prefix=-TR2940-$ran" >> /app/aria2.conf

mkdir /app/gautam
wget -O /app/gautam/gclone.gz https://git.io/JJMSG
gzip -d /app/gautam/gclone.gz
#chmod 0775 /app/gautam/gclone

chmod +x /app/extract /app/gautam/gclone

if [[ -n $RCLONE_CONFIG ]]; then
	echo "Rclone config detected"
	echo -e "$RCLONE_CONFIG" > /app/rclone.conf
fi
