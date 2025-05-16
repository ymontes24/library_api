FROM postgres:14

# Copiar scripts de inicialización
COPY ./init.sql /docker-entrypoint-initdb.d/

# Variables de entorno configuradas en docker-compose
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=biblioteca_api_development

EXPOSE 5432