#!/bin/sh

(cd nginx && ./build.sh && ./push.sh)
(cd backend && ./build.sh && ./push.sh)
(cd frontend && ./build.sh && ./push.sh)
(cd database && ./build.sh && ./push.sh)

ssh valerioiacobucci.com 'cd ~/source/codemonkey; docker-compose pull; docker-compose up -d'
