$ErrorActionPreference = "Stop"

$jdkDir = "$env:USERPROFILE\jdk17"
$sdkDir = "$env:LOCALAPPDATA\Android\Sdk"
$cmdlineToolsDir = "$sdkDir\cmdline-tools\latest"

# 1. Download and Extract JDK 17 if not exists
if (-not (Test-Path "$jdkDir\bin\java.exe")) {
    Write-Host "Downloading OpenJDK 17..."
    $jdkUrl = "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11%2B9/OpenJDK17U-jdk_x64_windows_hotspot_17.0.11_9.zip"
    $jdkZip = "$env:TEMP\jdk17.zip"
    Invoke-WebRequest -Uri $jdkUrl -OutFile $jdkZip
    Write-Host "Extracting JDK..."
    Expand-Archive -Path $jdkZip -DestinationPath "$env:TEMP\jdk17_extracted" -Force
    # The zip extracts to a subfolder like jdk-17.0.11+9
    $extractedFolder = Get-ChildItem "$env:TEMP\jdk17_extracted" | Select-Object -First 1
    Move-Item -Path $extractedFolder.FullName -Destination $jdkDir -Force
}
$env:JAVA_HOME = $jdkDir
$env:PATH = "$jdkDir\bin;" + $env:PATH
Write-Host "JAVA_HOME is $env:JAVA_HOME"

# 2. Download and Extract Android cmdline-tools if not exists
if (-not (Test-Path "$cmdlineToolsDir\bin\sdkmanager.bat")) {
    Write-Host "Downloading Android cmdline-tools..."
    $toolsUrl = "https://dl.google.com/android/repository/commandlinetools-win-10406996_latest.zip"
    $toolsZip = "$env:TEMP\cmdline-tools.zip"
    Invoke-WebRequest -Uri $toolsUrl -OutFile $toolsZip
    Write-Host "Extracting cmdline-tools..."
    Expand-Archive -Path $toolsZip -DestinationPath "$env:TEMP\cmdline_tools_extracted" -Force
    # The zip contains a folder named 'cmdline-tools'
    New-Item -ItemType Directory -Force -Path "$sdkDir\cmdline-tools" | Out-Null
    Move-Item -Path "$env:TEMP\cmdline_tools_extracted\cmdline-tools" -Destination $cmdlineToolsDir -Force
}
$env:ANDROID_HOME = $sdkDir

# 3. Accept Licenses and install SDK/NDK
Write-Host "Accepting Android SDK licenses and installing packages..."
$sdkmanager = "$cmdlineToolsDir\bin\sdkmanager.bat"
echo "y" | & $sdkmanager --licenses
& $sdkmanager "ndk;25.2.9519653" "build-tools;33.0.1" "platforms;android-33"
$env:NDK_HOME = "$sdkDir\ndk\25.2.9519653"

# 4. Include Rust in PATH
$env:PATH = "$env:PATH;$env:USERPROFILE\.cargo\bin"

# 5. Build Tauri Android
if (-not (Test-Path "$PSScriptRoot/src-tauri/gen/android/app")) {
    Write-Host "Initializing Tauri Android Project..."
    npm run init:android
} else {
    Write-Host "Android project already initialized — skipping init:android to preserve MainActivity customizations."
}

Write-Host "Building Tauri Android APK..."
npm run build:android

Write-Host "Done!"
