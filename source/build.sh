#!/bin/sh

(cd backend && ./build.sh)
(cd frontend && ./build.sh)
(cd database && ./build.sh)
