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

function user/settings {
	#works for codemonkey
	JWT=$1
	EMAIL=$2
	PASSWORD=$3
	TECHNOLOGIES=$4
	BIO=$5
	FIRSNAME=$6
	LASTNAME=$7
	curl -X POST http://localhost:8080/api/user/settings -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"settings\": {\"first_name\": \"$FIRSNAME\", \"last_name\": \"$LASTNAME\", \"email\": \"$EMAIL\", \"password\": \"$PASSWORD\", \"bio\": \"$BIO\", \"technologies\": \"$TECHNOLOGIES\" }}"
	# curl -X POST http://localhost:8080/api/user/settings -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"settings\": {\"email\": \"$EMAIL\", \"password\": \"$PASSWORD\", \"technologies\": \"$TECHNOLOGIES\" , \"bio\": \"$BIO\"}}"
}

function user/propic/download {
	NAME=$1
	curl -X POST http://localhost:8080/api/user/propic/download -H "Content-Type: application/json" -d "{\"propic_download\": {\"username\": \"$NAME\"}}" --output "$NAME.jpg"
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

function technology/suggest {
	JWT=$1
	NAME=$2
	curl -X POST http://localhost:8080/api/technology/suggest -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"suggest\": {\"name\": \"$NAME\"}}"
}

#TODO test

function technology/approve {
	JWT=$1
	NAME=$2
	curl -X POST http://localhost:8080/api/technology/approve -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"approve\": {\"id\": \"$NAME\"}}"
}

#TODO test

function technology/reject {
	JWT=$1
	NAME=$2
	curl -X POST http://localhost:8080/api/technology/reject -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"reject\": {\"id\": \"$NAME\"}}"
}

function project/new {
	JWT=$1
	TITLE=$2
	CODEMONKEY=$3
	curl -X POST http://localhost:8080/api/project/new -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"new\": {\"title\": \"$TITLE\", \"codemonkey\": \"$CODEMONKEY\"}}"
}

function card/user {
	NAME=$1
	curl -X POST http://localhost:8080/api/card/user -H "Content-Type: application/json" -d "{\"user\": {\"username\": \"$NAME\"}}"
}

f="$1"
shift
$f "$@"
