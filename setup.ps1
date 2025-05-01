mkdir C:\reemo
powershell Invoke-WebRequest 'https://downloads.reemo.io/drivers/reemon.zip' -OutFile 'C:\reemo\reemon.zip'
powershell Expand-Archive -LiteralPath 'C:\reemo\reemon.zip' -DestinationPath 'C:\reemo\'
"C:\reemo\reemon\devcon.exe" install "C:\reemo\reemon\reemon.inf" Root\reemon

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
