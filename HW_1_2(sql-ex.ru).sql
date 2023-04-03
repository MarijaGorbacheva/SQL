HW_1_2.sql

-- Задание: 1 - Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
select model, speed, hd from PC
where price < 500

-- Задание: 2 - Найдите производителей принтеров. Вывести: maker
Select DISTINCT maker from product 
where type = 'printer'

-- Задание: 3 - Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
Select model, ram, screen from laptop
where price > 1000

-- Задание: 4 - Найдите все записи таблицы Printer для цветных принтеров.
Select * from printer
where color = 'y'

-- Задание: 5 - Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Select model, speed, hd from pc
where  (cd = '12x' or cd = '24x') and price < 600

-- Задание: 6 - Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
Select distinct maker, speed
from laptop inner join product 
on laptop.model = product.model
where laptop.hd >= 10

-- Задание: 7  - Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
select model, price from PC
where model in (select model from product
where maker = 'B' and type = 'PC')
union
select model, price from laptop 
where model in (select model from product
where maker = 'B' and type = 'laptop')
union
select model, price from printer
where model in (select model from product
where maker = 'B' and type = 'printer')


-- Задание: 8  - Найдите производителя, выпускающего ПК, но не ПК-блокноты.
Select maker from product
where type = 'PC'
except
select maker from product
where type = 'laptop'

-- Задание: 9  - Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
Select distinct maker from 
product full join pc
on product.model = pc.model
where product.type = 'pc' and pc.speed >= 450

-- Задание: 10  - Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
Select printer.model, price from printer
where price = (select max(price) from printer)

-- Задание: 11 - Найдите среднюю скорость ПК.
Select avg(speed) from pc

-- Задание: 12 - Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
Select avg(speed) as avg_speed from laptop
where price > 1000

-- Задание: 13 - Найдите среднюю скорость ПК, выпущенных производителем A.
Select avg(speed) as avg_speed from pc
where model in (select model from product
where maker = 'A')

-- Задание: 14 - Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
select distinct classes.class, name, country from
classes right join ships
on classes.class = ships.class
where numGuns >= 10


-- Задание: 15 - Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
select hd from pc
group by hd
having count(hd) >=2

-- Задание: 16 - Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select distinct PC.model, PC1.model, PC.speed, PC.ram  
from PC INNER JOIN PC as PC1 
ON  PC.speed = PC1.speed 
AND PC.ram = PC1.ram AND PC.model != PC1.model AND PC.model > PC1.model

-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 