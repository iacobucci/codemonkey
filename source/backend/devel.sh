#!/bin/sh

p=$(realpath $0)
env=$(dirname $p)/.env

export $(cat $env | xargs)

rails db:migrate

rails server
