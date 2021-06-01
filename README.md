# Yorkshire and Humber FHIR Appliance
Web: [Yorkshire and Humber Care Record](https://yhcr.org)  
Twitter: [@YHCareRecord](https://twitter.com/YHCareRecord/)

---

# This repo is currently under development

# What is the FHIR Appliance?
The FHIR Appliance is a FHIR server which was built by, and for, the [Yorkshire and Humber Care Record](https://yhcr.org). The work was carried out by the (YHCR) project team as part of their work with the [NHS England Local Health and Care Record Exampler](https://www.england.nhs.uk/publication/local-health-and-care-record-exemplars/) (LHCRE) programme. A public git repository containing the sourcecode will be available soon but for now interested parties and members of the YHCR programme are encouraged to use the software via the docker and node.js components hosted here. The FHIR Appliance has been developed using a stack of open source software and health care interoperability standards, namely:

[Fast Healthcare Interoperable Resources - FHIR](https://fhir.hl7.org.uk)
Fast Healthcare Interoperability Resources is a standard describing data formats and elements and an application programming interface for exchanging electronic health records. The standard was created by the Health Level Seven International health-care standards organization.

[Moleculer.js](https://moleculer.services)
A Progressive microservices framework for Node.js.

[PostgreSQL](https://www.postgresql.org)
PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and technical standards compliance. It is designed to handle a range of workloads, from single machines to data warehouses or Web services with many concurrent users.

[Microsoft SQL Servier](https://www.microsoft.com/en-gb/sql-server)
Microsoft SQL Server, often called "sequel server", is a commercial product developed and maintained by Microsoft. The FHIR Appliance can work with Express editions.

[Docker](https://www.docker.com)
Docker is a set of coupled software-as-a-service and platform-as-a-service products that use operating-system-level virtualization to develop and deliver software in packages called containers.

The FHIR Appliance has been developed in accordance to a series of [technical papers](https://yhcr.org/downloads/) produced by the [YHCR](https://yhcr.org). Each design paper describes a set of "model" software components and architectures that, when realised, can enable health and social care organisations to share data using [FHIR](https://www.hl7.org/fhir/STU3/). 

The FHIR Appliance will keep evolving in step with both the LHCRE, YHCR and other NHS regional shared care record programmes. The overall aim, however, is that the server will provide an out of the box, open source solution to health and social care organisations who require the ability to share data using FHIR.

---

# Getting started
The following steps describe how to get the current version of the FHIR Appliance up and running within your local environment. 

## Pre-requisites

### Git
If you haven't already got it, then please install [git](https://www.git-scm.com). If you prefer, you can install the [github desktop client](https://desktop.github.com)... NOTE: Other git clients are available!

### Docker Desktop
For developers, Docker Desktop is required to run the FHIR Appliance. There are lots of documents which describe the installation of [Docker Desktop](https://www.docker.com/products/docker-desktop) and this is all that is needed to run the server on your local machine (for Mac, Linux and Windows 10). Installations on Windows Server 2016, 2019 and Ubuntu are accessible via the links in the [Choose your flavour section](#choose-your-flavour) below.

### Docker Compose
[Docker Compose](https://docs.docker.com/compose/) affords the ability to "spin up" an entire stack of Docker containers in one simple command. The FHIR Appliance repo includes a docker-compose.yml file which defines each service along with the docker command to get the container up and running. Installations on Windows Server 2016, 2019 and Ubuntu are accessible via the links in the [Choose your flavour section](#choose-your-flavour) below.

### Database Server (Optional)
You can connect the FHIR Appliance to an existing [Microsoft SQL Server](https://www.microsoft.com/en-gb/sql-server/sql-server-downloads) or [Postgres](https://www.postgresql.org) database server if you have one.

### Node.js (Optional)
[Node](https://nodejs.org/en/) isn't required to run the FHIR Appliance, however, this repo comes with npm scripts which make it easier to run the software from a single command line call.

### Development Environment/Editor
The flavour of dev environment is of course entirely up to you... the FHIR Appliance ultimately doesn't care! [VS Code](https://code.visualstudio.com), [Atom](https://atom.io) and [Sublime](https://www.sublimetext.com) are extensible, open source and free. Each environment does have decent Docker integration which can be installed via the usual plugin/extension management features.

---

## Launching The FHIR Appliance

### Get the source (requires Git installed)

1. Either navigate to your local repo directory or create one, e.g. `C:\myrepos\` or `~/Repos`

2. Either [download and unzip](https://github.com/yorkshire-and-humber-care-record/fhir-appliance/archive/refs/heads/master.zip) the repository to this directory or, at your command line, type (followed by enter): `git clone https://github.com/yorkshire-and-humber-care-record/fhir-appliance.git`

3. Open the folder in your development environment and take a few minutes to have a look at the code (if you wish).

4. If you used `git clone` then, from your command line, type: `git checkout -b my-branch-name` where `my-branch-name` is whatever you want to call it (but please do not call it my-branch-name - lets be creative, people). This will create a local branch that you can change and modify as you see fit. 

> Note: If you used `git clone` and created a new branch then please review the `.gitignore` file if you wish to commit changes to your own branch.

5. If you have optionally installed [Node](https://nodejs.org/en/) type `npm install` followed by enter at the command line.

Read the remainder of this documentation to get up and running.

## Notes on configuring your FHIR Appliance to use HTTPS

> Example self-signed certificates are provided. The certificate, private key and root ca cannot not be used in production.

### One way TLS

If you wish to expose a FHIR API over HTTPS then you will need a certificate, private key and passphrase (if you used one). Ideally your certificate should be issued by certificate authority, but, for development purposes, you can use a [self-signed](docs/self-signed-cert.md) certificate. As above, for development purposes, example certificates are provided.

### Mutual TLS

If you require mutual TLS client authentication then you will need the CA root certificate of your server's certificate issuer. For development purposes, you can create your own root CA certificate and private key to sign your own certificates. Any clients using a mutal TLS enabled endpoint will need to send a certificate signed by the same CA in any requests to your FHIR Appliance. 

### Host file (Quickstart)

So that the common name for the certificates resolve locally you will need to add the following entries to your hosts file:

`127.0.0.1 appliance.development.yhcr.nhs.uk`

## Database Initialisation

If you wish to use database servers within your own network or the cloud then it is necessary to first create the database, users, roles and logins.

This [guide](docs/database-initalisation.md) provides the SQL scripts for both Postgres and Microsoft SQL Server.

### Setup and configuration guides

[YHCR FHIR Proxy Install 01 - Overview v1.docx](/docs/YHCR-FHIR-Proxy-Install-01-Overview-v1.docx)

[YHCR FHIR Proxy Install 02 - Server Preparation v1.docx](docs/YHCR-FHIR-Proxy-Install-02-Server-Preparation-v2.docx)

[YHCR FHIR Proxy Install 03 - Quickstart Install v1.docx](docs/YHCR-FHIR-Proxy-Install-03-Quickstart-Install-v1.docx)

[YHCR FHIR Proxy Install 04 - Quickstart Tour v1.docx](docs/YHCR-FHIR-Proxy-Install-04-Quickstart-Tour-v1.docx)

[YHCR FHIR Proxy Install 05 - Quickstart Tour v1.docx](docs/YHCR-FHIR-Proxy-Install-05-Production-Install-v1.docx)

[YHCR FHIR Proxy Install 99 - 3rd Party Technologies v1.docx](docs/YHCR-FHIR-Proxy-Install-99-3rd-Party-Technologies-v1.docx)