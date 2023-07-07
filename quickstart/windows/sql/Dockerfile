FROM mcr.microsoft.com/mssql/server:2019-latest
COPY ./ /
# Switch to root user so that exec perms can be granted to init-fhirstore script
USER root
# Grant permissions for the init sh so that it is executable
RUN chmod +x init-fhirstore-db.sh
# Run entrypoint under mssql user
USER mssql
# Go..
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
