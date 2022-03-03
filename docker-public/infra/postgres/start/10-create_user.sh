#!/bin/bash
set -e

POSTGRES="psql"

echo "Creating database role: keycloak"
${POSTGRES} <<-EOSQL
CREATE USER keycloak WITH CREATEDB PASSWORD 'keycloak';
EOSQL

echo "Creating database role: data_server"
${POSTGRES} <<-EOSQL
CREATE USER data_server WITH SUPERUSER PASSWORD 'data_server';
EOSQL
