HW_1_2.sql

-- Задание: 1 - Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
SELECT model, speed, hd FROM PC
WHERE price < 500

-- Задание: 2 - Найдите производителей принтеров. Вывести: maker
SELECT DISTINCT maker FROM product 
WHERE type = 'printer'

-- Задание: 3 - Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT model, ram, screen FROM laptop
WHERE price > 1000

-- Задание: 4 - Найдите все записи таблицы Printer для цветных принтеров.
SELECT * FROM printer
WHERE color = 'y'

-- Задание: 5 - Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
SELECT model, speed, hd FROM pc
WHERE  (cd = '12x' OR cd = '24x') AND price < 600

-- Задание: 6 - Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT DISTINCT maker, speed
FROM laptop INNER JOIN product 
ON laptop.model = product.model
WHERE laptop.hd >= 10

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
WHERE maker = 'B' AND type = 'printer')


-- Задание: 8  - Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT maker FROM product
WHERE type = 'PC'
EXCEPT
SELECT maker FROM product
WHERE type = 'laptop'

-- Задание: 9  - Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker FROM 
product FULL JOIN pc
ON product.model = pc.model
WHERE product.type = 'pc' AND pc.speed >= 450

-- Задание: 10  - Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT printer.model, price FROM printer
WHERE price = (SELECT max(price) FROM printer)

-- Задание: 11 - Найдите среднюю скорость ПК.
SELECT avg(speed) FROM pc

-- Задание: 12 - Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT avg(speed) AS avg_speed FROM laptop
WHERE price > 1000

-- Задание: 13 - Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT avg(speed) AS avg_speed FROM pc
WHERE model IN (SELECT model FROM product
WHERE maker = 'A')

-- Задание: 14 - Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT DISTINCT classes.class, name, country FROM
classes RIGHT JOIN ships
ON classes.class = ships.class
WHERE numGuns >= 10


-- Задание: 15 - Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT hd FROM pc
GROUP BY hd
HAVING count(hd) >=2

-- Задание: 16 - Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT PC.model, PC1.model, PC.speed, PC.ram  
FROM PC INNER JOIN PC AS PC1 
ON  PC.speed = PC1.speed 
AND PC.ram = PC1.ram AND PC.model != PC1.model AND PC.model > PC1.model

-- Задание: 17 - Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed
SELECT DISTINCT Product.type, Laptop.model, Laptop.speed FROM Laptop, Product
WHERE Laptop.speed < (SELECT min(speed) FROM PC) 
AND Product.type = 'Laptop'

-- Задание: 18 - Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
SELECT DISTINCT Product.maker, Printer.price
FROM Product INNER JOIN Printer
ON Product.model = Printer.model AND Product.type = 'Printer'
WHERE Printer.color = 'y' AND Printer.price = (
    SELECT MIN(price) FROM Printer
    WHERE color = 'y'
    )

-- Задание: 19 - Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
SELECT maker, AVG(screen) 
FROM Product INNER JOIN Laptop
ON Product.model = Laptop.model
GROUP BY Product.maker

-- Задание: 20 - Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
SELECT Product.maker, COUNT(model) FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(model) >= 3

-- Задание: 21 - Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. Вывести: maker, максимальная цена.
SELECT Product.maker, MAX(PC.price) 
FROM Product INNER JOIN PC
ON Product.model = PC.model
WHERE Product.type = 'PC'
GROUP BY Product.maker

-- Задание: 22 - Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
SELECT speed, AVG(price) FROM PC
WHERE speed > 600
GROUP BY speed

-- 
-- 
-- 
-- 
-- 
-- 
-- 