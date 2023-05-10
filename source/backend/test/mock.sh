#!/bin/zsh

p=$(realpath $0)
c=$(dirname $p)/curl.sh


$c user/signup "mario" "password" "mario@example.com" "Codemonkey"
$c user/signup "giuseppe" "password" "giuseppe@example.com" "Codemonkey"