## Available FHIR Appliance Image Tags

> All available FHIR Appliance images can be found on [Dockerhub](https://hub.docker.com/repository/docker/synaneticsltd/synfhir-store)

### Using a different FHIR Appliance Docker Image

By default, each of the `docker-compose.yml` files are configured to pull `synaneticsltd/synfhir-store:[platform]-latest`. You can change this behaviour by:

1. If the FHIR Appliance is running then bring it down by entering `docker-compose down` 
2. Open the respective `docker-compose.yml` file that your environment is using, e.g `quickstart/linux/docker-compose.yml`
3. Find the service named `fhir-appliance`
4. Change the `image` setting from `synaneticsltd/synfhir-store:[platform]-latest` to `synaneticsltd/synfhir-store:[platform]-[version]`
5. Save the change.
6. Run the FHIR Appliance by entering `docker-compose up -d`

> Images tagged with alpha, beta or rc should not be used in production/live environments as they may contain breaking changes.

### Available Versions

| Container Type/OS | Tag |
| :----------------- | :--- |
| Linux             | synaneticsltd/synfhir-store:linux-latest |
| Linux             | synaneticsltd/synfhir-store:linux-v3.1.3 |
| Linux             | synaneticsltd/synfhir-store:linux-beta-v3.1.4 |
| Windows             | synaneticsltd/synfhir-store:windows-2019-latest |
| Windows             | synaneticsltd/synfhir-store:windows-2019-v3.1.3 |
| Windows             | synaneticsltd/synfhir-store:windows-2019-beta-v3.1.4 |
