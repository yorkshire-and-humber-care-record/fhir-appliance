# Yorkshire and Humber FHIR Appliance - Create a self-signed certificate using OpenSSL

---

You will need [OpenSSL](https://www.openssl.org) to generate a self-signed certificate. You should only use self-signed certificates for development purposes.

---

## Create a self-signed certificate using OpenSSL

### OpenSSL

From the command line (Windows users should ensure that they are running either Powershell or cmd with elevated permissions):

1. Open the hosts file on your local machine and add an entry for `127.0.0.1 fhir.appliance.local` then save the file and exit the application you used to make the edit.

2. Execute: `openssl req -key fhir.appliance.pk.pem -new -x509 -days 365 -out fhir.appliance.pem` to create a self signed certificate valid for 365 days. OpenSSL will output these files in either your home directory or the directory from where you executed the command. If you are unsure, search your machine for a file named `fhir.appliance.pem`

3. You may have to configure your REST client to not validate SSL certificates when testing the appliance. Instructions on how to do this in Postman can be found to towards the bottom of the page [here](https://learning.postman.com/docs/sending-requests/certificates/). 
   
---
 
## You're done

### Where next?

[Home](../README.md)