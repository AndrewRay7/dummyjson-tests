# DummyJSON API Tests

Автоматизированные тесты для публичного API [DummyJSON](https://dummyjson.com) с использованием Postman и Newman.

## Что проверяется

Коллекция содержит 10 тестовых сценариев для эндпоинтов авторизации и управления корзинами:

| № | Метод | Эндпоинт | Описание |
|---|-------|----------|----------|
| 1 | POST | `/auth/login` | Успешная авторизация с валидными данными |
| 2 | POST | `/auth/login` | Неуспешная авторизация с неверным паролем |
| 3 | GET | `/auth/me` | Получение текущего пользователя с токеном |
| 4 | GET | `/user/{userId}` | Получение текущего пользователя без токена |
| 5 | GET | `/carts/user/{userId}` | Получение корзин пользователя |
| 6 | GET | `/carts/{cartId}` | Получение корзины по ID |
| 7 | POST | `/carts/add` | Создание новой корзины |
| 8 | PATCH | `/carts/{cartId}` | Обновление корзины |
| 9 | DELETE | `/carts/{cartId}` | Удаление корзины |
| 10 | GET | `/carts/784` | Негативная проверка — несуществующая корзина (ожидается 404) |



## Быстрый старт

### Клонируйте репозиторий
git clone https://github.com/your-username/dummyjson-tests.git
cd dummyjson-tests

### Запуск тестов с помощью скиптов

### Windows
.\scripts\run-tests.ps1

### Linux/macOS
./scripts/run-tests.sh

### Запуск тестов newman run
newman run collections/DummyJSON.postman_collection.json \
  -e environments/DummyJSON.postman_environment.json \
  --reporters cli,html \
  --reporter-html-export reports/newman-report.html

### Требования
- [Node.js](https://nodejs.org/) (версия 20 или выше)
- [Newman](https://www.npmjs.com/package/newman) — устанавливается глобально

### Установка Newman
bash
npm install -g newman