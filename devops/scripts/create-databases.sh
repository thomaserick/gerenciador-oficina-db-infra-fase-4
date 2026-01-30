#!/bin/bash
set -e

echo "Criando databases no RDS..."

echo $RDS_ENDPOINT
echo $RDS_USER
echo $RDS_PASSWORD

psql "host=$RDS_ENDPOINT port=5432 user=$RDS_USER sslmode=require password=$RDS_PASSWORD" -c "CREATE DATABASE gerenciador_oficina_notificacao;"
