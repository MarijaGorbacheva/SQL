HW_1_2.sql

-- Задание: 1
select model, speed, hd from PC
where price < 500

-- Задание: 2
Select DISTINCT maker from product 
where type = 'printer'

-- Задание: 3
Select model, ram, screen from laptop
where price > 1000

-- Задание: 4
Select * from printer
where color = 'y'

-- Задание: 5
Select model, speed, hd from pc
where  (cd = '12x' or cd = '24x') and price < 600

-- Задание: 6
Select distinct maker, speed
from laptop inner join product 
on laptop.model = product.model
where laptop.hd >= 10

-- Задание: 7 
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


-- Задание: 8 
Select maker from product
where type = 'PC'
except
select maker from product
where type = 'laptop'

-- Задание: 9 
Select distinct maker from 
product full join pc
on product.model = pc.model
where product.type = 'pc' and pc.speed >= 450

-- Задание: 10 
Select printer.model, price from printer
where price = (select max(price) from printer)

-- Задание: 11
Select avg(speed) from pc

-- Задание: 12
Select avg(speed) as avg_speed from laptop
where price > 1000

-- Задание: 13
Select avg(speed) as avg_speed from pc
where model in (select model from product
where maker = 'A')

-- 


-- 
-- 
-- 
-- 
-- 