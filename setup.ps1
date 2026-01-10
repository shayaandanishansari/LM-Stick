# Setup.exe is compiled from this powershell script using:
# Invoke-ps2exe .\setup.ps1 .\setup.exe -requireAdmin -noConsole -iconFile "lmsticklogo.ico"
# Setup requires admin privelege to write certain ollama related files to USERPROFILE admin protected paths
# Same paths are touched when you install ollama from ollama's installer (minimal files are touched)

# 1 Base Directory
$BaseDir = Split-Path -Parent ([System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName)
if ([string]::IsNullOrWhiteSpace($BaseDir)) {
    throw "Could not resolve where models and app exist"
}

Set-Location -LiteralPath $BaseDir

# 2 Environment Variables
$env:OLLAMA_MODELS = Join-Path $BaseDir ".ollama\models"

# 3 Start GUI
$gui = Start-Process -FilePath ".\ollama-bin\ollama app.exe" `
                     -WorkingDirectory ".\ollama-bin" `
                     -PassThru

# 4 Start Server
$server = Start-Process -FilePath ".\ollama-bin\ollama.exe" `
                        -ArgumentList "serve" `
                        -WorkingDirectory ".\ollama-bin" `
                        -PassThru

# 5 Safe Termination
$server.WaitForExit()
taskkill /IM "ollama app.exe" /F /T 2>$null | Out-Null