-- Active: 1758675368804@@127.0.0.1@3306@jspbookdb
USE jspbookdb;

DROP TABLE member;

CREATE TABLE IF NOT EXISTS member (
	id VARCHAR(20),
  passwd VARCHAR(20),
  name VARCHAR(30),
  PRIMARY KEY (id)
);

INSERT INTO member (id, passwd, name) 
VALUES 
	('1', '1234', '홍길순'),
	('2', '1235', '홍길동');

SELECT * FROM member;