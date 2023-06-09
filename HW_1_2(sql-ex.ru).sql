HW_1_2.sql

-- Задание: 1 - Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
SELECT model, speed, hd FROM PC
WHERE price < 500;

-- Задание: 2 - Найдите производителей принтеров. Вывести: maker
SELECT DISTINCT maker FROM Product 
WHERE type = 'printer';

-- Задание: 3 - Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT model, ram, screen FROM Laptop
WHERE price > 1000;

-- Задание: 4 - Найдите все записи таблицы Printer для цветных принтеров.
SELECT * FROM printer
WHERE color = 'y';

-- Задание: 5 - Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
SELECT model, speed, hd FROM PC
WHERE  (cd = '12x' OR cd = '24x') AND price < 600;

-- Задание: 6 - Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT DISTINCT maker, speed
FROM laptop INNER JOIN product 
ON laptop.model = product.model
WHERE laptop.hd >= 10;

-- Задание: 7  - Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT model, price FROM PC
WHERE model IN (SELECT model FROM product
WHERE maker = 'B' AND type = 'PC')
UNION
SELECT model, price FROM laptop 
WHERE model IN (SELECT model FROM product
WHERE maker = 'B' AND type = 'laptop')
UNION
SELECT model, price FROM printer
WHERE model IN (SELECT model FROM product
WHERE maker = 'B' AND type = 'printer');


-- Задание: 8  - Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT maker FROM product
WHERE type = 'PC'
EXCEPT
SELECT maker FROM product
WHERE type = 'laptop';

-- Задание: 9  - Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker FROM 
product FULL JOIN PC
ON product.model = PC.model
WHERE product.type = 'PC' AND PC.speed >= 450;

-- Задание: 10  - Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT printer.model, price FROM printer
WHERE price = (SELECT MAX(price) FROM printer);

-- Задание: 11 - Найдите среднюю скорость ПК.
SELECT AVG(speed) FROM PC;

-- Задание: 12 - Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed) AS avg_speed FROM laptop
WHERE price > 1000;

-- Задание: 13 - Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(speed) AS avg_speed FROM PC
WHERE model IN (SELECT model FROM product
WHERE maker = 'A');

-- Задание: 14 - Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT DISTINCT classes.class, name, country FROM
classes RIGHT JOIN ships
ON classes.class = ships.class
WHERE numGuns >= 10;


-- Задание: 15 - Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT hd FROM PC
GROUP BY hd
HAVING COUNT(hd) >=2;

-- Задание: 16 - Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT PC.model, PC1.model, PC.speed, PC.ram  
FROM PC INNER JOIN PC AS PC1 
ON  PC.speed = PC1.speed 
AND PC.ram = PC1.ram AND PC.model != PC1.model AND PC.model > PC1.model;

-- Задание: 17 - Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed
SELECT DISTINCT Product.type, Laptop.model, Laptop.speed FROM Laptop, Product
WHERE Laptop.speed < (SELECT min(speed) FROM PC) 
AND Product.type = 'Laptop';

-- Задание: 18 - Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
SELECT DISTINCT Product.maker, Printer.price
FROM Product INNER JOIN Printer
ON Product.model = Printer.model AND Product.type = 'Printer'
WHERE Printer.color = 'y' AND Printer.price = (
    SELECT MIN(price) FROM Printer
    WHERE color = 'y';
    )

-- Задание: 19 - Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
SELECT maker, AVG(screen) 
FROM Product INNER JOIN Laptop
ON Product.model = Laptop.model
GROUP BY Product.maker;

-- Задание: 20 - Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
SELECT Product.maker, COUNT(model) FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(model) >= 3;

-- Задание: 21 - Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. Вывести: maker, максимальная цена.
SELECT Product.maker, MAX(PC.price) 
FROM Product INNER JOIN PC
ON Product.model = PC.model
WHERE Product.type = 'PC'
GROUP BY Product.maker;

-- Задание: 22 - Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
SELECT speed, AVG(price) FROM PC
WHERE speed > 600
GROUP BY speed;

-- Задание: 23 - Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker
SELECT maker FROM Product INNER JOIN PC
ON Product.model = PC.model
WHERE Product.type = 'PC' AND PC.speed >= 750
INTERSECT
SELECT maker FROM Product INNER JOIN Laptop
ON Product.model = Laptop.model
WHERE Product.type = 'Laptop' AND Laptop.speed >= 750;

-- Задание: 24 - Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
SELECT model FROM (
SELECT model, price FROM PC
UNION
SELECT model, price FROM Laptop
UNION
SELECT model, price FROM Printer
) AS Price
WHERE Price.price IN (
SELECT MAX(Price) FROM ( 
SELECT Price FROM PC
UNION
SELECT Price FROM Laptop
UNION
SELECT Price FROM Printer
) AS MAX_Price);

-- Задание: 25 - Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
SELECT DISTINCT maker FROM Product
WHERE model IN (
SELECT model FROM PC
WHERE ram = (
  SELECT MIN(ram) FROM PC
  )
AND speed = (
  SELECT MAX(speed) FROM PC
  WHERE ram = (
   SELECT MIN(ram) FROM PC
   )
  )
)
AND maker IN (
SELECT maker FROM Product
WHERE type='Printer'
);

-- Задание: 26 - Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
SELECT AVG(Price) AS AVG_Price FROM (
SELECT price, model FROM PC
UNION ALL
SELECT price, model FROM Laptop) AS priceS
INNER JOIN Product
ON priceS.model = Product.model
WHERE maker = 'A';

-- Задание: 27 - Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
SELECT Product.maker, AVG(HD) AS AVG_HD FROM 
Product INNER JOIN PC
ON Product.model = PC.model
WHERE maker IN (
SELECT maker FROM Product
WHERE type = 'printer')
GROUP BY maker;

-- Задание: 28 - Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
SELECT COUNT(maker) FROM Product
WHERE maker IN (
   SELECT maker FROM Product
   GROUP BY maker
   HAVING COUNT(model) = 1);

-- Задание: 29 - В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
SELECT Income_o.point, Income_o.date, Income_o.inc, Outcome_o.out FROM Income_o LEFT JOIN Outcome_o ON Income_o.point = Outcome_o.point AND Income_o.date = Outcome_o.date
UNION
SELECT Outcome_o.point, Outcome_o.date, Income_o.inc, Outcome_o.out FROM Income_o RIGHT JOIN Outcome_o ON Income_o.point = Outcome_o.point AND Income_o.date = Outcome_o.date

-- Задание: 30 - В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка. Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
SELECT point, date, SUM(sum_out), SUM(sum_inc)
FROM (SELECT point, date, SUM(inc) AS sum_inc, null AS sum_out FROM Income 
GROUP BY point, date
UNION
SELECT point, date, null AS sum_inc, SUM(out) AS sum_out FROM Outcome 
GROUP BY point, date ) AS t
GROUP BY point, date
ORDER BY point

-- 
-- 
-- 
-- 
-- 