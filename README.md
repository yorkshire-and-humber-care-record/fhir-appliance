# Yorkshire and Humber FHIR Appliance
Web: [Yorkshire and Humber Care Record](https://yhcr.org)  
Twitter: [@YHCareRecord](https://twitter.com/YHCareRecord/)

---

# This repo is currently under development

# What is the FHIR Appliance?
The FHIR Appliance is a FHIR server which was built by, and for, the [Yorkshire and Humber Care Record](https://yhcr.org). The work was carried out by the (YHCR) project team as part of their work with the [NHS England Local Health and Care Record Exampler](https://www.england.nhs.uk/publication/local-health-and-care-record-exemplars/) (LHCRE) programme. 

The FHIR Appliance has been developed in accordance to a series of [technical papers](https://yhcr.org/downloads/) produced by the [YHCR](https://yhcr.org). Each design paper describes a set of "model" software components and architectures that, when realised, can enable health and social care organisations to share data using [FHIR](https://www.hl7.org/fhir/STU3/). 

The FHIR Appliance will keep evolving in step with both the LHCRE, YHCR and other NHS regional shared care record programmes. The overall aim, however, is that the server will provide an out of the box, open source solution to health and social care organisations who require the ability to share data using FHIR.


# Key Features

 - A complete implementation of a FHIR Server and FHIR Store (fully compliant with FHIR STU 3)
 - Support for sychronous queries, but also for asynchronous bulk extracts and event-driven subscriptions
 - Flexible endpoint configuration
 > - Possible to configure dual endpoints for external vs internal access
 > - Entirely configurable choice of listener ports
 > - Options for http or https (including mutual authentication)
 > - Options for message authentication (jwt, api-key, none)
 - Audit log of all activities (available as FHIR AuditEvent resources)
 - Option to automate registration of patients with a regional PIX server
 - Runs on Linux or Windows Server 2019, using either Postgres or MSSQL database
 - Dockerised deployment for ease of installation


# Technical Overview

The FHIR Appliance has been developed using a stack of open source software and health care interoperability standards, namely:

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

A public git repository containing the sourcecode will be available soon but for now interested parties and members of the YHCR programme are encouraged to use the software via the docker and node.js components hosted here. 


---

# Getting started


---



### Install guides
The following steps describe how to get the current version of the FHIR Appliance up and running within your local environment. 

[01 - Overview](/docs/install-guide/FHIR-Appliance-Install-01-Overview.md)

[02 - Server Preparation](docs/install-guide/FHIR-Appliance-Install-02-Server-Preparation-v2.docx)

[03 - Quickstart Install](docs/install-guide/FHIR-Appliance-Install-03-Quickstart-Install-v2.docx)

[04 - Quickstart Demo](docs/install-guide/FHIR-Appliance-Install-04-Quickstart-Demo-v2.docx)

[05 - Production Install](docs/install-guide/FHIR-Appliance-Install-05-Production-Install-v2.docx)

[99 - 3rd Party Technologies](docs/install-guide/FHIR-Appliance-Install-99-3rd-Party-Technologies-v2.docx)

### Reference guides
[Configuring TLS](docs/reference/configure-tls.md)

[Database initialisation](docs/reference/database-initalisation.md)

[Creating self-signed certificates](docs/reference/self-signed-cert.md)


