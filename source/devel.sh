#!/bin/sh

(cd ./database/ && ./run.sh) &
(cd ./backend/ && ./devel.sh) &
(cd ./frontend/ && ./devel.sh) &

# avviamo come root, si potrebbe fare di meglio :(
sudo nginx -c $(pwd)/devel.conf

wait

docker stop codemonkey-database-image
