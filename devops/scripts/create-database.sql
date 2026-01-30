DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_database WHERE datname = 'gerenciador_oficina_notificacao'
   ) THEN
      CREATE DATABASE gerenciador_oficina_notificacao;
END IF;
END
$$;
