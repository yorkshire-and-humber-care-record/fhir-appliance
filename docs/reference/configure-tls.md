## Notes on configuring your FHIR Appliance to use HTTPS

> Example self-signed certificates are provided. The certificate, private key and root ca cannot not be used in production.

### One way TLS

If you wish to expose a FHIR API over HTTPS then you will need a certificate, private key and passphrase (if you used one). Ideally your certificate should be issued by certificate authority, but, for development purposes, you can use a [self-signed](docs/self-signed-cert.md) certificate. As above, for development purposes, example certificates are provided.

### Mutual TLS

If you require mutual TLS client authentication then you will need the CA root certificate of your server's certificate issuer. For development purposes, you can create your own root CA certificate and private key to sign your own certificates. Any clients using a mutal TLS enabled endpoint will need to send a certificate signed by the same CA in any requests to your FHIR Appliance. 

Yorkshire and Humber participants who wish to test the mutal tls capability of the FHIR Appliance can request test client certificates signed by the correct CA from the onboarding/programme team.

### Host file (Quickstart)

So that the common name for the certificates resolve locally you will need to add the following entries to your hosts file:

`127.0.0.1 appliance.development.yhcr.nhs.uk`
