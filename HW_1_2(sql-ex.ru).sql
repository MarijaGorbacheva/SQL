HW_1_2.sql

-- Задание: 1
select model, speed, hd from PC
where price < 500

-- Задание: 2
Select DISTINCT maker from product 
where model in (select model from printer)

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