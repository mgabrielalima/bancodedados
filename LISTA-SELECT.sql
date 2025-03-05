--1.Encontre todos os nomes dos clientes que iniciam com 'Antonio'.

SELECT nome
FROM usuario
WHERE nome LIKE 'Antonio%' AND id IN (SELECT usuario_id FROM cliente);

--2. Quais os nomes e telefones (DDD e número) dos clientes com nomes que terminam com 'Cooper'?

SELECT u.nome, ut.ddd, ut.numero
FROM usuario u
JOIN usuario_telefone ut ON u.id = ut.usuario_id
WHERE u.nome LIKE '%Cooper' AND u.id IN (SELECT usuario_id FROM cliente);

--3. Quais os nomes dos usuários registrados na tabela de usuario e que não são clientes?

SELECT nome
FROM usuario
WHERE id NOT IN (SELECT usuario_id FROM cliente);

--4. Quais as descrições e preços dos produtos que não estão disponíveis na filial cujo identificador é 1?

SELECT p.descricao, p.preco
FROM produto p
WHERE p.id NOT IN (SELECT produto_id FROM estoque WHERE filial_id = 1);

--5. Quais os nomes dos funcionários que começam com 'Julie' e que possuem telefones com DDD 81? A consulta deverá retornar, também, o DDD e número do telefone do funcionário.

SELECT u.nome, ut.ddd, ut.numero
FROM usuario u
JOIN usuario_telefone ut ON u.id = ut.usuario_id
WHERE u.nome LIKE 'Julie%' AND ut.ddd = 81 AND u.id IN (SELECT usuario_id FROM funcionario);

--6.Quais os identificadores e descrições dos produtos que estão faltando em estoque na filial de razão social 'THOUSAND OAKS'?

SELECT p.id, p.descricao
FROM produto p
WHERE p.id NOT IN (
    SELECT e.produto_id
    FROM estoque e
    JOIN filial f ON e.filial_id = f.id
    WHERE f.razao_social = 'THOUSAND OAKS'
);

--7. Qual o preço do produto mais caro que faz parte da categoria de descrição 'RAM'?

SELECT MAX(p.preco) AS preco_maximo
FROM produto p
JOIN produto_categoria pc ON p.id = pc.produto_id
JOIN categoria c ON pc.categoria_id = c.id
WHERE c.descricao = 'RAM';

--8. Elabore uma consulta que mostre as descrições e preços dos produtos que possuem mais de uma categoria associada.

SELECT p.descricao, p.preco
FROM produto p
JOIN produto_categoria pc ON p.id = pc.produto_id
GROUP BY p.id, p.descricao, p.preco
HAVING COUNT(pc.categoria_id) > 1;

--9. Elabore uma consulta que mostre o valor total vendido por razão social de cada filial. A consulta deve levar em consideração todas vendas registradas na tabela venda.

SELECT f.razao_social, SUM(vi.quantidade * p.preco) AS valor_total_vendido
FROM venda v
JOIN venda_item vi ON v.id = vi.venda_id
JOIN produto p ON vi.produto_id = p.id
JOIN filial f ON v.filial_id = f.id
GROUP BY f.razao_social;

--10. Quantos clientes compraram uma quantidade total de unidades de produtos acima da média da quantidade total de unidades compradas por todos os clientes?

SELECT COUNT(DISTINCT v.cliente_id) AS clientes_acima_da_media
FROM venda v
JOIN venda_item vi ON v.id = vi.venda_id
GROUP BY v.cliente_id
HAVING SUM(vi.quantidade) > (
    SELECT AVG(total_quantidade)
    FROM (
        SELECT SUM(vi.quantidade) AS total_quantidade
        FROM venda v
        JOIN venda_item vi ON v.id = vi.venda_id
        GROUP BY v.cliente_id
    ) AS media_quantidade
);