use master
go
drop database energysport
go 
create database energysport
go
use energysport
go

create table categories(
	id            varchar(255)      primary key,
	[name]        nvarchar(255)     not null,
	[image]       varchar(255)      not null,
	available     bit               default 1
)
go

create table products(
	Id            bigint            primary key identity,
	[name]        nvarchar(255)     not null,
	[thumbnail]   varchar(255)      not null,
	price         float             not null default 0,
	createDate    date              not null default getDate(),
	available     bit               default 1,
	[description] nvarchar(MAX),
	bigDescription nvarchar(MAX),
	quantity      bigint,
	categoryId    varchar(255)      foreign key references categories(id)
)
go

create table productImage(
	id            bigint            primary key identity,
	[image]       varchar(255)      not null,
	productId     bigint            foreign key references products(id), 
	available     bit               default 1
)
go

create table size(
	id            bigint            primary key identity,
	[name]        nvarchar(255)      not null,
	available     bit               default 1
)
go

create table color(
	id            bigint            primary key identity,
	[name]        nvarchar(255)      not null,
	available     bit               default 1
)
go

create table productAttribute(
	id            bigint            primary key identity,
	productId     bigint            foreign key references products(id), 
	colorId       bigint            foreign key references color(id),
	sizeId        bigint            foreign key references size(id),
	stock         bigint,
	available     bit                default 1
)
go

create table accounts(
	username      varchar(255)      primary key,
	[password]    nvarchar(255)     not null,
	fullname      nvarchar(255)     not null,
	email         nvarchar(255)     not null,
	photo         varchar(255)      not null,
	createDate    date              not null default getDate(),
	available     bit               default 1,
	CONSTRAINT UC_email UNIQUE (email)
)
go

create table orders(
	id            bigint            primary key identity, 
	username      varchar(255)      foreign key references accounts(username),
	createDate    datetime          not null default getDate(),
	phone         nvarchar(255),
	[address]     nvarchar(255)     not null,
	available     bit               default 1,
	paymentStatus bit               default 0,
	orderStatus   int
)
go

create table orderDetails(
	id            bigint            primary key identity,
	orderId       bigint            foreign key references orders(id),
	productId     bigint            foreign key references products(id),              
	price         float             not null default 0,
	quantity      int               not null default 1,
	productAttributeId bigint       Foreign key references productAttribute(id),
	available     bit               default 1
)
go


create table roles(
	id            varchar(255)      primary key,
	[name]        nvarchar(255)     not null,
	available     bit               default 1
)
go

create table authorities(
	id            bigint            primary key IDENTITY(0, 1),
	username      varchar(255)      Foreign key references accounts(username),
	roleId        varchar(255)      Foreign key references Roles(Id),
	available     bit               default 1
)
go

create table favorites(
	id            bigint            primary key IDENTITY(0, 1),
	username      varchar(255)      Foreign key references accounts(username),
	productId     bigint            foreign key references products(id),

)

create table rating(
	id            bigint            primary key IDENTITY(0, 1),
	content       nvarchar(MAX),   
	rating        int,
	username      varchar(255),   
	createDate    datetime          not null default getDate(),
	productId     bigint            foreign key references products(id),
	orderId       bigint            foreign key references orders(id),
)


--select * from orders
--select * from orderDetails


--ALTER TABLE orders
--ADD paymentStatus bit default 0;

--ALTER TABLE orders
--ADD orderStatus int ;
--ALTER TABLE accounts ADD CONSTRAINT UC_email UNIQUE (email);

--ALTER TABLE orderDetails
--ADD productAttributeId bigint Foreign key references productAttribute(id);


--ALTER TABLE accounts ADD CONSTRAINT fk_role_id FOREIGN KEY (roleId) REFERENCES Roles(Id);
--ALTER TABLE accounts DROP CONSTRAINT fk_role_id;
--ALTER TABLE accounts DROP COLUMN roleId;

--select * from accounts






