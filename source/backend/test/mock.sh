#!/bin/zsh

p=$(realpath $0)
c=$(dirname $p)/curl.sh
o=$(dirname $p)/totp_generator.py


$c user/signup "mario" "password" "mario@example.com" "Codemonkey" #| jq -r '.otp_provisioning_uri' | xargs $o
$c user/signup "giuseppe" "password" "giuseppe@example.com" "Codemonkey"
$c user/signup "alberto" "password" "alberto@example.com" "Codemonkey"
$c user/signup "filippo" "password" "filippo@example.com" "Codemonkey"
$c user/signup "emanuele" "password" "emanuele@example.com" "Codemonkey"
