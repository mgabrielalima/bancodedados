--1. Insira um novo cliente com nome 'Antonio José da Silva', endereço 'Rua X, 123', e-mail 'ajsilva@provedor.com', login 'ajsilva' e senha 'ajs123'.

-- Inserir usuário
INSERT INTO usuario (nome, endereco, email, login, senha)
VALUES ('Antonio José da Silva', 'Rua X, 123', 'ajsilva@provedor.com', 'ajsilva', 'ajs123');

-- Verificar ID do usuário inserido
SELECT id INTO @usuario_id FROM usuario WHERE nome = 'Antonio José da Silva';

-- Inserir cliente
INSERT INTO cliente (usuario_id) VALUES (@usuario_id);

--2.Insira um novo funcionário com nome 'Rafael João da Costa', endereço 'Rua Y, 456', e-mail 'rjcosta@provedor.com', login 'rjcosta', senha 'rjc456' e salário 2500.

-- Inserir usuário
INSERT INTO usuario (nome, endereco, email, login, senha)
VALUES ('Rafael João da Costa', 'Rua Y, 456', 'rjcosta@provedor.com', 'rjcosta', 'rjc456');

-- Verificar ID do usuário inserido
SELECT id INTO @usuario_id FROM usuario WHERE nome = 'Rafael João da Costa';

-- Inserir funcionário
INSERT INTO funcionario (usuario_id, salario) VALUES (@usuario_id, 2500);

--3. Insira três telefones para o cliente 'Antonio José da Silva'.

-- Verificar ID do cliente
SELECT id INTO @usuario_id FROM usuario WHERE nome = 'Antonio José da Silva';

-- Inserir telefones
INSERT INTO usuario_telefone (usuario_id, ddd, numero)
VALUES (@usuario_id, 85, 98765432),
       (@usuario_id, 85, 99754208),
       (@usuario_id, 85, 98639121);

--4. Insira dois telefones para o funcionário 'Rafael João da Costa'.

-- Verificar ID do funcionário
SELECT id INTO @usuario_id FROM usuario WHERE nome = 'Rafael João da Costa';

-- Inserir telefones
INSERT INTO usuario_telefone (usuario_id, ddd, numero)
VALUES (@usuario_id, 85, 91290507),
       (@usuario_id, 81, 90871001);

--5. Insira um novo produto de descrição 'Produto X' e preço 23.5. Associe o produto a duas categorias existentes.

-- Inserir produto
INSERT INTO produto (descricao, preco)
VALUES ('Produto X', 23.5);

-- Verificar ID do produto inserido
SELECT id INTO @produto_id FROM produto WHERE descricao = 'Produto X';

-- Associar o produto a duas categorias (supondo que as categorias tenham IDs 1 e 2)
INSERT INTO produto_categoria (produto_id, categoria_id)
VALUES (@produto_id, 1),
       (@produto_id, 2);
