
# YES THIS IS NECESSARY IF YOU WANT TO BE ABLE TO CREATE A DATABASE INSIDE THE CONTAINER ON STARTUP
# UNLIKE THE MAJORITY OF DB PLATFORMS, MSSQL DOESNT HAVE A MEANS TO RUN A SQL SCRIPT TO INITIALIZE THE DB
# https://stackoverflow.com/questions/58465609/docker-compose-sql-server-creating-a-database-and-tables-automatically-upon-star
FROM microsoft/mssql-server-windows-express:latest

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]

COPY . /

WORKDIR /

RUN dir

# Go..
CMD .\start -sa_password $env:sa_password -ACCEPT_EULA $env:ACCEPT_EULA -attach_dbs \"$env:attach_dbs\" -Verbose