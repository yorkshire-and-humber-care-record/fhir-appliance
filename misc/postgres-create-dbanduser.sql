CREATE ROLE fhir-appliance-db-user WITH
  LOGIN
  SUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  REPLICATION
  UNENCRYPTED PASSWORD '[YOUR_PASSWORD_HERE]';

CREATE DATABASE fhirstore WITH 
    OWNER = fhir-appliance-db-user
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
