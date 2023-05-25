USE AdventureWorks2012

-- QUANTOS PRODUTOS VERMELHOS TEM PREÇO ENTRE 500 E 1000 USD

SELECT COUNT(ListPrice) AS 'Produtos Vermelhos entre 500 e 1000' FROM Production.Product
WHERE ListPrice BETWEEN 500 AND 1000
AND Color = 'RED';


-- PRODUTOS QUE TEM ESSA SEQ DE CARACTER NO NOME ROAD

SELECT COUNT(Name) AS 'Lista de Produtos com ROAD' FROM Production.Product
WHERE Name LIKE '%ROAD%';

--top 10 dos produtos
SELECT TOP 10 * FROM Sales.SalesOrderDetail ORDER BY LineTotal DESC

SELECT * FROM Sales.SalesOrderDetail

--total vendas
SELECT TOP 10 SUM(LineTotal)AS 'Total Vendas' FROM Sales.SalesOrderDetail

--numero maior
SELECT max(LineTotal)AS 'Total Vendas' FROM Sales.SalesOrderDetail

--numero menor
SELECT min(LineTotal)AS 'Total Vendas' FROM Sales.SalesOrderDetail

--numero maior
SELECT AVG(LineTotal) AS 'Total Vendas' FROM Sales.SalesOrderDetail

SELECT FirstName, COUNT(FirstName) AS 'Quantidade' FROM Person.Person
GROUP BY FirstName

--Geralmente o primeiro campo é o que se agrupa.
SELECT SpecialOfferID, SUM(UnitPrice) AS 'Total de Vendas' FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
ORDER BY SUM(UnitPrice) DESC

--Quantos produtos foram vendidos

SELECT * FROM Sales.SalesOrderDetail
SELECT * FROM Production.Product

SELECT ProductID, COUNT(OrderQty) AS 'Qnt. Total de cada produto' FROM Sales.SalesOrderDetail
GROUP BY ProductID;

-- PRODUCTION.PRODUCT - PRODUTOS PRATA - SILVER / MEDIA PREÇO - LISTPRICE

SELECT Color, AVG(ListPrice) AS 'Valor do Produto' FROM Production.Product
WHERE Color = 'SILVER'
GROUP BY Color

SELECT MiddleName, COUNT(MiddleName) AS QNTD FROM Person.Person
GROUP BY MiddleName
ORDER BY MiddleName

/*
--DESAFIO 
-- 1 - QUAL A MEDIA QUE CADA PRODUTO É VENDIDO (SALESORDERDETAIL)
-- 2 - QUAISOS 10 PRODUTOS QUE NO TOTAL TIVERAM OS MAIORES VALORES DE VENDA AGRUPADOS POR PRODUTO DO MAIOR PARA O MENOR
(SALESORDERDETAIL)
-- 3 QUANTOS PRODUTOS E QUAL A QUANTIDADE MEDIA DE PRODUTOS TEMOS CADASTRADOS NAS ORDENS DE SERVIÇO (WORKORDER) 
AGRUPAR PELO ID DO PRODUTO(PRODUCTION)
*/

-- 1 - QUAL A MEDIA QUE CADA PRODUTO É VENDIDO (SALESORDERDETAIL)
SELECT ProductID, AVG(OrderQty) AS 'Média de cada produto' FROM Sales.SalesOrderDetail
GROUP BY ProductID;

-- 2 - QUAIS OS 10 PRODUTOS QUE NO TOTAL TIVERAM OS MAIORES VALORES DE VENDA AGRUPADOS POR PRODUTO DO MAIOR PARA O MENOR (SALESORDERDETAIL)
SELECT TOP 10 ProductID, SUM(UnitPrice) FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(UnitPrice) DESC;

-- 3 QUANTOS PRODUTOS E QUAL A QUANTIDADE MEDIA DE PRODUTOS TEMOS CADASTRADOS NAS ORDENS DE SERVIÇO (WORKORDER) AGRUPAR PELO ID DO PRODUTO(PRODUCTION
SELECT * FROM Production.WorkOrder
SELECT ProductID, count(ProductID) AS QNTD, AVG(OrderQty) AS MDIA FROM Production.WorkOrder
GROUP BY ProductID

-- HAVING -- PESQUISA NO GROUP BY --NO AGRUPAMENTO

 SELECT FirstName, COUNT(FirstName) as qntd FROM Person.Person
 GROUP BY FirstName
 HAVING  COUNT(FirstName) > 10

 SELECT FirstName, COUNT(FirstName) as qntd 
 FROM Person.Person
 WHERE FirstName like 'A%'
 GROUP BY FirstName
 HAVING  COUNT(FirstName) > 10

 -- Agrupar os produtos(ProductID) por vendas totais(LineTotal) entre 162k e 500k
 SELECT ProductID, SUM(LineTotal) AS VendasTotais FROM Sales.SalesOrderDetail
 GROUP BY ProductID
 Having SUM(LineTotal) BETWEEN 162000 AND 500000;


--QUAIS PRODUTOS NÃO ESTÃO TRAZENDO EM MEDIA VENDAS DE UM MILHÃO NO TOTAL
SELECT ProductID, AVG(LineTotal) AS 'Média das vendas' FROM Sales.SalesOrderDetail
GROUP BY ProductID
Having AVG(LineTotal) < 1000
