param (
    [Parameter(Mandatory = $true)]
    [string[]]$Profiles
)

foreach ($profile in $Profiles) {
    Write-Host "Running: docker compose --profile $profile up -d"
    docker compose --profile $profile up -d
}
