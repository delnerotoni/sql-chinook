-- 🧩 Consulta 1: Clientes que nunca compraram nada
-- Objetivo: Identificar clientes sem registros na tabela de faturas
SELECT Customer.FirstName || ' ' || Customer.LastName AS Cliente
FROM Customer
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
WHERE Invoice.InvoiceId IS NULL;

-- Consulta 02 corrigida: Estilos que não possuem nenhuma faixa vendida
SELECT Genre.Name AS Genero
FROM Genre
LEFT JOIN Track ON Genre.GenreId = Track.GenreId
LEFT JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
WHERE InvoiceLine.InvoiceLineId IS NULL;

-- 🧩 Consulta 3: Receita total por gênero musical
-- Objetivo: Analisar quais estilos geram mais receita
SELECT Genre.Name AS Gênero, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS ReceitaTotal
FROM InvoiceLine
INNER JOIN Track ON InvoiceLine.TrackId = Track.TrackId
INNER JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY ReceitaTotal DESC;

-- 🧩 Consulta 4: Funcionário com maior número de clientes
-- Objetivo: Ver qual representante de vendas tem mais clientes atribuídos
SELECT Employee.FirstName || ' ' || Employee.LastName AS Funcionario,
       COUNT(Customer.CustomerId) AS TotalClientes
FROM Customer
INNER JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
GROUP BY Funcionario
ORDER BY TotalClientes DESC;

-- 🧩 Consulta 5: Receita mensal da loja
-- Objetivo: Agrupar vendas por mês para análise temporal
SELECT strftime('%Y-%m', InvoiceDate) AS Mes,
       SUM(Total) AS ReceitaMensal
FROM Invoice
GROUP BY Mes
ORDER BY Mes;