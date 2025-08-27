-- 🎯 Consulta 1: Clientes que moram no Brasil
-- Objetivo: Identificar clientes brasileiros na base
SELECT * FROM Customer
WHERE Country = 'Brazil';

--Consulta 2: Faixas com duração superior a 5 minutos
-- Objetivo: Encontrar músicas mais longas, com mais de 300.000 milissegundos
SELECT Name, Milliseconds
FROM Track
WHERE Milliseconds > 300000;

--Consulta 3: Listar os 10 álbuns mais recentes
-- Objetivo: Observar os álbuns com IDs mais altos (simulando os mais novos)
SELECT Title, AlbumId
FROM Album
ORDER BY AlbumId DESC
LIMIT 10;

Consulta 4: Faixas ordenadas por preço unitário
-- Objetivo: Ver quais músicas são mais caras na loja
SELECT Name, UnitPrice
FROM Track
ORDER BY UnitPrice DESC;

--Consulta 5: Clientes dos EUA ordenados por sobrenome
-- Objetivo: Organizar os clientes americanos alfabeticamente pelo sobrenome
SELECT FirstName, LastName, Country
FROM Customer
WHERE Country = 'USA'
ORDER BY LastName;