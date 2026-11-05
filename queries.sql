-- 1. Население Германии
SELECT population FROM world WHERE name = 'Germany';

-- 2. Страны с населением больше 50 млн
SELECT name, population FROM world WHERE population > 50000000;

-- 3. Соединение таблиц: клиенты и их платежи
SELECT c.name, p.amount 
FROM clients c 
JOIN payments p ON c.id = p.client_id;