/* CREATE THE FHIRSTORE LOGIN (iamnode) */
USE [master];
GO
CREATE LOGIN iamnode 
    WITH PASSWORD    = N'Pa55w0rd1!',
    CHECK_POLICY     = OFF,
    CHECK_EXPIRATION = OFF;
GO
/* CREATE THE fhirstore DB */
CREATE DATABASE fhirstore;
GO
USE fhirstore;
GO
/* CREATE THE DBO iamnode USER AND LINKE TO THE iamnode LOGIN */
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'iamnode')
BEGIN
    CREATE USER [iamnode] FOR LOGIN [iamnode]
    EXEC sp_addrolemember N'db_owner', N'iamnode'
END;
GO