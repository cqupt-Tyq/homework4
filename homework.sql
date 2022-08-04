/*第一题*/
create table emoloyees1
(
    emp_no     int         null,
    brith_date date        null,
    first_name varchar(32) null,
    last_name  varchar(32) null,
    gender     varchar(32) null,
    hire_date  date        null
);
insert into emoloyees1(emp_no, brith_date, first_name, last_name, gender, hire_date) values (10001,str_to_date('1953-09-02','%Y-%m-%d'),'Georgi','Facello','M',str_to_date('1986-06-26','%Y-%m-%d'));
insert into emoloyees1(emp_no, brith_date, first_name, last_name, gender, hire_date) values (10002,str_to_date('1964-06-02','%Y-%m-%d'),'Bezalel','Smimel','F',str_to_date('1985-11-21','%Y-%m-%d'));
insert into emoloyees1(emp_no, brith_date, first_name, last_name, gender, hire_date) values (10003,str_to_date('1959-12-03','%Y-%m-%d'),'Parto','Bamford','M',str_to_date('1986-08-28','%Y-%m-%d'));
insert into emoloyees1(emp_no, brith_date, first_name, last_name, gender, hire_date) values (10004,str_to_date('1954-05-01','%Y-%m-%d'),'Christian','Koblick','M',str_to_date('1986-12-01','%Y-%m-%d'));

show databases ;

create table thelastemoloyee
as
select
    emp_no, brith_date, first_name, last_name, gender, max(hire_date)
from
    emoloyees1;


/*第二题*/

select
    f.film_id,f.title
from
    film f
        left join film_category fc
                  on
                          f.film_id=fc.film_id
where fc.film_id is null ;

/*第三题*/

select *
from  employees limit 5,5;



/*第四题*/
CREATE TABLE actor  (
                        actor_id  smallint(5)  NOT NULL PRIMARY KEY,
                        first_name  varchar(45) NOT NULL,
                        last_name  varchar(45) NOT NULL,
                        last_update  datetime NOT NULL
);

create unique index uniq_idx_firstname on actor(first_name);
create index idx_lastname on actor(last_name);



/*第五题*/
create table passing_number(
              id int PRIMARY KEY ,
              number int null
);
insert into passing_number VALUES (1,4);
insert into passing_number VALUES (2,3);
insert into passing_number VALUES (3,3);
insert into passing_number VALUES (4,2);
insert into passing_number VALUES (5,5);
insert into passing_number VALUES (6,4);

select id,number,
       DENSE_RANK() OVER (ORDER BY number DESC) as t_rank
FROM passing_number
ORDER BY t_rank,id;
