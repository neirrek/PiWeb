# !/bin/sh

cd /home/pi/piweb

sudo rackup -o 0.0.0.0 -p 15117 > /dev/null 2>&1 &
