#!/bin/zsh

function user/signup {
	NAME=$1
	PASSWORD=$2
	EMAIL=$3
	TYPE=$4
	curl -X POST http://localhost:8080/api/user/signup -H "Content-Type: application/json" -d "{\"signup\": {\"username\": \"$NAME\", \"email\": \"$EMAIL\", \"password\": \"$PASSWORD\", \"type\": \"$TYPE\" }}"
}

function user/login {
	NAME=$1
	PASSWORD=$2
	TOTP=$3
	curl -X POST http://localhost:8080/api/user/login -H "Content-Type: application/json" -d "{\"login\": {\"username\": \"$NAME\", \"password\": \"$PASSWORD\", \"totp\":\"$TOTP\" }}"
}

function user/delete {
	JWT=$1
	curl -X POST http://localhost:8080/api/user/delete -H "Authorization: Bearer $JWT"
}

function user/logout {
	JWT=$1
	curl -X POST http://localhost:8080/api/user/logout -H "Authorization: Bearer $JWT"
}

function user/setttings {
	JWT=$1
	FILE=$2
	curl -X POST http://localhost:8080/api/user/settings -H "Authorization: Bearer $JWT" -H "Content-Type: multipart/form-data" -F "propic=@$FILE"
}

function user/propic/download {
	NAME=$1
	curl -X POST http://localhost:8080/api/user/propic/download -H "Content-Type: application/json" -d "{\"propic_download\": {\"username\": \"$NAME\"}}" --output "$NAME.webp"
}

function user/propic/upload {
	JWT=$1
	FILE=$2
	curl -X POST http://localhost:8080/api/user/propic/upload -H "Authorization: Bearer $JWT" -H "Content-Type: multipart/form-data" -F "propic=@$FILE"
}

function user/propic/delete {
	JWT=$1
	curl -X POST http://localhost:8080/api/user/propic/delete -H "Authorization: Bearer $JWT"
}


function project/new {
	JWT=$1
	TITLE=$2
	CODEMONKEY=$3
	curl -X POST http://localhost:8080/api/project/new -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"new\": {\"title\": \"$TITLE\", \"codemonkey\": \"$CODEMONKEY\"}}"
} 



f="$1"
shift
$f "$@"
