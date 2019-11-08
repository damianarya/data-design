drop table if exists orders;
drop table if exists restaurant;
drop table if exists profile;
drop table if exists todo;

create table profile(
	profileId binary(16) not null,
	oderAddress varchar(255) not null,
	profileAuthenticationToken char(32),
	profileEmail varchar(128) not null,
	profileName varchar(32) not null,
	profilePhone char(11) not null,
	unique(profileEmail),
	unique(profileName),
	index(profileEmail),
	primary key (profileId)
	);

create table restaurant (
	restaurauntId       binary(16)     not null,
	restaurantProfileId binary(16)     not null,
	restauntMenu        varchar(40000) not null,
	restaurantName      varchar(64)    not null,
	index (restaurantProfileId),
	index (restaurauntId),
	foreign key (restaurantProfileId) references profile(profileId),
	primary key (restaurauntId)
);


create table orders (
   orderId binary(16) not null,
   orderProfileId binary(16) not null,
   orderRestaurantId binary(16) not null,
   conformationPayment char(97) not null,
   orderAddress varchar(255)not null,
   orderConformation binary (1) not null,
   orderZipCode char(5) not null,
   index (orderId),
   foreign key (orderProfileId) references profile (profileId),
   foreign key  (orderRestaurantId) references restaurant (restaurauntId),
   primary key (orderId)
);
/**
  this table is for assessment 1
 */

create table todo(
	todoId binary(16) not null,
	todoAuthor varchar(128) not null,
	todoDate char(8),
	todoTask varchar(255) not null,
	unique(todoId),
	unique(todoAuthor),
	index(todoDate),
	index(todoTask),
	primary key (todoId)
);