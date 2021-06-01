#start both of these processes in parallel - cmd to start sql server must be last to initialize the fhirstore
./init-fhirstore-db.sh & /opt/mssql/bin/sqlservr