#!/bin/bash

# # Generate the private key
openssl genrsa -out code.key 4096

# self signed cert
openssl req -new -x509 -key code.key -out code.crt -days 365 \
    -subj /CN=code-146.190.6.57.nip.io \
    -addext "subjectAltName = DNS:myserver.com, IP:146.190.6.57" \
    -addext "extendedKeyUsage = serverAuth"

# Generate a TLS secret
kubectl create secret tls code-tls --cert=code.crt --key=code.key -oyaml --dry-run=client >code-tls.yaml

# Apply secret
kubectl apply -f code-tls.yaml
