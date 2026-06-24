```bash
#!/bin/bash
# Скрипт для запуска тестов DummyJSON

echo "Запуск тестов DummyJSON API..."

# Создаём папку для отчётов, если её нет
mkdir -p ../reports

# Запускаем Newman
newman run ../collections/DummyJSON.postman_collection.json \
  -e ../environments/DummyJSON.postman_environment.json \
  --reporters cli,html \
  --reporter-html-export ../reports/newman-report.html

# Проверяем код возврата
if [ $? -eq 0 ]; then
  echo "Все тесты пройдены успешно!"
  echo "Отчёт сохранён в reports/newman-report.html"
else
  echo "Некоторые тесты не пройдены."
  echo "Отчёт сохранён в reports/newman-report.html"
  exit 1
fi