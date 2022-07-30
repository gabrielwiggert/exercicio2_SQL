CREATE DATABASE ex02;

CREATE TABLE states (
	id serial NOT NULL PRIMARY KEY,
 	name text NOT NULL
);


CREATE TABLE cities (
	id serial NOT NULL PRIMARY KEY,
 	name text NOT NULL,
	"stateId" integer REFERENCES states(id)
);


CREATE TABLE costumerAddresses (
	id serial NOT NULL PRIMARY KEY,
	costumerId serial NOT NULL PRIMARY KEY,
 	street text NOT NULL,
	number integer NOT NULL,
	complement text,
	postalCode integer NOT NULL,
	"cityId" integer REFERENCES cities(id)
);

CREATE TABLE costumerPhones (
	id serial NOT NULL PRIMARY KEY,
	"costumerId" integer REFERENCES costumerAddresses(costumerId),
	number INT(11) NOT NULL,
	type varchar(15)
);

CREATE TABLE costumers (
	"id" integer REFERENCES costumerAddresses(costumerId),
	fullName text NOT NULL,
	cpf INT(11) NOT NULL UNIQUE,
	email text NOT NULL
	password varchar(20)
);

-- verificar uniques e defaults

CREATE TABLE colinhaIgnore (
	id serial NOT NULL PRIMARY KEY,
  	description text,
  	"imageUrl" text NOT NULL,
  	"userId" integer REFERENCES users(id),
  	"datePosted" timestamp NOT NULL DEFAULT NOW(),
  	active boolean NOT NULL DEFAULT false,
);
