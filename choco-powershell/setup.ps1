#### -> HELPER FUNCTIONS ####
function Check-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}
#### <- HELPER FUNCTIONS ####

#### -> PREREQUISITES ####
if (Check-Command -cmdname 'choco') {
    Write-Host "Choco is already installed, skip installation."
}
else {
    Write-Host "Installing Chocolatey first..."
    Write-Host "------------------------------------" 
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "Installed Chocolatey" -ForegroundColor Green
}
if (Check-Command -cmdname 'Install-BoxstarterPackage') {
    Write-Host "Boxstarter is already installed, skip installation."
}
else {
    Write-Host "Installing Boxstarter..."
    Write-Host "------------------------------------" 
    . { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force
    Write-Host "Installed Boxstarter" -ForegroundColor Green
}

#### <- PREREQUISITES ####

######## -> ENVIRONMENT CONFIGURATION ########
Write-Host "Setting up power options"
Powercfg /Change monitor-timeout-ac 20
Powercfg /Change standby-timeout-ac 0
Write-Host "Completed power options" -Foreground green

# Show hidden files, Show protected OS files, Show file extensions
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

######## <- ENVIRONMENT CONFIGURATION ########

######## -> COMMON TOOLS CONFIGURATION ########
Write-Host "Installing common tools using choco"

$Apps = @(
    #Browsers
    "microsoft-edge",
    "googlechrome",
    "firefox",
    
    #Communications
    "skype",
    "microsoft-teams.install",
    #"teamviewer",
    
    #Editing
    "notepadplusplus.install",
    "grammarly",
    
    # Media players and production
    "vlc",
    #"kdenlive", # Supports standalone 
    "obs-studio",
    
    # Network & Debugging
    "fiddler",
    "logparser",
    "postman",
    "sysinternals",
    "wget",
    "wireshark",

    #office
    "powerbi",

    #Scriptings
    "powershell-core",
    
    #Utils
    "filezilla"
    #"lightshot.install",
)

foreach ($app in $Apps) {
    cinst $app -y
} 
Write-Host "Installed common tools" -Foreground green
######## <- COMMON TOOLS CONFIGURATION ########

######## -> DEV TOOLS CONFIGURATION ########
Write-Host "Installing dev tools using choco"
$devTools = @(
    #Editors
    "vscode",
    #Version control    
    "git",
    #.Net
    "dotnetcore-sdk",
    "dotpeek",
    #Uncomment below line for service fabric
    #"service-fabric-explorer",
    #NodeJS
    "nodejs-lts",
    #Python
    "python3",
    #Database
    "ssms",
    # hosting on cloud
    "azure-cli",
    # Diagramming
    "graphviz"
)
foreach ($devTool in $devTools) {
    cinst $devTool -y
}
Write-Host "Installed dev tools" -Foreground green
######## <- DEV TOOLS CONFIGURATION ########

#### -> PERSONALIZE ####
git config --global user.email "joymon@gmail.com"
git config --global user.name "Joy George Kunjikkuru"

#### <- PERSONALIZE ####