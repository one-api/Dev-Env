# win10 style right click menu
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

# Stop and disable SysMain (Superfetch)
Stop-Service -Name "SysMain" -Force
Set-Service -Name "SysMain" -StartupType Disabled
# Stop and disable Windows Search
Stop-Service -Name "WSearch" -Force
Set-Service -Name "WSearch" -StartupType Disabled
Write-Output "SysMain and Windows Search services have been stopped and disabled."



$env:HTTP_PROXY="http://127.0.0.1:1080"
$env:HTTPS_PROXY="http://127.0.0.1:1080"

winget source update

Write-Host "Installing..." -ForegroundColor Cyan

$softwareList = @(
    # basic
    "Google.Chrome",
    "RARLab.WinRAR",
    "VideoLAN.VLC",

    # avira
    "XPFD23M0L795KD",

    # game
    "Valve.Steam",
    "EpicGames.EpicGamesLauncher",
    "Ubisoft.Connect",

    # maybe slow
    "Discord.Discord",

    # dev
    "Python.Python.3.13",
    "GoLang.Go",
    "OpenJS.NodeJS",
    
    "Git.Git",
    "Microsoft.VisualStudioCode",
    "JetBrains.Toolbox",
    "Mobatek.MobaXterm",
    
    "Postman.Postman"
    
    # "Docker.DockerDesktop",
)

foreach ($app in $softwareList) {
    Write-Host "Installing $app ---------------------------------------------------" -ForegroundColor Yellow
    winget install -e --id $app --silent --accept-package-agreements --accept-source-agreements #--locale en-US # looks like this locale not working
}

Write-Host "All done!" -ForegroundColor Cyan
Pause


