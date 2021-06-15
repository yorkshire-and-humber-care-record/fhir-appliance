#################################################################################################
# To use this script, first:
# 
# cd <fhir-appliance-repo-directory>/misc
#
# Then, depending on which FHIR Appliance (-t target)
#
# Prod
# ./win-fhir-app-upgrade.ps1 -target prod
#
# Quckstart/Windows
# ./win-fhir-app-upgrade.ps1 -target qs
#
# Optional
# -d detached to launch the updated fhir-appliance in detached mode (docker-compose up -d), e.g.:
#
# ./win-fhir-app-upgrade.ps1 -target qs -detached $true
#
#################################################################################################
# Additional technical note
#
# The most important lines in this script are:
#   - "docker pull synaneticsltd/synfhir-windows-node:latest" - to pull down the latest node image
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

param ([Parameter(Mandatory=$true)][string] $target, [Parameter(Mandatory=$false)][boolean] $detached=$false)

Write-Host "Updating FHIR Appliance ${target}"

$path = $target.ToLower()
if($target -eq "qs") {
    $path = "quickstart/windows"
}

Set-Location ../$path
Get-Location | Write-Host

$cmd
if($detached -eq $true) {
    $cmd = "docker-compose up --no-deps -d fhir-appliance"
}
else {
    $cmd = "docker-compose up --no-deps fhir-appliance"
}

Write-Host "Pulling latest images..."
Write-Host "Pulling latest windows node server image..."
Invoke-Expression "docker pull synaneticsltd/synfhir-windows-node:latest"
Write-Host "Latest windows node image pulled succesfully..."
Write-Host "Pulling FHIR Appliance..."
Invoke-Expression "docker-compose pull"
Write-Host "Updating FHIR Appliance ${path}"
Invoke-Expression $cmd
Write-Host "FHIR Appliance ${path} updated..."
