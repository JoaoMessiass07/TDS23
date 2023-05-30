USE AdventureWorks2012

SELECT * FROM Person.Person

--deixar tudo maiúsculo ou minúsculo
SELECT FirstName, UPPER(FirstName), LastName, LOWER(LastName) FROM Person.Person

--LENGHT - LEN - Contar caracter
SELECT FirstName, LEN(FirstName) from PersoN.Person
WHERE LEN(FirstName) <= 2

SELECT FirstName, SUBSTRING(FirstName,2,1) from Person.Person
WHERE SUBSTRING(FirstName,2,1) = '.'

SELECT * FROM Production.Product

SELECT ProductNumber, REPLACE(ProductNumber,'-','-2023-') FROM Production.Product

SELECT FirstName, MiddleName, LastName FROM Person.Person

CREATE or ALTER VIEW NOMES AS 
SELECT FirstName, MiddleName, LastName 
FROM Person.Person
WHERE Title = 'Ms.'

SELECT * FROM NOMES
ORDER BY 3 DESC

CREATE OR ALTER VIEW EMAILS as
SELECT P.BusinessEntityID AS ID,P.FirstName AS NOME, E.EmailAddress AS EMAIL
FROM Person.Person AS P
INNER JOIN Person.EmailAddress AS E
ON P.BusinessEntityID = E.BusinessEntityID


SELECT * FROM EMAILS

SELECT Person.Person.*, EMAILS.* FROM Person.Person, EMAILS
WHERE Person.BusinessEntityID = EMAILS.ID

SELECT * FROM NOMES

--DROP VIEW NOMES
