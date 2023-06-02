/*1. a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).*/

SELECT 
	channelKey AS 'Canal Venda', 
	SUM(SalesQuantity) AS 'Total vendido'

FROM
	FactSales
GROUP BY channelKey


/*b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).*/

SELECT 
	StoreKey AS 'Id Loja',
	SUM(SalesQuantity) AS 'Quantidade Vendidada',
	SUM(ReturnQuantity) AS 'Quantidade devolvida'
FROM
	FactSales
GROUP BY StoreKey


/*c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.*/

SELECT 
	channelKey AS 'Canal de venda',
	SUM(SalesAmount) AS 'Quantidade de vendas'
FROM
	FactSales
WHERE DateKey BETWEEN '20070101' AND '20071231'
GROUP BY channelKey

/* 2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).*/

SELECT * FROM FactSales

/*a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.*/

SELECT 
	ProductKey AS 'Id do Produto',
	SUM(SalesAmount) AS 'Faturamento total'
FROM 
	FactSales

GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY SUM(SalesAmount) DESC

/*b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.*/

SELECT TOP(10)
	ProductKey AS 'Id do Produto',
	SUM(SalesAmount) AS 'Faturamento total'
FROM 
	FactSales

GROUP BY ProductKey
ORDER BY SUM(SalesAmount) DESC