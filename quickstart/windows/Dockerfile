
# YES THIS IS NECESSARY IF YOU WANT TO BE ABLE TO CREATE A DATABASE INSIDE THE CONTAINER ON STARTUP
# UNLIKE THE MAJORITY OF DB PLATFORMS, MSSQL DOESNT HAVE A MEANS TO RUN A SQL SCRIPT TO INITIALIZE THE DB
# https://stackoverflow.com/questions/58465609/docker-compose-sql-server-creating-a-database-and-tables-automatically-upon-star
FROM microsoft/mssql-server-windows-express:latest
COPY ./ /
# Switch to root user so that exec perms can be granted to init-fhirstore script
USER root
# Grant permissions for the init sh so that it is executable
RUN chmod +x init-fhirstore-db.sh
# Run entrypoint under mssql user
USER mssql
# Go..
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]