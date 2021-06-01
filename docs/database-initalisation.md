# Yorkshire and Humber FHIR Appliance - Database initialisation

---

The FHIR Appliance supports Postgres and Microsoft SQL Server platforms.

---

### Configure the database

Connecting the FHIR Appliance to an external database server is a two step process:

1. Create necessary database and associated user accounts on the target database server.
2. Modify the relevant section of the FHIR Appliance configuration file with a database connection string. 

As with containerised databases, the FHIR Appliance supports connecting to existing Postgres and Microsoft SQL server database platforms. The following steps describe the database configuration process.

> Please ensure that the target database server is accessible from the machine hosting the FHIR Appliance.


## Create the database and user role - Postgres

1. Logon to your existing Postgres server with an account that has sufficient privileges to create databases and roles.
2. Create the FHIR Appliance login role by executing the following SQL (replacing password with one of your choice):

```sql
CREATE ROLE fhir-appliance-db-user WITH
  LOGIN
  SUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  REPLICATION
  UNENCRYPTED PASSWORD '[YOUR_PASSWORD_HERE]';
```

3. Make a note of the password as you will need it later.

> If you wish to alter the permissions granted to the fhir-appliance-db-user then please feel free to do so in line with your own/your organisation's database user policy. The role MUST be able to create and alter database schemas and tables in addition to executing CREATE, UPDATE, DELETE and SELECT queries.

4. Create the FHIR Appliance database by executing the following SQL:

```sql
CREATE DATABASE fhirstore WITH 
    OWNER = fhir-appliance-db-user
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
```

This completes the setup necessary for Postgres.

## Create the database and user, login, user and role - Microsoft SQL Server 

1. Logon to your existing Microsoft SQL Server with an account that has sufficient privileges to create databases, logins, users and roles.

2. Create the FHIR Appliance login by executing the following SQL (replace password with one your choosing):

```sql
USE [master];
GO
CREATE LOGIN fhir_appliance_db_user 
    WITH PASSWORD    = N'[YOUR_PASSWORD_HERE]',
    CHECK_POLICY     = OFF,
    CHECK_EXPIRATION = OFF;
GO
```

3. Make a note of the password as you will need it later.

4. Create the FHIR Appliance database by executing the following SQL:
   
```sql
GO
CREATE DATABASE fhirstore;
GO
```

5. Create the FHIR Appliance user and link to the `fhir_appliance_db_user` login created in step 2 by executing the following SQL:

```sql
USE fhirstore;
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'fhir_appliance_user')
BEGIN
    CREATE USER [fhir_appliance_db_user] FOR LOGIN [fhir_appliance_db_user]
    EXEC sp_addrolemember N'db_owner', N'fhir_appliance_db_user'
END;
GO
```
 
## You're done

### Where next?

[Home](../README.md)