#!/bin/bash
docker run --name codemonkey-database-image -p 5432:5432 -d iacobucci/codemonkey-database || docker start codemonkey-database-image
