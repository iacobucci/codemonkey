#!/bin/sh

# (cd ./database/ && run.sh) &
(cd ./backend/ && ./devel.sh) &
(cd ./frontend/ && npx ng serve) &

# avviamo come root, si potrebbe fare di meglio :(
sudo nginx -c $(pwd)/devel.conf

wait