USE [master];
GO
CREATE LOGIN fhir_appliance_db_user 
    WITH PASSWORD    = N'[YOUR_PASSWORD_HERE]',
    CHECK_POLICY     = OFF,
    CHECK_EXPIRATION = OFF;
GO
CREATE DATABASE fhirstore;
GO
USE fhirstore;
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'fhir_appliance_db_user')
BEGIN
    CREATE USER [fhir_appliance_db_user] FOR LOGIN [fhir_appliance_db_user]
    EXEC sp_addrolemember N'db_owner', N'fhir_appliance_db_user'
END;
GO
