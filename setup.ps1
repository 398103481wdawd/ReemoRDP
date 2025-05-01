$plainPassword = "P@ssw0rd!"  

try {
    net user $env:USERNAME $plainPassword
    Write-Host "[+] Password changed successfully for $env:USERNAME"
} catch {
    Write-Error "[-] Failed to change password: $_"
    exit 1
}

$zipUrl = "https://github.com/398103481wdawd/ReemoRDP/releases/download/re/Reemo.zip"
$zipPath = "$env:TEMP\file.zip"
$extractPath = "C:\Program Files\Reemo"

mkdir "C:\Program Files\Reemo"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

if (!(Test-Path -Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath | Out-Null
}

Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

