-- 1. Население Германии
SELECT population FROM world WHERE name = 'Germany';

-- 2. Страны с населением больше 50 млн
SELECT name, population FROM world WHERE population > 50000000;

-- 3. Страны Европы
SELECT name, population FROM world WHERE continent = 'Europe';

-- 4. Несколько стран сразу (IN)
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 5. Население от 1 до 2 млн (BETWEEN)
SELECT name, population FROM world
WHERE population BETWEEN 1000000 AND 2000000;

-- 6. Название содержит United (LIKE)
SELECT name FROM world WHERE name LIKE '%United%';

-- 7. Большая по площади ИЛИ по населению, но не обе сразу (XOR, MySQL)
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000;

-- 8. Население Европы в миллионах, округлено (ROUND)
SELECT name, ROUND(population / 1000000, 2) AS population_mln
FROM world WHERE continent = 'Europe';

-- 9. Сколько стран на каждом континенте (GROUP BY)
SELECT continent, COUNT(name) AS countries
FROM world GROUP BY continent;

-- 10. Население по континентам в миллионах
SELECT continent, ROUND(SUM(population) / 1000000) AS total_mln
FROM world GROUP BY continent;
