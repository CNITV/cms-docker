#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER cmsuser WITH PASSWORD '$CMS_PASSWORD';
	CREATE DATABASE cmsdb WITH OWNER cmsuser;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname cmsdb <<-EOSQL
	ALTER SCHEMA public OWNER TO cmsuser;
	GRANT SELECT ON pg_largeobject TO cmsuser;
EOSQL
