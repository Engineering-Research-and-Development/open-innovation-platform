#!/bin/bash

# Set the path and name for the certificate and key files
CERT_DIR="./conf/traefik/certs"
CERT_NAME="pioneer"
CERT_FILE="${CERT_DIR}/fullchain.pem"
KEY_FILE="${CERT_DIR}/privkey.pem"

rm -f "$CERT_FILE" "$KEY_FILE"

# Create the directory for the certificates if it doesn't exist
mkdir -p "$CERT_DIR"

# Generate the certificate and private key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$KEY_FILE" \
  -out "$CERT_FILE" \
  -subj "/C=IT/ST=Italy/L=Local/O=PIONEER/CN=$1" \
  -addext "subjectAltName = DNS:keycloak.$1,DNS:grafana.$1,DNS:iotagent-ui.$1,DNS:minio.$1,DNS:orion.$1,DNS:draco.$1,DNS:pgadmin.$1"

echo "Certificate and key generated in: $CERT_DIR"
echo "Certificate: $CERT_FILE"
echo "Key: $KEY_FILE"
echo "Subj: /C=IT/ST=Italy/L=Local/O=PIONEER/CN=$1"
