#!/bin/bash
set -e

echo "Criando databases no RDS..."

echo $RDS_ENDPOINT
echo $RDS_USER
echo $RDS_PASSWORD

psql "host=$RDS_ENDPOINT port=5432 dbname=postgres user=$RDS_USER sslmode=require password=$RDS_PASSWORD" << EOF
DO \$\$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_database WHERE datname = 'gerenciador_oficina_notificacao'
   ) THEN
      CREATE DATABASE gerenciador_oficina_notificacao;
   END IF;
END
\$\$;
EOF
