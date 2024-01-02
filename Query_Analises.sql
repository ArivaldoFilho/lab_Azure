/*
<span style="color: var(--vscode-foreground);">1. Escreva uma query que retorna a quantidade de linhas na tabela Sales.SalesOrderDetail pelo campo SalesOrderID, desde que tenham pelo menos três linhas de detalhes.</span>
*/

SELECT SalesOrderID, COUNT(*) AS QuantidadeDeLinhas

FROM SalesOrderDetail

GROUP BY SalesOrderID

HAVING COUNT(*) >= 3;



/*
<span style="color: var(--vscode-foreground);">2. Escreva uma query que ligue as tabelas Sales.SalesOrderDetail, Sales.SpecialOfferProduct e Production.Product e retorne os 3 produtos (Name) mais vendidos (pela soma de OrderQty), agrupados pelo número de dias para manufatura (DaysToManufacture).</span>
*/

WITH VendasProdutos AS (

    SELECT

        sod.ProductID,

        p.Name AS ProductName,

        SUM(sod.OrderQty) AS TotalQuantitySold,

        ROW_NUMBER() OVER (ORDER BY SUM(sod.OrderQty) DESC) AS Rank

    FROM

        SalesOrderDetail sod

    JOIN

        Product p ON sod.ProductID = p.ProductID

    GROUP BY

        sod.ProductID,

        p.Name

)

SELECT

    ProductID,

    ProductName,

    TotalQuantitySold

FROM

    VendasProdutos

WHERE

    Rank <= 3

ORDER BY

    TotalQuantitySold DESC;



/*
<span style="color: var(--vscode-foreground);">3. Escreva uma query ligando as tabelas Person.Person, Sales.Customer e Sales.SalesOrderHeader de forma a obter uma lista de nomes de clientes e uma contagem de pedidos efetuados.</span>
*/

SELECT

    p.FirstName + ' ' + p.LastName AS CustomerName,

    c.CustomerID,

    COUNT(soh.SalesOrderID) AS OrderCount

FROM

    Person p

JOIN

    Customer c ON p.BusinessEntityID = c.PersonID

LEFT JOIN

    SalesOrderHeader soh ON c.CustomerID = soh.CustomerID

GROUP BY

    p.FirstName,

    p.LastName,

    c.CustomerID

ORDER BY

    OrderCount DESC;



/*
<span style="color: var(--vscode-foreground);">4. Escreva uma query usando as tabelas Sales.SalesOrderHeader, Sales.SalesOrderDetail e Production.Product, de forma a obter a soma total de produtos (OrderQty) por ProductID e OrderDate.</span>
*/

SELECT

    sod.ProductID,

    soh.OrderDate,

    SUM(sod.OrderQty) AS TotalOrderQty

FROM

    SalesOrderHeader soh

JOIN

    SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID

GROUP BY

    sod.ProductID,

    soh.OrderDate

ORDER BY

    soh.OrderDate;



/*
<span style="font-family: Roboto; color: var(--vscode-foreground);">5. Escreva uma query mostrando os campos SalesOrderID, OrderDate e TotalDue da tabela Sales.SalesOrderHeader. Obtenha apenas as linhas onde a ordem tenha sido feita durante o mês de setembro/2011 e o total devido esteja acima de 1.000. Ordene pelo total devido decrescente.</span>
*/

SELECT

    SalesOrderID,

    OrderDate,

    TotalDue

FROM

    SalesOrderHeader

WHERE

    YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 9

    AND TotalDue > 1000

ORDER BY

    TotalDue DESC;

