--1. Atualize, aumentando em 10 unidades na tabela estoque, a quantidade dos produtos que foram vendidos para o cliente de id igual a 226.

UPDATE estoque
SET quantidade = quantidade + 10
WHERE produto_id IN (
    SELECT vi.produto_id
    FROM venda_item vi
    JOIN venda v ON vi.venda_id = v.id
    WHERE v.cliente_id = 226
);

--2. Atualize, aumentando em uma unidade, a quantidade de cada produto existente no estoque da filial de id igual a 1.

UPDATE estoque
SET quantidade = quantidade + 1
WHERE filial_id = 1;

--3. Atualize, aumentando em 10%, o salário de cada funcionário que realizou pelo menos uma venda.

UPDATE funcionario
SET salario = salario * 1.10
WHERE usuario_id IN (
    SELECT DISTINCT v.funcionario_id
    FROM venda v
);