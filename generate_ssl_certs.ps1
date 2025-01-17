$CertDir = "./conf/traefik/certs"
$CertName = "pioneer"
$CertFile = "$CertDir/fullchain.pem"
$KeyFile = "$CertDir/privkey.pem"

if (Test-Path -Path $CertFile) { Remove-Item -Path $CertFile }
if (Test-Path -Path $KeyFile) { Remove-Item -Path $KeyFile }

if (!(Test-Path -Path $CertDir)) { New-Item -ItemType Directory -Path $CertDir }

if (-not $args[0]) {
    Write-Error "Usage: .\generate_cert.ps1 <domain>"
    exit 1
}

$Domain = $args[0]
$AltNames = @(
    "DNS:keycloak.$Domain",
    "DNS:grafana.$Domain",
    "DNS:iotagent-ui.$Domain",
    "DNS:minio.$Domain",
    "DNS:orion.$Domain",
    "DNS:draco.$Domain",
    "DNS:pgadmin.$Domain"
)
$AltNamesString = $AltNames -join ","

& openssl req -x509 -nodes -days 365 -newkey rsa:2048 `
  -keyout $KeyFile `
  -out $CertFile `
  -subj "/C=IT/ST=Italy/L=Local/O=PIONEER/CN=$Domain" `
  -addext "subjectAltName=$AltNamesString"

$CertFileExists = Test-Path -Path $CertFile
$KeyFileExists = Test-Path -Path $KeyFile

if ($CertFileExists -and $KeyFileExists) {
    Write-Output "Certificate and key generated successfully in: $CertDir"
    Write-Output "Certificate: $CertFile"
    Write-Output "Key: $KeyFile"
    Write-Output "Subj: /C=IT/ST=Italy/L=Local/O=PIONEER/CN=$Domain"
} else {
    Write-Error "Error generating the certificate or key"
}