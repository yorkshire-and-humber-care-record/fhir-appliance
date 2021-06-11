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
# ./win-fhir-app-upgrade.ps1 -target qs -detached true
#
#################################################################################################
param ([string] $target, [string] $detached="false")

Write-Host "Updating FHIR Appliance ${target}"

$path = $target.ToLower()
if($target -eq "qs") {
    $path = "quickstart/windows"
}

Set-Location ../$path
Get-Location | Write-Host

$cmd
if($detached.ToLower() -eq "true") {
    $cmd = "docker-compose up --no-deps -d fhir-appliance"
}
else {
    $cmd = "docker-compose up --no-deps fhir-appliance"
}

Write-Host "Pulling latest images..."
Invoke-Expression "docker-compose pull"
Write-Host "Updating FHIR Appliance ${path}"
Invoke-Expression $cmd
Write-Host "FHIR Appliance ${path} updated..."