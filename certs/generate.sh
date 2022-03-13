#!/bin/bash

#################################################################
# Generate certificates
#
# Autor: Tiago Henrique Faxina
# Data: 03/01/2022
#
#
#################################################################

echo ''
echo 'GENERATING COMPONENT VERSION '$1
echo ''

# Generate Certificate Authority (CA) files
winpty openssl req -newkey rsa:4096 -x509 -keyout ca.key -out ca.crt -days 30 -nodes -subj "//CN=my_ca"

# Generate PEN files
cat ca.key > ca.pem
cat ca.crt >> ca.pem

# Generating Server Certificates 
winpty openssl req -newkey rsa:4096 -keyout server.key -out server.csr -nodes -days 30 -subj "//CN=localhost"

winpty openssl x509 -req -in server.csr -out server.crt -CA ca.crt -CAkey ca.key -CAcreateserial -days 30

# Generating Client/User Certificates
winpty openssl req -newkey rsa:4096 -keyout client.key -out client.csr -nodes -days 30 -subj "//CN=client"

winpty openssl x509 -req -in client.csr -out client.crt -CA ca.crt -CAkey ca.key -CAcreateserial -days 30

### display the contents of ca.crt
winpty openssl x509 -in ca.crt -text -noout

### display the contents of server.crt
winpty openssl x509 -in server.crt -text -noout

### display the contents of client.crt
winpty openssl x509 -in client.crt -text -noout
