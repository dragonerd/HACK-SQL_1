create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table priorities(
	id_priority integer primary key,
	type_name varchar(50)
);

create table contact_request(
 id_email serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 id_priority integer not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country),
 foreign key (id_priority) references priorities (id_priority) 
);


insert into countries (name) values ('venezuela') , ('colombia'),('brazil'), ('peru'), ('panama');
select * from countries;

insert into priorities (id_priority, type_name) values ('1','low') , ('2','medium'),('3','high');
select * from priorities;

insert into contact_request (id_email, id_country, email, id_priority, name) values 
('1','1','prueba@gmail.com', '1', 'prueba1'),
('2','2','prueba2@gmail.com', '2', 'prueba2'),
('3','3','prueba3@gmail.com', '3', 'prueba3');
select * from contact_request;

delete from contact_request where id_email='3';

update contact_request set id_country='3' where email='prueba@gmail.com';