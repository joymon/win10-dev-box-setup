#### HELPER FUNCTIONS ####
function Check-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}
#### HELPER FUNCTIONS ####
Write-Host "Setting up power options"
Powercfg /Change monitor-timeout-ac 20
Powercfg /Change standby-timeout-ac 0
Write-Host "Completed power options" -Foreground green
Write-Host "Installing dev tools using choco"
if (Check-Command -cmdname 'choco') {
    Write-Host "Choco is already installed, skip installation."
}
else {
    Write-Host "Installing Chocolatey first..."
    Write-Host "------------------------------------" 
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "Installed Chocolatey" -ForegroundColor Green
}
$Apps = @(
    "git",
    "microsoft-edge",
    "googlechrome",
    "vlc",
    "dotnetcore-sdk",
    "wget",
    #"vscode",
    "sysinternals",
    "notepadplusplus.install",
    "fiddler",
    "filezilla",
    #"lightshot.install",
    "microsoft-teams.install",
    "teamviewer",
    #"github-desktop",
    #"irfanview",
    "nodejs-lts",
    "azure-cli",
    "powershell-core")

foreach ($app in $Apps) {
    cinst $app -y
} 
Write-Host "Installed dev tools" -Foreground green

