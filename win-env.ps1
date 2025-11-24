# win10 style right click menu
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve


# Show Desktop icons: This PC, Network, User's Files, Control Panel
$RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
Set-ItemProperty -Path $RegPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value 0   # This PC
Set-ItemProperty -Path $RegPath -Name "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -Value 0   # Network
Set-ItemProperty -Path $RegPath -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -Value 0   # User's Files
Set-ItemProperty -Path $RegPath -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" -Value 0   # Control Panel


# set user contorl to never notify
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f


# some explore setttings
# Show file extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
# Show hidden files
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
# Hide Search button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
# Hide Task View button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
# Disable News & Interests
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
# only merge taskbar icon when full
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 1 /f


# Stop and disable SysMain (Superfetch)
Stop-Service -Name "SysMain" -Force
Set-Service -Name "SysMain" -StartupType Disabled
# Stop and disable Windows Search
Stop-Service -Name "WSearch" -Force
Set-Service -Name "WSearch" -StartupType Disabled
Write-Output "SysMain and Windows Search services have been stopped and disabled."

#$env:HTTP_PROXY="http://127.0.0.1:1080"
#$env:HTTPS_PROXY="http://127.0.0.1:1080"

# install app
winget source update
Write-Host "Installing App..." -ForegroundColor Cyan
$softwareList = @(
    # basic
    "Google.Chrome",
    "RARLab.WinRAR",
    "VideoLAN.VLC",

    # avira
    "XPFD23M0L795KD",

    # game
    #"Valve.Steam",
    #"EpicGames.EpicGamesLauncher",
    #"Ubisoft.Connect",
    #"Discord.Discord",

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

winget uninstall "Microsoft OneDrive"

Write-Host "All done!" -ForegroundColor Cyan
Pause




