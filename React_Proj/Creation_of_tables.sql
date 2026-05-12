SHOW DATABASES;

CREATE DATABASE RETAIL_STORE_45_NORD;


USE RETAIL_STORE_45_NORD;

CREATE TABLE  RETAIL_STORE_45_NORD.DEPARTMENT (

DepartmentId int AUTO_INCREMENT,
Department_Name nvarchar(30),
PRIMARY KEY(DepartmentId)

);


SHOW TABLES;

INSERT INTO RETAIL_STORE_45_NORD.DEPARTMENT(Department_Name) VALUES ('IT');
INSERT INTO RETAIL_STORE_45_NORD.DEPARTMENT(Department_Name) VALUES ('Sales');


SELECT COUNT(*) FROM DEPARTMENT;


USE RETAIL_STORE_45_NORD;


CREATE TABLE RETAIL_STORE_45_NORD.Employee(
Employee_ID int AUTO_INCREMENT,
Employee_Name nvarchar (500),
Department nvarchar (500),
DateOfJoining datetime,
PhotoFileName nvarchar(500),
PRIMARY KEY(EMPLOYEE_ID)
);
 
 
 SHOW TABLES;
 
 
 INSERT INTO RETAIL_STORE_45_NORD.Employee(Employee_Name,Department,DateOfJoining,PhotoFileName) values ('Bob','IT','2023-01-23','anonymous_sxh5678_ihx5678.png');
 INSERT INTO RETAIL_STORE_45_NORD.Employee(Employee_Name,Department,DateOfJoining,PhotoFileName) values ('Sam','Sales','2022-09-07','anonymous_sxh8978_ihx5078.png');
 INSERT INTO RETAIL_STORE_45_NORD.Employee(Employee_Name,Department,DateOfJoining,PhotoFileName) values ('Daniel','IT','2024-06-22','anonymous_sxh5743_ihx5678.png');


SELECT * FROM Employee;
 
  