-- 🎯 Consulta 1: Listar faixas com seus respectivos álbuns
-- Objetivo: Relacionar faixas à tabela de álbuns
SELECT Track.Name AS Faixa, Album.Title AS Álbum
FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId;

-- 🎯 Consulta 2: Mostrar faixas com nome do artista
-- Objetivo: Navegar pelas relações Track → Album → Artist
SELECT Track.Name AS Faixa, Artist.Name AS Artista
FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId;

-- 🎯 Consulta 3: Listar vendas com nome do cliente
-- Objetivo: Relacionar faturas à tabela de clientes
SELECT Invoice.InvoiceId, Customer.FirstName || ' ' || Customer.LastName AS Cliente, Invoice.Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId;

-- 🎯 Consulta 4: Mostrar faixas vendidas com nome do cliente e data da compra
-- Objetivo: Relacionar InvoiceLine → Invoice → Customer → Track
SELECT Customer.FirstName || ' ' || Customer.LastName AS Cliente,
       Track.Name AS Faixa,
       Invoice.InvoiceDate
FROM InvoiceLine
INNER JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
INNER JOIN Track ON InvoiceLine.TrackId = Track.TrackId;

-- 🎯 Consulta 5: Listar funcionários e seus gerentes (auto-relacionamento)
-- Objetivo: Usar LEFT JOIN para mostrar quem gerencia quem
SELECT e.FirstName || ' ' || e.LastName AS Funcionário,
       m.FirstName || ' ' || m.LastName AS Gerente
FROM Employee e
LEFT JOIN Employee m ON e.ReportsTo = m.EmployeeId;