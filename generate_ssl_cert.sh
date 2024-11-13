#!/bin/bash

# Set the path and name for the certificate and key files
CERT_DIR="./certificates"
CERT_NAME="pioneer"
CERT_FILE="${CERT_DIR}/${CERT_NAME}.crt"
KEY_FILE="${CERT_DIR}/${CERT_NAME}.key"

# Create the directory for the certificates if it doesn't exist
mkdir -p "$CERT_DIR"

# Generate the certificate and private key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "$KEY_FILE" \
  -out "$CERT_FILE" \
  -subj "/C=IT/ST=Italy/L=Local/O=PIONEER/CN=$1"

echo "Certificate and key generated in: $CERT_DIR"
echo "Certificate: $CERT_FILE"
echo "Key: $KEY_FILE"