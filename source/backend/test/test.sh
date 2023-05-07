#!/bin/bash 

function signup {
	curl -X POST http://localhost:8080/api/signup -H "Content-Type: application/json" -d '{ "signup": {"username": "mario", "email" : "mario@example.com", "password": "mario", "kind":"codemonkey" }}'
}

function login {
	TOTP=$1
	curl -X POST http://localhost:8080/api/login -H "Content-Type: application/json" -d "{\"login\": {\"username\": \"mario\", \"password\": \"mario\", \"totp\":\"$TOTP\" }}"
}

function delete {
	JWT=$1
	curl -X POST http://localhost:8080/api/delete -H "Authentication: Bearer $JWT"
}
