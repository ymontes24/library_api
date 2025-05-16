-- Crear base de datos si no existe
CREATE DATABASE biblioteca_api_development;
CREATE DATABASE biblioteca_api_test;

-- Crear extensiones si es necesario
\c biblioteca_api_development;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

\c biblioteca_api_test;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";