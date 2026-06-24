#!/bin/bash
# Скрипт для запуска тестов DummyJSON

# Получаем директорию, где находится скрипт
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Корень проекта – на уровень выше
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Запуск тестов DummyJSON API..."

# Создаём папку для отчётов в корне проекта
mkdir -p "$PROJECT_DIR/reports"

# Запускаем Newman с абсолютными путями
newman run "$PROJECT_DIR/collections/DummyJSON.postman_collection.json" \
  -e "$PROJECT_DIR/environments/DummyJSON.postman_environment.json" \
  --reporters cli,html \
  --reporter-html-export "$PROJECT_DIR/reports/newman-report.html"

# Проверяем код возврата
if [ $? -eq 0 ]; then
  echo "Все тесты пройдены успешно!"
  echo "Отчёт сохранён в reports/newman-report.html"
else
  echo "Некоторые тесты не пройдены."
  echo "Отчёт сохранён в reports/newman-report.html"
  exit 1
fi