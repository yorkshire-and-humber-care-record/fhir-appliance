######################################################################################
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
######################################################################################
#!/bin/bash

usage() { echo "Usage: $0 [-t <string> - prod for production or qs for linux quickstart] [-d <string>, optional - restart the appliance in detached mode (docker-compose up -d) by setting -d detached]" 1>&2; exit 1; }

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

echo "Done"

