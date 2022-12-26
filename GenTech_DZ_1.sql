-- 1. Создать таблицу students
-- id уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10
-- subject varchar not null
-- mark integer от 0 до 5

-- 2.Заполнить таблицу строками (10 шт)

-- 3.Удалить из таблицы студентов, у которых оценка 0

-- 4.Найти всех студентов, у которых оценка выше 3

-- 5.Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3

-- 6.Удалить из таблицы этих студентов

-- 7.Найти всех студентов, у которых длина имени больше 4 букв

-- 8.Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 
-- символов.

-- 9.В таблице оставить тех студентов, которые (проходят Х предмет и оценка выше 4) и тех 
-- студентов (которые учатся 7-10 классах и у них оценки ниже 3).

-- 10.Удалить таблицу.

create database homework;
use homework;

-- //---------1---------//
create table students(
id integer primary key not null auto_increment,
firstname varchar(100) not null,
lastname varchar(100) not null,
class integer check(class between 1 and 10),
subject varchar(50) not null,
mark integer check(mark between 0 and 5)
);
-- //---------2---------//
insert into students(firstname, lastname, class, subject, mark)
values('Lina', 'Vojt', 5, 'Math', 4),
('Anna', 'Kim', 7, 'History', 5),
('Victor', 'Pirnak', 8, 'X', 1),
('Timo', 'Viorg', 10, 'X', 5),
('Svit', 'Polik', 1, 'X', 4),
('Lana', 'Viorg', 8, 'X', 3),
('Oleg', 'Velichko', 9, 'Math', 5),
('Asia', 'Viktjuk', 1, 'X', 2),
('Serhijr', 'Ruban', 6, 'History', 4),
('Emanuil', 'Schwiman', 5, 'X', 0);

select * from students;
set sql_safe_updates = 0;
-- //---------3---------//
delete from students
where mark = 0;
-- //---------4---------//
select * from students
where mark > 3;
-- //---------5---------//
select * from students
where class = 1 and mark < 3;
-- //---------6---------//
delete from students
where class = 1 and mark < 3;
-- //---------7---------//
select * from students
where length(firstname) > 4;
-- //---------8---------//
select * from students
where firstname like 'a%' and length(firstname) > 2;
-- //---------9---------//
delete from students
where not ((subject = 'X' and mark > 4) or (class between 7 and 10 and mark < 3));
-- //---------10---------//
drop table students;