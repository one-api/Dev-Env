URL_Node="https://nodejs.org/dist/v22.6.0/node-v22.6.0-x64.msi"
URL_Python="https://www.python.org/ftp/python/3.12.5/python-3.12.5-amd64.exe"
URL_Golang="https://go.dev/dl/go1.22.2.windows-amd64.msi"

URL_Vscode="https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
URL_JBToolbox="https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.exe"

URL_Wsl2="https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
URL_Chrome="https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi"


Invoke-WebRequest -UseBasicParsing -Uri 
msiexec /i "C:\Users\YourUsername\Downloads\example_installer.msi" /quiet /norestart
