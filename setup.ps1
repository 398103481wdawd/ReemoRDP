$plainPassword = "P@ssw0rd!"  

try {
    net user $env:USERNAME $plainPassword
    Write-Host "[+] Password changed successfully for $env:USERNAME"
} catch {
    Write-Error "[-] Failed to change password: $_"
    exit 1
}

$zipUrl = "https://github.com/398103481wdawd/ReemoRDP/releases/download/re/Reemo.zip"
$zipPath = "$env:TEMP\Reemo.zip"
$extractPath = "$Env:ProgramFiles"

Write-Host "[+] Downloading Reemo..."
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "[+] Extracting Reemo..."
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
Write-Host "[+] Reemo extracted successfully! Please run Reemo.exe from C:\Program Files\Reemo\Reemo.exe"
