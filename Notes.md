Конспект по SQL

Мои заметки по основам SQL. Пишу простыми словами, чтобы потом самому легко повторять.
Примеры с таблицей world (страны) взяты из SQLZoo.

Шаг 1. SELECT, FROM, WHERE

	•	SELECT - что показать
	•	FROM - из какой таблицы
	•	WHERE - фильтр: только те строки, где выполняется условие

Пример: есть таблица cars с колонками id, brand (марка), year (год), price (цена).

SELECT brand, price FROM cars WHERE year > 2020;

Читается так: покажи марку и цену машин, у которых год выпуска больше 2020.

Шаг 2. JOIN (соединение таблиц)

Данные обычно лежат в разных таблицах. JOIN склеивает их по общему полю.

Пример: таблица clients (клиенты) и таблица payments (платежи). У платежа есть client_id, у клиента есть id. Это и есть связь.

	1.	FROM clients - берём клиентов
	2.	JOIN payments - присоединяем платежи
	3.	ON ... - по какому правилу присоединяем

SELECT clients.name, payments.amount
FROM clients
JOIN payments ON clients.id = payments.client_id;

Шаг 3. GROUP BY

Нужен, когда надо посчитать итог по группам. Например, не каждый платёж отдельно, а общую сумму платежей каждого клиента.

SELECT clients.name, SUM(payments.amount) AS total
FROM clients
JOIN payments ON clients.id = payments.client_id
GROUP BY clients.name;

	•	SUM(...) складывает числа
	•	GROUP BY clients.name делает это для каждого уникального имени
	•	AS total даёт колонке понятное название

Шаг 4. IN

Вместо длинной цепочки OR:

WHERE name = 'Germany' OR name = 'France' OR name = 'Italy'

можно передать список в скобках:

SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

Шаг 5. BETWEEN

Значения в диапазоне (от и до, границы входят):

SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 2000000;

Шаг 6. LIKE

Знак % значит "любые символы".

	•	'United%' - начинается с United
	•	'%United' - заканчивается на United
	•	'%United%' - содержит United где угодно

SELECT name
FROM world
WHERE name LIKE '%United%';

Шаг 7. OR и XOR

	•	OR - подходит, если выполняется хотя бы одно условие (или оба)
	•	XOR - подходит, если выполняется только одно из двух, но не оба сразу

-- OR: большая по площади или по населению
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- XOR: только одно из двух условий (работает в MySQL)
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

Если XOR в базе нет, то же самое пишется так:

WHERE (area > 3000000 OR population > 250000000)
  AND NOT (area > 3000000 AND population > 250000000)

Шаг 8. ROUND

Округляет число. Синтаксис: ROUND(число, знаков_после_запятой).
