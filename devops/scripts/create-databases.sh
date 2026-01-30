#!/bin/bash
set -e

echo "Criando databases no RDS..."

echo "RDS_ENDPOINT=$RDS_ENDPOINT"
echo "RDS_USER=$RDS_USER"


psql "host=$RDS_ENDPOINT \
      user=$RDS_USER \
      password=$RDS_PASSWORD \
      dbname=postgres sslmode=require" << EOF

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
