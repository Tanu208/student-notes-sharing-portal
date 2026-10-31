# Smart Financial Reporting Tool (SFRT) - PowerShell Launcher
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   Smart Financial Reporting Tool (SFRT) - Startup Launcher" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$pythonCmd = "C:\Users\Harsh Verma\anaconda3\python.exe"
if (-not (Test-Path $pythonCmd)) {
    $pythonCmd = "python"
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$env:PYTHONPATH = "$scriptDir\backend"

Write-Host "Local Laptop URL: http://127.0.0.1:8000" -ForegroundColor Green
Write-Host "Mobile Phone URL: http://172.20.10.2:8000" -ForegroundColor Cyan
Write-Host "API Documentation: http://127.0.0.1:8000/docs" -ForegroundColor Green
Write-Host "Demo Credentials:  demo@example.com / DemoPassword123!" -ForegroundColor Yellow
Write-Host ""
Write-Host "Starting Uvicorn server on http://0.0.0.0:8000 ... (Press Ctrl+C to stop)" -ForegroundColor White

& $pythonCmd -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload --app-dir "$scriptDir\backend"
