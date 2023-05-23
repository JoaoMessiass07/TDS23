use pubs
SELECT * FROM sys.tables;

SELECT * FROM authors;
SELECT * FROM sales;

SELECT phone FROM authors;
SELECT city FROM authors;

SELECT * FROM dbo.authors;
SELECT au_lname FROM authors;

SELECT au_fname, au_lname, phone FROM authors;

SELECT au_fname,
		phone
FROM authors ORDER BY au_fname DESC;

SELECT au_fname FROM authors ORDER BY au_id ASC;

SELECT TOP 5 au_fname, au_id
FROM authors ORDER BY au_id;


SELECT TOP 5 ord_num, qty
FROM dbo.sales
ORDER BY qty DESC


SELECT au_fname, state FROM authors
WHERE state != 'CA'
AND contract = 0
order by city;

SELECT sum(qty) as 'Vendas Totais' from sales;

SELECT au_id, au_lname, au_fname, phone, address, city, state, zip,contract FROM
authors WHERE city = 'Berkeley';

SELECT au_id,au_lname, au_fname, phone, address, city, state, zip, contract FROM
authors WHERE city = 'Oakland' AND contract = 1

UPDATE authors SET au_fname = 'Marina' WHERE au_id= '999-55-7771' ;
select au_fname from authors where au_id = '999-55-7771';

SELECT authors.* ,titleauthor.*
FROM authors, titleauthor
WHERE authors.au_id = titleauthor.au_id


