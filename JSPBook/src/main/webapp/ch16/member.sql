-- Active: 1758675368804@@127.0.0.1@3306@jspbookdb
USE jspbookdb;

CREATE TABLE IF NOT EXISTS member (
	id VARCHAR(20),
  passwd VARCHAR(20),
  name VARCHAR(30),
  PRIMARY KEY (id)
);

INSERT INTO member(id , passwd ,name)
VALUES ('hello2' , '123456' , '박');



SELECT * FROM member;