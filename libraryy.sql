create database libraryy;
USE libraryy;

CREATE TABLE book_details
(
book_id int NOT NULL AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
author VARCHAR(255) NOT NULL,
released_year int NOT NULL,
PRIMARY KEY (book_id)
);

INSERT INTO 
       book_details(title,author,released_year)
VALUES
       ('The Alchemist','Paulo Coelho',2005),
       ('My Journey','Dr. A.P.J. Abdul Kalam',2013),
       ('Whispers of Time','Dr. Krishna Saksena',2019),
       ('Atomic Habits','James Clear',2018),
       ('The Secret','Rhonda Byrne',2006);

CREATE TABLE book_category
(
book_id int NOT NULL,
category VARCHAR(255) NOT NULL,
FOREIGN KEY (book_id) REFERENCES book_details(book_id)
);

INSERT INTO 
       book_category(book_id,category)
VALUES
       (2,'fiction'),
       (5,'fantasy'),
       (1,'comic'),
       (3,'non-fiction'),
       (4,'mystery');
       
CREATE TABLE book_location
(
book_id int NOT NULL,
location VARCHAR(255) NOT NULL,
stock_quantity INT NOT NULL,
FOREIGN KEY (book_id) REFERENCES book_details(book_id)
);

INSERT INTO 
       book_location(book_id,location,stock_quantity)
VALUES
       (2,'shelf 9',7),
       (1,'shelf 5',1),
       (4,'shelf 2',15),
       (5,'shelf 7',65),
       (3,'shelf 1',5);

CREATE TABLE student_details
(
student_name VARCHAR(255) NOT NULL,
roll_number int NOT NULL,
contact VARCHAR(255) NOT NULL,
PRIMARY KEY (roll_number)
);

INSERT INTO 
       student_details(student_name,roll_number,contact)
VALUES
       ('Nithesh',0058,'9994023376'),
       ('Akash',0043,'9996789376'),
       ('Thirupathi',0056,'876532368'),
       ('SP',0048,'7666023389'),
       ('Vinayak',0055,'6383114288');
       
CREATE TABLE book_register
(
book_id int NOT NULL,
roll_number int NOT NULL,
issue_id int NOT NULL PRIMARY KEY,
return_status VARCHAR(255) NOT NULL,
FOREIGN KEY (book_id) REFERENCES book_details(book_id),
FOREIGN KEY (roll_number) REFERENCES student_details(roll_number)
);

INSERT INTO 
       book_register(book_id,roll_number,issue_id,return_status)
VALUES
       (3,0058,101,'YES'),
       (2,0043,102,'NO'),
       (5,0056,103,'YES'),
       (4,0048,104,'NO'),
       (1,0055,105,'YES');
       
DELIMITER &&
CREATE PROCEDURE get_borrowed_book(IN student_namee VARCHAR(255))
BEGIN
   SELECT book_details.title,book_details.author,book_details.released_year
   FROM student_details
   INNER JOIN book_register on student_details.roll_number = book_register.roll_number
   INNER JOIN book_details on book_register.book_id = book_details.book_id
   WHERE student_name=student_namee;
END &&
DELIMITER ;

call get_borrowed_book("Nithesh");


