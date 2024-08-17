# Define the URLs
$urls = @{
    NodeJS      = "https://nodejs.org/dist/v22.6.0/node-v22.6.0-x64.msi"
    Python      = "https://www.python.org/ftp/python/3.12.5/python-3.12.5-amd64.exe"
    Golang      = "https://go.dev/dl/go1.22.2.windows-amd64.msi"
    Vscode      = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
    JBToolbox   = "https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.exe"
    Wsl2        = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
    Chrome      = "https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi"
}

# Define download directory
$downloadDir = "$env:USERPROFILE\Downloads\Installers"
# Create download directory if it does not exist
if (-not (Test-Path $downloadDir)) {
    New-Item -Path $downloadDir -ItemType Directory
}

# Download each file
foreach ($app in $urls.Keys) {
    $url = $urls[$app]
    $fileName = [System.IO.Path]::GetFileName($url)
    $filePath = Join-Path -Path $downloadDir -ChildPath $fileName
    
    Write-Output "Downloading $app from $url..."
    Invoke-WebRequest -Uri $url -OutFile $filePath
    
    Write-Output "Downloaded $fileName to $downloadDir"
}

# Install each file
foreach ($app in $urls.Keys) {
    $fileName = [System.IO.Path]::GetFileName($urls[$app])
    $filePath = Join-Path -Path $downloadDir -ChildPath $fileName
    
    Write-Output "Installing $fileName..."
    
    # Install the file depending on its type
    if ($fileName -match "\.msi$") {
        Start-Process -FilePath $filePath -ArgumentList "/quiet" -Wait
    } elseif ($fileName -match "\.exe$") {
        Start-Process -FilePath $filePath -ArgumentList "/silent" -Wait
    }
    
    Write-Output "$fileName installed"
}

Write-Output "All downloads and installations are complete."
