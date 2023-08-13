# Задача 1. Построить и заполнить таблицу

create table ParentOf(parent text, child text);

insert into ParentOf values ('Alice', 'Carol');
insert into ParentOf values ('Bob', 'Carol');
insert into ParentOf values ('Carol', 'Dave');
insert into ParentOf values ('Carol', 'George');
insert into ParentOf values ('Dave', 'Mary');
insert into ParentOf values ('Eve', 'Mary');
insert into ParentOf values ('Mary', 'Frank');

Используя рекурсивные запросы найти:
1. Предков Mary;
2. Потомков Carol.

# Задача 2. Построить и заполнить таблицы

create table Employee(ID int, salary int); --ID работников и их зарплаты
create table Manager(mID int, eID int); -- ID руководитель, ID подчинённый
create table Project(name text, mgrID int); -- название проекта и ID руководителя

insert into Employee values (123, 100);
insert into Employee values (234, 90);
insert into Employee values (345, 80);
insert into Employee values (456, 70);
insert into Employee values (567, 60);
insert into Manager values (123, 234);
insert into Manager values (234, 345);
insert into Manager values (234, 456);
insert into Manager values (345, 567);
insert into Project values ('X', 123); 

Используя рекурсивный запрос найти совокупную зарплату на проекте.

# Задача 3. Используя рекурсивный запрос, вывести первые 10 чисел Фибоначчи
