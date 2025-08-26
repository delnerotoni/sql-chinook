-- Módulo 1: Exploração de Dados
-- Base: DBeaver Sample Database (Chinook - SQLite)
-- Objetivo: Conhecer a estrutura da base e entender os dados disponíveis

-- 1. Listar todas as tabelas disponíveis no banco
SELECT name 
FROM sqlite_master 
WHERE type = 'table'
  AND name NOT LIKE 'sqlite_%';

-- 2. Ver estrutura da tabela Employee
-- Mostra os campos, tipos de dados, e se são obrigatórios ou chave primária
PRAGMA table_info('Employee');

-- 3. Listar todos os funcionários com informações principais
SELECT 
  EmployeeId,
  FirstName,
  LastName,
  Title,
  Email,
  Country
FROM Employee;

-- 4. Contar quantos funcionários existem por cargo
SELECT 
  Title,
  COUNT(*) AS Quantidade
FROM Employee
GROUP BY Title
ORDER BY Quantidade DESC;

-- 5. Ver distribuição de funcionários por país
SELECT 
  Country,
  COUNT(*) AS TotalFuncionarios
FROM Employee
GROUP BY Country
ORDER BY TotalFuncionarios DESC;

-- 6. Filtrar funcionários por cargo específico
-- Exemplo: Sales Support Agent
SELECT 
  FirstName,
  LastName,
  Title,
  Country
FROM Employee
WHERE Title = 'Sales Support Agent';
