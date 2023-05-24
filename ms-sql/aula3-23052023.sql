USE AdventureWorks2012

select * from PERSON.person
where BusinessEntityID = '5';

/* 
AND - E
OR - OU
NOT - ACOMPANHADO
=
>
<
<>
*/

/* SELECIONAR A IDENTIDADE 5 OU 111 OU 23 */
select * from PERSON.person
where BusinessEntityID = 5
OR BusinessEntityID = 111
OR BusinessEntityID = 23;


/* SELECIONAR O PESO MAIOR QUE 500 E MENOR OU IGUAL A 700 */
SELECT ProductID,Weight FROM Production.Product
where weight > 500
and weight <= 700;


select * from HumanResources.Employee
where MaritalStatus = 'M'
AND SalariedFlag = 1
and BirthDate <= '1983/01/01';

select * from Person.person
where FirstName = 'Peter'
and LastName = 'Krebs';

select * from Person.EmailAddress
where BusinessEntityID = 26;

SELECT Person.FirstName, Person.LastName, Person.EmailAddress.EmailAddress 
FROM Person.Person, Person.EmailAddress
WHERE Person.BusinessEntityID = EmailAddress.BusinessEntityID
AND Person.BusinessEntityID = 26;

select * from Production.Product

SELECT COUNT(*) AS 'Quantidade de Produtos' FROM Production.Product

SELECT DISTINCT Name FROM Production.Product

SELECT DISTINCT TITLE FROM person.person

SELECT ListPrice FROM Production.Product
WHERE ListPrice >= 1000
AND ListPrice <= 1500

SELECT ListPrice FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500

SELECT COUNT(HireDate) AS 'Qnt. de Contratados 2009-2010' from HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01';

SELECT * FROM Person.Person
WHERE BusinessEntityID in (5,111,23)

SELECT * FROM Person.Person
WHERE FirstName LIKE 'Ro_'

--QUANTOS PRODUTOS TEMOS NO BD ACIMA DE 1500 (PREÇO)

SELECT COUNT(ListPrice) as 'Qnt. Produtos acima de $1500' FROM Production.Product
WHERE ListPrice > '1500';

--QUANTAS PESSOAS TEM O SOBRENOME QUE COMEÇA COM A LETRA P

SELECT COUNT(LastName) as 'Qnt. Pessoas com Sobrenome começando com P' FROM Person.Person
WHERE LastName LIKE 'P%'

--EM QUANTAS CIDADES UNICAS ESTÃO AS PESSOAS/CLIENTES

SELECT * FROM Person.Address

SELECT COUNT(DISTINCT city) as 'Qnt. Cidades únicas estão os clientes' FROM Person.Address;