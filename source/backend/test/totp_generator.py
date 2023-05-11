#!/bin/python3

import pyotp
import sys

if len(sys.argv) != 2:
    print("Usage: python totp_generator.py <provisioning_uri>")
    sys.exit(1)

provisioning_uri = sys.argv[1]
totp = pyotp.TOTP(pyotp.parse_uri(provisioning_uri).secret)
print(totp.now())
