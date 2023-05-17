#!/bin/python3

from pyngrok import ngrok

#read NGROK_AUTH_TOKEN from backend/.env
with open("backend/.env", "r") as f:
    lines = f.readlines()
    for line in lines:
        if "NGROK_AUTH_TOKEN" in line:
            ngrok_authtoken = line.split("=")[1].strip()
            break

            
ngrok.set_auth_token(ngrok_authtoken)
tunnel = ngrok.connect(8080, "http")
url = tunnel.data["public_url"]
url = url.replace("tcp://", "")
url, port = url.split(":")

print(tunnel.data["public_url"])
ngrok_process = ngrok.get_ngrok_process().proc.wait()