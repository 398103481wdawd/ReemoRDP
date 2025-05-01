$plainPassword = "P@ssw0rd!"  

try {
    net user $env:USERNAME $plainPassword
    Write-Host "[+] Password changed successfully for $env:USERNAME"
} catch {
    Write-Error "[-] Failed to change password: $_"
    exit 1
}

$reemoUrl = "https://download.reemo.io/reemo.setup.x64.exe"
$installerPath = "$env:TEMP\reemo.setup.x64.exe"

Write-Host "[*] Downloading Reemo..."
Invoke-WebRequest -Uri $reemoUrl -OutFile $installerPath

Write-Host "[*] Installing Reemo silently..."
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

Start-Sleep -Seconds 10

# Path to Reemo config file
$reemoConfigPath = "C:\Program Files\Reemo\service\reemo.ini"

# URL to your custom reemo.ini file
$customIniUrl = "https://github.com/398103481wdawd/ReemoRDP/raw/refs/heads/main/reemo.ini" 
$customIniPath = "C:\Program Files\Reemo\reemo.ini"

Write-Host "[*] Downloading custom reemo.ini..."
Invoke-WebRequest -Uri $customIniUrl -OutFile $customIniPath

if (Test-Path $reemoConfigPath) {
    Copy-Item -Path $customIniPath -Destination $reemoConfigPath -Force
    Write-Host "[+] Reemo.ini replaced successfully."
} else {
    Write-Warning "[-] Reemo.ini not found. Reemo may not have installed correctly."
}

Write-Host "[✓] Script complete."

