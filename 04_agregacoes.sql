-- 🎯 Consulta 1: Total de clientes por país
-- Objetivo: Ver a distribuição geográfica dos clientes
SELECT Country, COUNT(*) AS TotalClientes
FROM Customer
GROUP BY Country
ORDER BY TotalClientes DESC;

-- 🎯 Consulta 2: Receita total por país
-- Objetivo: Identificar os países que mais geram receita
SELECT Customer.Country, SUM(Invoice.Total) AS ReceitaTotal
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Customer.Country
ORDER BY ReceitaTotal DESC;

-- 🎯 Consulta 3: Número de faixas por gênero musical
-- Objetivo: Ver quais gêneros têm mais músicas cadastradas
SELECT Genre.Name AS Gênero, COUNT(*) AS TotalFaixas
FROM Track
INNER JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY TotalFaixas DESC;

-- 🎯 Consulta 4: Receita total por cliente
-- Objetivo: Identificar os clientes mais lucrativos
SELECT Customer.FirstName || ' ' || Customer.LastName AS Cliente,
       SUM(Invoice.Total) AS ReceitaTotal
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Cliente
ORDER BY ReceitaTotal DESC;

-- 🎯 Consulta 5: Média de duração das faixas por gênero
-- Objetivo: Analisar o tempo médio das músicas por estilo
SELECT Genre.Name AS Gênero,
       ROUND(AVG(Milliseconds) / 60000, 2) AS DuracaoMediaMin
FROM Track
INNER JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY DuracaoMediaMin DESC;