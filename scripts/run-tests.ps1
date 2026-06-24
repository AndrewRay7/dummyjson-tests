# Устанавливаем кодировку вывода в UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "ZAPUSK TESTOV DummyJSON API..." -ForegroundColor Cyan

New-Item -ItemType Directory -Force -Path ".\reports" | Out-Null

newman run .\collections\DummyJSON.postman_collection.json -e .\environments\DummyJSON.postman_environment.json --reporters cli

if ($LASTEXITCODE -eq 0) {
    Write-Host "Vse Testi Proideni Uspeschno!" -ForegroundColor Green
} else {
    Write-Host "Nekotorie Testi Ne Proideni." -ForegroundColor Red
    exit $LASTEXITCODE
}