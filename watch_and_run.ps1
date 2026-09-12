$adbPath = "C:\Users\mashk\.gemini\antigravity\scratch\platform-tools\adb.exe"
$flutterPath = "C:\Users\mashk\OneDrive\Documents\flutter\bin\flutter.bat"
$projectDir = "C:\Users\mashk\.gemini\antigravity\scratch\yt_video_player"

$env:PATH = "C:\Users\mashk\.gemini\antigravity\scratch\platform-tools;" + $env:PATH
$env:ANDROID_HOME = "C:\Users\mashk\.gemini\antigravity\scratch"
$env:ANDROID_SDK_ROOT = "C:\Users\mashk\.gemini\antigravity\scratch"

Write-Host "Waiting for Pixel 9 USB connection & ADB authorization..." -ForegroundColor Yellow

while ($true) {
    $devices = & $adbPath devices | Select-String -Pattern "device$"
    if ($devices) {
        $deviceId = ($devices[0].Line -split '\s+')[0]
        Write-Host "Detected USB Device: $deviceId" -ForegroundColor Green
        Write-Host "Launching Flutter YouTube Streamer application..." -ForegroundColor Cyan
        Set-Location $projectDir
        & $flutterPath run -d $deviceId
        break
    }
    Start-Sleep -Seconds 2
}
