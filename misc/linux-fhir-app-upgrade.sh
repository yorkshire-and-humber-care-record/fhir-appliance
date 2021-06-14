#################################################################################################
# To use this script, first:
# 
# cd <fhir-appliance-repo-directory>/misc
# chmod +x linux-fhir-app-upgrade.sh
#
# Then, depending on which FHIR Appliance (-t target)
#
# Prod
# ./linux-fhir-app-upgrade.sh -t prod
#
# Quckstart/Linux
# ./linux-fhir-app-upgrade.sh -t qs
#
# Optional
# -d detached to launch the updated fhir-appliance in detached mode (docker-compose up -d), e.g.:
#
# ./linux-fhir-app-upgrade.sh -t qs -d detached
#
#################################################################################################
# Additional technical note
#
# The most important line in this script is:
#   - "docker-compose pull" - to pull down the latest version of any other images in the docker-compose file
#                             (importantly including the FHIR Appliance image)
#
# It is then necessary to restart any running containers to make sure they are using the latest images:
#   - If the service is already stopped then there is nothing further to do, simply start it with "docker-compose up -d"
#   - If the service is running then you could bounce it with "docker-compose down" followed by "docker-compose up -d"
#   - However this script takes a more sophisticated approach and ASSUMING THE SERVICE IS ALREADY RUNNING it refreshes only
#   - the relevant container with "docker-compose up --no-deps -d fhir-appliance"
#
# The rest of the script is peripheral code regarding command parameter parsing and navigating to the correct directory
# It would be possible to adapt and create your own tailored script if preferred
#################################################################################################
#!/bin/bash

usage() { echo "Usage: $0 [-t <string> - prod for production or qs for linux quickstart] [-d <string>, optional - restart the updated appliance in detached mode (docker-compose up -d) by setting -d detached]" 1>&2; exit 1; }

while getopts ":t:d:" o; do
    case "${o}" in
        t)
            t=${OPTARG}
            ((t == "prod" || t == "qs")) || usage
            ;;
        d)
            d=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${t}" ]; then
    usage
fi

if [ ${t} == "qs" ]; then
    t="quickstart/linux"
fi

echo "Updating FHIR Appliance in ${t}"
cd ../${t} 
echo "Pulling latest images..."
docker-compose pull
echo "Restarting FHIR Appliance..."
if [ "${d}" ]; then
    echo "Using -d (detached)..."
    docker-compose up --no-deps -d fhir-appliance
else
    docker-compose up --no-deps fhir-appliance
fi

echo "FHIR Appliance ${t} updated..."

