#!/bin/bash
set -e

POSTGRES="psql"

echo "Creating database: keycloak"
${POSTGRES} <<EOSQL
CREATE DATABASE keycloak OWNER keycloak;
EOSQL

echo "Creating database: data_server"
${POSTGRES} <<EOSQL
CREATE DATABASE data_server OWNER data_server;
EOSQL
