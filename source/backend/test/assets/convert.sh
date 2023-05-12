#!/bin/bash

convert $1 -gravity center -resize 400x400^ -crop 400x400+0+0 -define webp:lossless=False out-$1
