-- SQL-команды
create table table_1
(user_id varchar(100) primary key,
 person_name varchar(255) not null
);

create table table_2
(user_id varchar(100) references table_1(user_id) not null,
 email varchar(255)
);

INSERT INTO table_1 (user_id, person_name) VALUES
('1fgh5f6g5hfg', 'Петров'),
('6ghf5hyhbg5', 'Иванов'),
('7hgg58jyhg5h', 'Сидоров');

INSERT INTO table_2 (user_id, email) VALUES
('1fgh5f6g5hfg', 'petrov@mail.ru'),
('6ghf5hyhbg5', 'ivanov@mail.ru'),
('7hgg58jyhg5h', 'sidorov@mail.ru');

select user_id, person_name, email from table_1
inner join table_2 using(user_id)
