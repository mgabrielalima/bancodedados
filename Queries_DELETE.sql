--1. Remova todos os itens de vendas do cliente de nome 'Antonio José da Silva'. Após isso, remova todas as vendas que foram feitas para o cliente de nome 'Antonio José da Silva'.

-- Verificar o ID do cliente
SELECT id INTO @usuario_id FROM usuario WHERE nome = 'Antonio José da Silva';

-- Remover os itens de venda
DELETE FROM venda_item
WHERE venda_id IN (
    SELECT id FROM venda WHERE cliente_id = @usuario_id
);

-- Remover as vendas
DELETE FROM venda
WHERE cliente_id = @usuario_id;

--2. Remova todos os itens de vendas onde os produtos estão vinculados a mais de uma categoria.

DELETE FROM venda_item
WHERE produto_id IN (
    SELECT produto_id
    FROM produto_categoria
    GROUP BY produto_id
    HAVING COUNT(categoria_id) > 1
);