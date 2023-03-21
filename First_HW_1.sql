create table employees(
	id serial primary key, 
	employee_name varchar(50) not null
);

select * from employees

insert into employees (employee_name) 
values  ('person_1'),
		('person_2'),
		('person_3'),
		('person_4'),
		('person_5'),
		('person_6'),
		('person_7'),
		('person_8'),
		('person_9'),
		('person_10'),
		('person_11'),
		('person_12'),
		('person_13'),
		('person_14'),
		('person_15'),
		('person_16'),
		('person_17'),
		('person_18'),
		('person_19'),
		('person_20'),
		('person_21'),
		('person_22'),
		('person_23'),
		('person_24'),
		('person_25'),
		('person_26'),
		('person_27'),
		('person_28'),
		('person_29'),
		('person_30'),
		('person_31'),
		('person_32'),
		('person_33'),
		('person_34'),
		('person_35'),
		('person_36'),
		('person_37'),
		('person_38'),
		('person_39'),
		('person_40'),
		('person_41'),
		('person_42'),
		('person_43'),
		('person_44'),
		('person_45'),
		('person_46'),
		('person_47'),
		('person_48'),
		('person_49'),
		('person_50'),
		('person_51'),
		('person_52'),
		('person_53'),
		('person_54'),
		('person_55'),
		('person_56'),
		('person_57'),
		('person_58'),
		('person_59'),
		('person_60'),
		('person_61'),
		('person_62'),
		('person_63'),
		('person_64'),
		('person_65'),
		('person_66'),
		('person_67'),
		('person_68'),
		('person_69'),
		('person_70');
	
create table salary(
	id serial primary key,
	monthly_salary int not null
);
			
select * from salary;

insert into salary (monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
)

select * from employee_salary 

insert into employee_salary (employee_id, salary_id)
values  (1, 1),
		(2, 2),
		(3, 3),
		(4, 4),
		(5, 5),
		(6, 6),
		(7, 7),
		(8, 8),
		(9, 9),
		(10, 10),
		(11, 11),
		(12, 12),
		(13, 13),
		(14, 14),
		(15, 15),
		(16, 16),
		(17, 1),
		(18, 2),
		(19, 3),
		(20, 4),
		(21, 5),
		(22, 6),
		(23, 7),
		(24, 8),
		(25, 9),
		(26, 10),
		(27, 11),
		(28, 12),
		(29, 13),
		(30, 14),
		(78, 15),
		(90, 16),
		(102, 1),
		(87, 2),
		(302, 3),
		(73, 4),
		(509,5 ),
		(84, 6),
		(6687,7),
		(158, 8),
		(92, 9),
		(752,10),
		(604, 11),
		(96, 12)
		
create table roles(
id serial primary key,
role_name int not null unique
);

select * from roles

ALTER TABLE roles
alter column role_name type VARCHAR(30);

SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'roles'

 insert into roles (role_name)
 values ('Junior_Python_developer'),
		('Middle_Python_developer'),
		('Senior_Python_developer'),
		('Junior_Java_developer'),
		('Middle_Java_developer'),
		('Senior_Java-developer'),
		('Junior_JavaScript_developer'),
		('Middle_JavaScript_developer'),
		('Senior_JavaScript_developer'),
		('Junior_Manual_QA_engineer'),
		('Middle_Manual_QA_engineer'),
		('Senior_Manual_QA_engineer'),
		('Project_Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales_manager'),
		('Junior_Automation_QA_engineer'),
		('Middle_Automation_QA_engineer'),
		('Senior_Automation_QA_engineer')

		
create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees (id)
);

select * from salary;
select * from employees;
select * from employee_salary;
select * from roles;
select * from roles_employee;

insert into roles_employee (employee_id, role_id)
values  (1, 1),
		(2, 2),
		(3, 3),
		(4, 4),
		(5, 5),
		(6, 6),
		(7, 7),
		(8, 8),
		(9, 9),
		(10, 10),
		(11, 11),
		(12, 12),
		(13, 13),
		(14, 14),
		(15, 15),
		(16, 16),
		(17, 17),
		(18, 18),
		(19, 19),
		(20, 20),
		(21, 1),
		(22, 2),
		(23, 3),
		(24, 4),
		(25, 5),
		(26, 6),
		(27, 7),
		(28, 8),
		(29, 9),
		(30, 10),
		(31, 11),
		(32, 12),
		(33, 13),
		(34, 14),
		(35, 15),
		(36, 16),
		(37, 17),
		(38, 18),
		(39, 19),
		(40, 20),
		(41, 1),
		(42, 2),
		(43, 3),
		(44, 4),
		(45, 5),
		(46, 6),
		(47, 7),
		(48, 8),
		(49, 9),
		(50, 10),
		(51, 11),
		(52, 12),
		(53, 13),
		(54, 14),
		(55, 15),
		(56, 16),
		(57, 17),
		(58, 18),
		(59, 19),
		(60, 20),
		(61, 1),
		(62, 2),
		(63, 3),
		(64, 4),
		(65, 5),
		(66, 6),
		(67, 7),
		(68, 8),
		(69, 9),
		(70, 10)


CREATE TABLE public.students (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	created_on timestamp NOT NULL,
	CONSTRAINT students_email_key UNIQUE (email),
	CONSTRAINT students_pkey PRIMARY KEY (id)
);



