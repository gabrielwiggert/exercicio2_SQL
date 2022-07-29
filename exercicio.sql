CREATE DATABASE drivengram;

CREATE TABLE users (
	id serial NOT NULL PRIMARY KEY,
  name text NOT NULL,
	cpf varchar(11) NOT NULL UNIQUE,
  email text NOT NULL UNIQUE,
  password text NOT NULL
);

CREATE TABLE posts (
	id serial NOT NULL PRIMARY KEY,
  description text,
  "imageUrl" text NOT NULL,
  "userId" integer REFERENCES users(id),
  "datePosted" timestamp NOT NULL DEFAULT NOW(),
  active boolean NOT NULL DEFAULT false,
);
