# Run.exe is compiled from this powershell script using:
# Invoke-ps2exe .\run.ps1 .\run.exe -noConsole -iconFile "lmsticklogo.ico"



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