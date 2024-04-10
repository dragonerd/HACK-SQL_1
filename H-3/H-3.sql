
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

