# Скрипт для запуска тестов DummyJSON (PowerShell)
Write-Host "Запуск тестов DummyJSON API" -ForegroundColor Cyan

# Создаём папку для отчётов, если её нет
New-Item -ItemType Directory -Force -Path "../reports" | Out-Null

# Запускаем Newman
newman run ../collections/DummyJSON.postman_collection.json `
  -e ../environments/DummyJSON.postman_environment.json `
  --reporters cli,html `
  --reporter-html-export ../reports/newman-report.html

# Проверяем код возврата
if ($LASTEXITCODE -eq 0) {
    Write-Host "Все тесты пройдены успешно!" -ForegroundColor Green
    Write-Host "Отчёт сохранён в reports/newman-report.html" -ForegroundColor Yellow
} else {
    Write-Host "Некоторые тесты не пройдены." -ForegroundColor Red
    Write-Host "Отчёт сохранён в reports/newman-report.html" -ForegroundColor Yellow
    exit $LASTEXITCODE
}