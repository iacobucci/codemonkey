#!/bin/bash

function signup {
	USERNAME=$1
	PASSWORD=$2
	EMAIL=$3
	KIND=$4
	curl -X POST http://localhost:8080/api/signup -H "Content-Type: application/json" -d "{\"signup\": {\"username\": \"$USERNAME\", \"email\": \"$EMAIL\", \"password\": \"$PASSWORD\", \"kind\": \"$KIND\" }}" | tee > ( jq .otp_provisioning_uri | tr -d '"' )  
}

function login {
	USERNAME=$1
	PASSWORD=$2
	TOTP=$3
	curl -X POST http://localhost:8080/api/login -H "Content-Type: application/json" -d "{\"login\": {\"username\": \"$USERNAME\", \"password\": \"$PASSWORD\", \"totp\":\"$TOTP\" }}"
}

function delete {
	JWT=$1
	curl -X POST http://localhost:8080/api/delete -H "Authentication: Bearer $JWT"
}

f="$1"
shift
$f "$@"
