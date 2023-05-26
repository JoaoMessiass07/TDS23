create database AulaJoin

use AulaJoin

create table TabelaA (
ID int,
Nome varchar(10)
);

create table TabelaB (
ID int,
Nome varchar(10)
);

SELECT * FROM sys.tables;
SELECT * FROM TabelaA;
SELECT * FROM TabelaB;

INSERT INTO TabelaA (ID, Nome)
VALUES ('1','Roberto')

INSERT INTO TabelaA (ID, Nome)
VALUES ('2','João')

INSERT INTO TabelaA (ID, Nome)
VALUES ('3','Lucas')

INSERT INTO TabelaB (ID, Nome)
VALUES ('1','Pedro')

INSERT INTO TabelaB (ID, Nome)
VALUES ('2','Luiz')

INSERT INTO TabelaB (ID, Nome)
VALUES ('3','Milton')

INSERT INTO TabelaB (ID, Nome)
VALUES ('3','Milton')

INSERT INTO TabelaA (ID, Nome)
VALUES ('4','Monitor')

INSERT INTO TabelaB (ID, Nome)
VALUES ('4','Samurai')

UPDATE TabelaA
SET Nome = 'Robo'
WHERE ID = 1

UPDATE TabelaA
SET Nome = 'Macaco'
WHERE ID = 2

UPDATE TabelaA
SET Nome = 'Samurai'
WHERE ID = 3

UPDATE TabelaB
SET Nome = 'Espada'
WHERE ID = 1

UPDATE TabelaB
SET Nome = 'Robo'
WHERE ID = 2

UPDATE TabelaB
SET Nome = 'Mario'
WHERE ID = 3


UPDATE TabelaB
SET Nome = 'Espada', Nome = 'Robo', Nome = 'Mario', Nome = 'Samurai'
WHERE ID IN (1,2,3,4)

SELECT * FROM TabelaA A
INNER JOIN TabelaB B
ON A.nome = B.nome

SELECT * FROM TabelaA A
FULL OUTER JOIN TabelaB B
ON A.nome = B.nome

SELECT * FROM TabelaA A
LEFT JOIN TabelaB B
ON A.nome = B.nome
WHERE B.nome is null

SELECT * FROM TabelaA A
RIGHT JOIN TabelaB B
ON A.nome = B.nome
WHERE A.nome is null

SELECT ProductID, Name, ProductNumber FROM Production.Product
WHERE Name like '%CHAI%'
UNION
SELECT ProductID, Name, ProductNumber FROM Production.Product
WHERE Name like '%DECAL%'
order by name desc

USE AdventureWorks2012

--PERSON.PERSON
--ID, FIRSTNAME, LASTNAME, EMAIL

SELECT P.BusinessEntityID, P.FirstName,  P.LastName, E.EmailAddress
FROM Person.Person P
INNER JOIN Person.EmailAddress E
ON P.BusinessEntityID = E.BusinessEntityID;


SELECT P.BusinessEntityID, P.FirstName, P.LastName, E.EmailAddress, H.JobTitle
FROM Person.Person P
INNER JOIN Person.EmailAddress E
ON P.BusinessEntityID = E.BusinessEntityID
INNER JOIN HumanResources.Employee H
ON P.BusinessEntityID = E.BusinessEntityID
WHERE H.JobTitle Like '%DESI%'


--NOME DOS PRODUTOS E AS INFORMAÇÕES DE SUBCATGORIA 
--ListPrice, Name, Nome da subcategoria
--Production.PRODUCT E pRODUCTsUBCATEGORY

SELECT * FROM Production.Product

SELECT * FROM Production.ProductSubcategory

SELECT P.ListPrice, P.Name, S.Name
FROM Production.Product P
Inner Join Production.ProductSubcategory S
on P.ProductSubcategoryID = S.ProductSubcategoryID;

--Trazer o cliente ID, Tipo de telefone, ID do telefone, o númro do telefone
--personphone, phonenumbertype

SELECT * FROM person.PersonPhone P

SELECT * FROM person.PhoneNumberType T

SELECT PP.FirstName, P.BusinessEntityID, T.Name, P.PhoneNumberTypeID, P.PhoneNumber
FROM Person.PersonPhone P
INNER JOIN Person.PhoneNumberType T
ON P.PhoneNumberTypeID = T.PhoneNumberTypeID
INNER JOIN Person.Person PP
ON P.BusinessEntityID = PP.BusinessEntityID

--PRECISO DAS PESSOAS QUE TEM CARTAO DE CREDITO REGISTRADO
--ID, NOME, EMAIL
--Person.Person -- Sales.PersonCreditCard

SELECT * FROM Person.Person P
SELECT * FROM Person.EmailAddress
SELECT * FROM Sales.PersonCreditCard C

SELECT P.BusinessEntityID, P.FirstName, A.EmailAddress, C.CreditCardID
FROM Person.Person P 
Inner Join Sales.PersonCreditCard C
ON P.BusinessEntityID = C.BusinessEntityID
Inner Join Person.EmailAddress A
ON P.BusinessEntityID = A.BusinessEntityID


--PRECISO DAS PESSOAS QUE NÃO TEM CARTAO DE CREDITO REGISTRADO
--ID, NOME, EMAIL
--Person.Person -- EMAIL.ADDRESS, SALES.pERSONACARTOACREDT

SELECT P.BusinessEntityID, P.FirstName, A.EmailAddress, C.CreditCardID
FROM Person.Person P 
left Join Sales.PersonCreditCard C
ON P.BusinessEntityID = C.BusinessEntityID
left Join Person.EmailAddress A
ON P.BusinessEntityID = A.BusinessEntityID
where C.CreditCardID is null

SELECT * FROM Production.Product ORDER BY ListPrice DESC

SELECT AVG(Listprice) FROM Production.Product

--438,6662

SELECT ProductID FROM Production.Product
WHERE ListPrice > 438.6662

SELECT ProductID FROM Production.Product
WHERE ListPrice > (SELECT AVG(Listprice) FROM Production.Product)

--NOME DOS FUNCIONARIOS QUE SÃO DESIGN ENGINEER

SELECT * FROM Person.Person P
SELECT * FROM HumanResources.Employee H
WHERE JobTitle = 'Design Engineer'

SELECT FirstName FROM Person.Person
WHERE BusinessEntityID IN (5,6,15)

SELECT FirstName FROM Person.Person
WHERE BusinessEntityID in (SELECT BusinessEntityID FROM HumanResources.Employee 
WHERE JobTitle = 'Design Engineer') 

SELECT * FROM Person.Person P
SELECT * FROM HumanResources.Employee H

SELECT FirstName FROM Person.Person P
INNER JOIN HumanResources.Employee H
ON P.BusinessEntityID = H.BusinessEntityID
WHERE H.JobTitle = 'Design Engineer';