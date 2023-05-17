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
	curl -X POST http://localhost:8080/api/user/settings -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"settings\": {\"first_name\": \"$FIRSNAME\", \"last_name\": \"$LASTNAME\", \"email\": \"$EMAIL\", \"password\": \"$PASSWORD\", \"bio\": \"$BIO\", \"technologies\": $TECHNOLOGIES }}"
}

function user/index {
	NAME=$1
	curl -X POST http://localhost:8080/api/user/index -H "Content-Type: application/json" -d "{\"index\": {\"username\": \"$NAME\"}}"
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

function technology/approve {
	JWT=$1
	NAME=$2
	curl -X POST http://localhost:8080/api/technology/approve -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"approve\": {\"name\": \"$NAME\"}}"
}

function technology/reject {
	JWT=$1
	NAME=$2
	curl -X POST http://localhost:8080/api/technology/reject -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"reject\": {\"name\": \"$NAME\"}}"
}



function project/new {
	JWT=$1
	TITLE=$2
	CODEMONKEY=$3
	TECHNOLOGIES=$4
	DESCRIPTION=$5
	curl -X POST http://localhost:8080/api/project/new -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"new\": {\"title\": \"$TITLE\", \"codemonkey\": \"$CODEMONKEY\", \"technologies\": $TECHNOLOGIES, \"description\": \"$DESCRIPTION\"}}"
}

function project/edit {
	JWT=$1
	ID=$2
	TITLE=$3
	CODEMONKEY=$4
	TECHNOLOGIES=$5
	DESCRIPTION=$6
	curl -X POST http://localhost:8080/api/project/edit -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"edit\": {\"id\": \"$ID\", \"title\": \"$TITLE\", \"codemonkey\": \"$CODEMONKEY\", \"technologies\": $TECHNOLOGIES, \"description\": \"$DESCRIPTION\"}}"
}

function project/accept {
	JWT=$1
	ID=$2
	curl -X POST http://localhost:8080/api/project/accept -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"accept\": {\"id\": \"$ID\"}}"
}

function project/reject {
	JWT=$1
	ID=$2
	curl -X POST http://localhost:8080/api/project/reject -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"reject\": {\"id\": \"$ID\"}}"
}

function project/interrupt {
	JWT=$1
	ID=$2
	COMMENT=$3
	curl -X POST http://localhost:8080/api/project/interrupt -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"interrupt\": {\"id\": \"$ID\", \"comment\": \"$COMMENT\"}}"
}

function project/terminate { 
	JWT=$1
	ID=$2
	RATING=$3
	COMMENT=$4
	curl -X POST http://localhost:8080/api/project/terminate -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"terminate\": {\"id\": \"$ID\", \"rating\": \"$RATING\", \"comment\": \"$COMMENT\"}}"
}

function project/index {
	ID=$1
	curl -X POST http://localhost:8080/api/project/index -H "Content-Type: application/json" -d "{\"index\": {\"id\": \"$ID\"}}"
}



function feed/home { 
	TYPE=$1
	TECHNOLOGIES=$2
	SEEN=$3
	curl -X POST http://localhost:8080/api/feed/home -H "Content-Type: application/json" -d "{\"home\": {\"type\": \"$TYPE\", \"technologies\": $TECHNOLOGIES, \"seen\": $SEEN}}"
}

function feed/user {
	USER=$1
	TECHNOLOGIES=$2
	SEEN=$3
	curl -X POST http://localhost:8080/api/feed/user -H "Content-Type: application/json" -d "{\"user\": {\"username\": \"$USER\", \"technologies\": $TECHNOLOGIES, \"seen\": $SEEN}}"
}

function feed/technologies {
	curl -X POST http://localhost:8080/api/feed/technologies
}



function report/send {
	JWT=$1
	NAME=$2
	DESCRIPTION=$3
	curl -X POST http://localhost:8080/api/report/send -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"send\": {\"to\": \"$NAME\", \"description\": \"$DESCRIPTION\"}}"
}

function report/ban {
	JWT=$1
	NAME=$2
	STATUS=$3
	REASON=$4
	curl -X POST http://localhost:8080/api/report/ban -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"ban\": {\"username\": \"$NAME\", \"status\": \"$STATUS\", \"reason\": \"$REASON\"}}"
}



function dashboard/actions {
	JWT=$1
	ID=$2
	curl -X POST http://localhost:8080/api/dashboard/actions -H "Authorization: Bearer $JWT" -H "Content-Type: application/json" -d "{\"actions\": {\"last_seen_id\": \"$ID\"}}"
}

function dashboard/technologies {
	JWT=$1
	curl -X POST http://localhost:8080/api/dashboard/technologies -H "Authorization: Bearer $JWT"
}

f="$1"
shift
$f "$@"
