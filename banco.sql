--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.3

-- Started on 2020-08-31 14:58:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 1 (class 3079 OID 12361)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16667)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria (
    id integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE categoria OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16673)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 182
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- TOC entry 183 (class 1259 OID 16675)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    usuario_id integer NOT NULL
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16678)
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estoque (
    filial_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE estoque OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16681)
-- Name: filial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filial (
    id integer NOT NULL,
    razao_social character varying NOT NULL,
    endereco character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE filial OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16687)
-- Name: filial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filial_id_seq OWNER TO postgres;

--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 186
-- Name: filial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filial_id_seq OWNED BY filial.id;


--
-- TOC entry 187 (class 1259 OID 16689)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    usuario_id integer NOT NULL,
    salario numeric NOT NULL
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16695)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    id integer NOT NULL,
    descricao character varying NOT NULL,
    preco numeric NOT NULL
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16701)
-- Name: produto_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE produto_categoria OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16704)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_id_seq OWNER TO postgres;

--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 190
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 191 (class 1259 OID 16706)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nome character varying NOT NULL,
    endereco character varying NOT NULL,
    email character varying NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16712)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 192
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 193 (class 1259 OID 16714)
-- Name: usuario_telefone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario_telefone (
    usuario_id integer NOT NULL,
    ddd integer NOT NULL,
    numero numeric NOT NULL
);


ALTER TABLE usuario_telefone OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16720)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venda (
    id integer NOT NULL,
    data timestamp without time zone NOT NULL,
    cliente_id integer NOT NULL,
    funcionario_id integer NOT NULL,
    filial_id integer NOT NULL
);


ALTER TABLE venda OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16723)
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venda_id_seq OWNER TO postgres;

--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 195
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venda_id_seq OWNED BY venda.id;


--
-- TOC entry 196 (class 1259 OID 16725)
-- Name: venda_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venda_item (
    venda_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE venda_item OWNER TO postgres;

--
-- TOC entry 2039 (class 2604 OID 16728)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 16729)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filial ALTER COLUMN id SET DEFAULT nextval('filial_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 16730)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 16731)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 16732)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda ALTER COLUMN id SET DEFAULT nextval('venda_id_seq'::regclass);


--
-- TOC entry 2045 (class 2606 OID 16734)
-- Name: categoria_descricao_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_descricao_ukey UNIQUE (descricao);


--
-- TOC entry 2047 (class 2606 OID 16736)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 16738)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (usuario_id);


--
-- TOC entry 2051 (class 2606 OID 16740)
-- Name: estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (filial_id, produto_id);


--
-- TOC entry 2053 (class 2606 OID 16742)
-- Name: filial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filial
    ADD CONSTRAINT filial_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 16744)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (usuario_id);


--
-- TOC entry 2059 (class 2606 OID 16746)
-- Name: produto_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT produto_categoria_pkey PRIMARY KEY (produto_id, categoria_id);


--
-- TOC entry 2057 (class 2606 OID 16748)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 16750)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 16752)
-- Name: usuario_telefone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_telefone
    ADD CONSTRAINT usuario_telefone_pkey PRIMARY KEY (usuario_id, ddd, numero);


--
-- TOC entry 2067 (class 2606 OID 16754)
-- Name: venda_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda_item
    ADD CONSTRAINT venda_item_pkey PRIMARY KEY (venda_id, produto_id);


--
-- TOC entry 2065 (class 2606 OID 16756)
-- Name: venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 16757)
-- Name: cliente_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2069 (class 2606 OID 16762)
-- Name: estoque_filial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_filial_id_fkey FOREIGN KEY (filial_id) REFERENCES filial(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2070 (class 2606 OID 16767)
-- Name: estoque_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2071 (class 2606 OID 16772)
-- Name: funcionario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2072 (class 2606 OID 16777)
-- Name: produto_categoria_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT produto_categoria_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES categoria(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2073 (class 2606 OID 16782)
-- Name: produto_categoria_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT produto_categoria_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2074 (class 2606 OID 16787)
-- Name: usuario_telefone_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_telefone
    ADD CONSTRAINT usuario_telefone_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2075 (class 2606 OID 16792)
-- Name: venda_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES cliente(usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2076 (class 2606 OID 16797)
-- Name: venda_filial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_filial_id_fkey FOREIGN KEY (filial_id) REFERENCES filial(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2077 (class 2606 OID 16802)
-- Name: venda_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES funcionario(usuario_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2078 (class 2606 OID 16807)
-- Name: venda_item_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda_item
    ADD CONSTRAINT venda_item_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2079 (class 2606 OID 16812)
-- Name: venda_item_venda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda_item
    ADD CONSTRAINT venda_item_venda_id_fkey FOREIGN KEY (venda_id) REFERENCES venda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 181
-- Name: categoria; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE categoria FROM PUBLIC;
REVOKE ALL ON TABLE categoria FROM postgres;
GRANT ALL ON TABLE categoria TO postgres;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 183
-- Name: cliente; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cliente FROM PUBLIC;
REVOKE ALL ON TABLE cliente FROM postgres;
GRANT ALL ON TABLE cliente TO postgres;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 184
-- Name: estoque; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE estoque FROM PUBLIC;
REVOKE ALL ON TABLE estoque FROM postgres;
GRANT ALL ON TABLE estoque TO postgres;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 185
-- Name: filial; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE filial FROM PUBLIC;
REVOKE ALL ON TABLE filial FROM postgres;
GRANT ALL ON TABLE filial TO postgres;

--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 187
-- Name: funcionario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE funcionario FROM PUBLIC;
REVOKE ALL ON TABLE funcionario FROM postgres;
GRANT ALL ON TABLE funcionario TO postgres;

--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 188
-- Name: produto; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE produto FROM PUBLIC;
REVOKE ALL ON TABLE produto FROM postgres;
GRANT ALL ON TABLE produto TO postgres;

--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 189
-- Name: produto_categoria; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE produto_categoria FROM PUBLIC;
REVOKE ALL ON TABLE produto_categoria FROM postgres;
GRANT ALL ON TABLE produto_categoria TO postgres;

--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 191
-- Name: usuario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE usuario FROM PUBLIC;
REVOKE ALL ON TABLE usuario FROM postgres;
GRANT ALL ON TABLE usuario TO postgres;

--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 193
-- Name: usuario_telefone; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE usuario_telefone FROM PUBLIC;
REVOKE ALL ON TABLE usuario_telefone FROM postgres;
GRANT ALL ON TABLE usuario_telefone TO postgres;

--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 194
-- Name: venda; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE venda FROM PUBLIC;
REVOKE ALL ON TABLE venda FROM postgres;
GRANT ALL ON TABLE venda TO postgres;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 196
-- Name: venda_item; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE venda_item FROM PUBLIC;
REVOKE ALL ON TABLE venda_item FROM postgres;
GRANT ALL ON TABLE venda_item TO postgres;

--- TRECHO COLOCADO MANUALMENTE - INICIO
DELETE FROM venda_item;
DELETE FROM venda;
DELETE FROM estoque;
DELETE FROM produto_categoria;
DELETE FROM categoria;
DELETE FROM produto;
DELETE FROM usuario_telefone;
DELETE FROM funcionario;
DELETE FROM cliente;
DELETE FROM filial;
DELETE FROM usuario;
--- TRECHO COLOCADO MANUALMENTE - FIM


--
-- TOC entry 2194 (class 0 OID 16667)
-- Dependencies: 181
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria VALUES (1, 'Memory Card Adapters');
INSERT INTO categoria VALUES (2, 'USB Adapters');
INSERT INTO categoria VALUES (3, 'Mobile Phone Accessories');
INSERT INTO categoria VALUES (4, 'Mobile Phones');
INSERT INTO categoria VALUES (5, 'Audio Cards & Adapters');
INSERT INTO categoria VALUES (6, 'Video Cards & Adapters');
INSERT INTO categoria VALUES (7, 'Game Controller Accessories');
INSERT INTO categoria VALUES (8, 'Game Controllers');
INSERT INTO categoria VALUES (9, 'KVM Switches');
INSERT INTO categoria VALUES (10, 'Keyboards');
INSERT INTO categoria VALUES (11, 'Hard Drives');
INSERT INTO categoria VALUES (12, 'Network Storage Systems');
INSERT INTO categoria VALUES (13, 'Optical Drives');
INSERT INTO categoria VALUES (14, 'USB Flash Drives');
INSERT INTO categoria VALUES (15, 'Wireless Access Points');
INSERT INTO categoria VALUES (16, 'Wireless Routers');
INSERT INTO categoria VALUES (17, 'Computer Monitors');
INSERT INTO categoria VALUES (18, 'Multimedia Projectors');
INSERT INTO categoria VALUES (19, 'DVD & Blu-ray Players');
INSERT INTO categoria VALUES (20, 'Video Game Consoles');
INSERT INTO categoria VALUES (21, 'Printers, Copiers & Fax Machines');
INSERT INTO categoria VALUES (22, 'Modems');
INSERT INTO categoria VALUES (23, 'Computer Processors');
INSERT INTO categoria VALUES (24, 'Desktop Computer & Server Cases');
INSERT INTO categoria VALUES (25, 'Motherboards');
INSERT INTO categoria VALUES (26, 'Memory');
INSERT INTO categoria VALUES (27, 'RAM');


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 182
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_seq', 27, true);


--
-- TOC entry 2204 (class 0 OID 16706)
-- Dependencies: 191
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (1, 'Antonio Larson', '2734 Iowa Lane', 'alarson0@webmd.com', 'alarson0', 'OL3LCCySj4w');
INSERT INTO usuario VALUES (2, 'Diana Gibson', '63 Stoughton Alley', 'dgibson1@skyrock.com', 'dgibson1', 'C0SuEmC8w');
INSERT INTO usuario VALUES (3, 'Lori Welch', '1225 Daystar Park', 'lwelch2@printfriendly.com', 'lwelch2', 'kP4OztMfoj');
INSERT INTO usuario VALUES (4, 'Ruby Carroll', '6847 Anderson Junction', 'rcarroll3@state.gov', 'rcarroll3', 'eBE9ikDvsV6z');
INSERT INTO usuario VALUES (5, 'Steven Lee', '2508 Stephen Plaza', 'slee4@naver.com', 'slee4', 'gTymYGBYzb4t');
INSERT INTO usuario VALUES (6, 'Joan Ford', '20922 Michigan Trail', 'jford5@homestead.com', 'jford5', 'WIVFtC7Y');
INSERT INTO usuario VALUES (7, 'Fred West', '91210 Farwell Place', 'fwest6@theguardian.com', 'fwest6', 'kTexIa');
INSERT INTO usuario VALUES (8, 'Eric Reid', '0 John Wall Circle', 'ereid7@techcrunch.com', 'ereid7', 'GHWk5AB');
INSERT INTO usuario VALUES (9, 'Earl Hunter', '66 Carberry Junction', 'ehunter8@vkontakte.ru', 'ehunter8', 'M791V1DIBnG');
INSERT INTO usuario VALUES (10, 'Brenda Lawrence', '92 Londonderry Trail', 'blawrence9@cpanel.net', 'blawrence9', 'pQlk70UWHCV');
INSERT INTO usuario VALUES (11, 'Evelyn Morrison', '26 Mallory Court', 'emorrisona@forbes.com', 'emorrisona', '1s0Ch2SJ8O');
INSERT INTO usuario VALUES (12, 'Tina Martin', '7153 Pond Road', 'tmartinb@guardian.co.uk', 'tmartinb', 'PPGfsKbVrg');
INSERT INTO usuario VALUES (13, 'Joshua Black', '36 Forster Drive', 'jblackc@trellian.com', 'jblackc', 'AVoxz88q');
INSERT INTO usuario VALUES (14, 'Paul Frazier', '4980 Gerald Plaza', 'pfrazierd@diigo.com', 'pfrazierd', 'ZsjqWt');
INSERT INTO usuario VALUES (15, 'Mary Fuller', '4 Hauk Park', 'mfullere@last.fm', 'mfullere', '34ylHfykPbg');
INSERT INTO usuario VALUES (16, 'Irene Carr', '473 Nova Avenue', 'icarrf@howstuffworks.com', 'icarrf', 'M04j4xo5f');
INSERT INTO usuario VALUES (17, 'Ernest Harper', '0 Kropf Plaza', 'eharperg@virginia.edu', 'eharperg', 'e5T7grY');
INSERT INTO usuario VALUES (18, 'Debra Riley', '488 Vahlen Trail', 'drileyh@ezinearticles.com', 'drileyh', '888QvAR7eom');
INSERT INTO usuario VALUES (19, 'David Greene', '89633 Upham Alley', 'dgreenei@youtu.be', 'dgreenei', '6oTfCqgE');
INSERT INTO usuario VALUES (20, 'Maria Morales', '93 Russell Trail', 'mmoralesj@europa.eu', 'mmoralesj', 'JLdYUU33r7');
INSERT INTO usuario VALUES (21, 'Adam James', '9225 Hanson Hill', 'ajamesk@opera.com', 'ajamesk', 'pxTuX7Xz8W2D');
INSERT INTO usuario VALUES (22, 'Adam Wheeler', '090 Garrison Road', 'awheelerl@moonfruit.com', 'awheelerl', 'YYd24eo1yYiS');
INSERT INTO usuario VALUES (23, 'Tina Warren', '46448 Brown Terrace', 'twarrenm@virginia.edu', 'twarrenm', 'UGaOpbqydu');
INSERT INTO usuario VALUES (24, 'Katherine Carter', '0 La Follette Drive', 'kcartern@nydailynews.com', 'kcartern', 'O4QSmaqRrsvY');
INSERT INTO usuario VALUES (25, 'Juan Carr', '22 Kipling Avenue', 'jcarro@pinterest.com', 'jcarro', 'bMMQ1794Q');
INSERT INTO usuario VALUES (26, 'Mark Foster', '04 Fairview Drive', 'mfosterp@wp.com', 'mfosterp', '0uvh2gb');
INSERT INTO usuario VALUES (27, 'Jessica Warren', '0016 Lakewood Center', 'jwarrenq@time.com', 'jwarrenq', 'bZTu60weBTgO');
INSERT INTO usuario VALUES (28, 'Emily Grant', '230 Kim Way', 'egrantr@amazon.de', 'egrantr', 'rAm4zny74');
INSERT INTO usuario VALUES (29, 'Rachel Simmons', '42 Green Ridge Avenue', 'rsimmonss@nyu.edu', 'rsimmonss', 'h3x7qERJ');
INSERT INTO usuario VALUES (30, 'Matthew Brooks', '25969 Arkansas Park', 'mbrookst@eepurl.com', 'mbrookst', 'bhKbrkGD');
INSERT INTO usuario VALUES (31, 'Jimmy Lawrence', '67 Browning Hill', 'jlawrenceu@sitemeter.com', 'jlawrenceu', 'RUSl3r');
INSERT INTO usuario VALUES (32, 'Jack Fernandez', '21 Calypso Center', 'jfernandezv@aol.com', 'jfernandezv', 'Xf3Xkk3rqM9');
INSERT INTO usuario VALUES (33, 'Roy Reid', '42 Hanover Place', 'rreidw@mysql.com', 'rreidw', '5G1w7PDfnK');
INSERT INTO usuario VALUES (34, 'Gloria Moore', '1 Nevada Terrace', 'gmoorex@homestead.com', 'gmoorex', 'fiiIbRb29D');
INSERT INTO usuario VALUES (35, 'Jessica James', '63 Reinke Circle', 'jjamesy@dyndns.org', 'jjamesy', 'nfNmG2j');
INSERT INTO usuario VALUES (36, 'Peter Parker', '22308 Forest Street', 'pparkerz@timesonline.co.uk', 'pparkerz', '35h8QURBX');
INSERT INTO usuario VALUES (37, 'George Rogers', '4 Shoshone Alley', 'grogers10@vimeo.com', 'grogers10', 'nBWmMBRm0');
INSERT INTO usuario VALUES (38, 'Eric Taylor', '32899 Forest Run Court', 'etaylor11@moonfruit.com', 'etaylor11', '47iPQJa');
INSERT INTO usuario VALUES (39, 'Terry Hanson', '8770 Cordelia Junction', 'thanson12@instagram.com', 'thanson12', 'DgPv3q');
INSERT INTO usuario VALUES (40, 'Gregory Ford', '72 Prairie Rose Place', 'gford13@wisc.edu', 'gford13', '2rTtI8');
INSERT INTO usuario VALUES (41, 'Sandra Wright', '02161 Scofield Junction', 'swright14@soup.io', 'swright14', '8B8FV52L');
INSERT INTO usuario VALUES (42, 'Debra Frazier', '7 Norway Maple Street', 'dfrazier15@apache.org', 'dfrazier15', 'V4p6xu');
INSERT INTO usuario VALUES (43, 'Elizabeth Sanchez', '6655 Dunning Parkway', 'esanchez16@eventbrite.com', 'esanchez16', 'CIYm1hn6');
INSERT INTO usuario VALUES (44, 'Frank Anderson', '51716 Shasta Park', 'fanderson17@dion.ne.jp', 'fanderson17', 'vJDORdf');
INSERT INTO usuario VALUES (45, 'Douglas Richards', '0 Londonderry Circle', 'drichards18@trellian.com', 'drichards18', '3pVLx3n3L');
INSERT INTO usuario VALUES (46, 'Anna Hughes', '35 Vahlen Hill', 'ahughes19@diigo.com', 'ahughes19', 'Ltus8PR4');
INSERT INTO usuario VALUES (47, 'Debra Diaz', '9174 Forest Dale Street', 'ddiaz1a@examiner.com', 'ddiaz1a', 'GdBmybwXORU');
INSERT INTO usuario VALUES (48, 'Catherine Watson', '38 Maryland Crossing', 'cwatson1b@army.mil', 'cwatson1b', 'gaa9xpC');
INSERT INTO usuario VALUES (49, 'Nancy Watson', '55 Katie Street', 'nwatson1c@studiopress.com', 'nwatson1c', '4shmIAIGyXT5');
INSERT INTO usuario VALUES (50, 'Fred White', '51 North Junction', 'fwhite1d@google.pl', 'fwhite1d', 'lqpHUARSOeq');
INSERT INTO usuario VALUES (51, 'Stephanie Carr', '2164 Mockingbird Point', 'scarr1e@toplist.cz', 'scarr1e', 'cpSEzCS');
INSERT INTO usuario VALUES (52, 'Theresa Burke', '0179 Buell Place', 'tburke1f@nydailynews.com', 'tburke1f', 't5X74u7Kuk');
INSERT INTO usuario VALUES (53, 'Anthony Hill', '46243 Springview Junction', 'ahill1g@hostgator.com', 'ahill1g', 'YaQKzLWxPAym');
INSERT INTO usuario VALUES (54, 'Earl Rose', '44268 Arapahoe Park', 'erose1h@ucoz.com', 'erose1h', 'azcSL0CC');
INSERT INTO usuario VALUES (55, 'Betty Peters', '38 Chinook Crossing', 'bpeters1i@taobao.com', 'bpeters1i', 'A3ImNfvGCkj');
INSERT INTO usuario VALUES (56, 'Patricia Foster', '68591 Mariners Cove Junction', 'pfoster1j@sciencedaily.com', 'pfoster1j', 't9QTIdBSu');
INSERT INTO usuario VALUES (57, 'Sara Wright', '36496 Kropf Place', 'swright1k@weather.com', 'swright1k', 'OWBCra6A');
INSERT INTO usuario VALUES (58, 'Andrea Hall', '4892 Ramsey Hill', 'ahall1l@phpbb.com', 'ahall1l', '4h8AGYdAQ4Ar');
INSERT INTO usuario VALUES (59, 'Timothy Howard', '0147 Artisan Alley', 'thoward1m@prweb.com', 'thoward1m', 'qdtxvRET');
INSERT INTO usuario VALUES (60, 'Edward Ray', '9 Summit Place', 'eray1n@webs.com', 'eray1n', 'gK1mqbvvFAzi');
INSERT INTO usuario VALUES (61, 'Elizabeth Wallace', '1 Dixon Circle', 'ewallace1o@mtv.com', 'ewallace1o', 'NpztpcMH8h');
INSERT INTO usuario VALUES (62, 'Doris Woods', '24893 West Way', 'dwoods1p@spotify.com', 'dwoods1p', 'TC4KWqG0XS');
INSERT INTO usuario VALUES (63, 'Matthew Fuller', '244 Fordem Point', 'mfuller1q@cisco.com', 'mfuller1q', 'ShV9ZxB1NW');
INSERT INTO usuario VALUES (64, 'Frank Hayes', '024 Maple Way', 'fhayes1r@ucla.edu', 'fhayes1r', 'TysoGTP');
INSERT INTO usuario VALUES (65, 'Janice Henderson', '84 Fulton Pass', 'jhenderson1s@omniture.com', 'jhenderson1s', 'IH7i3o2uleM');
INSERT INTO usuario VALUES (66, 'Steven Hayes', '30312 Center Avenue', 'shayes1t@123-reg.co.uk', 'shayes1t', 'AiQ2dUZ');
INSERT INTO usuario VALUES (67, 'Lisa Reid', '5 Oak Plaza', 'lreid1u@walmart.com', 'lreid1u', 'YVDdfP3IfAak');
INSERT INTO usuario VALUES (68, 'Jose Cruz', '96 Meadow Ridge Way', 'jcruz1v@google.com.br', 'jcruz1v', 'RdyEQzo');
INSERT INTO usuario VALUES (69, 'Todd Wilson', '3374 Donald Street', 'twilson1w@pbs.org', 'twilson1w', 'sZtVLy6H');
INSERT INTO usuario VALUES (70, 'Joseph Porter', '7288 Kim Alley', 'jporter1x@dion.ne.jp', 'jporter1x', 'JJmSNyJ');
INSERT INTO usuario VALUES (71, 'Katherine Murray', '7 Johnson Trail', 'kmurray1y@kickstarter.com', 'kmurray1y', 'Se5U78WoK');
INSERT INTO usuario VALUES (72, 'Lori Snyder', '7 Pankratz Terrace', 'lsnyder1z@thetimes.co.uk', 'lsnyder1z', 'n0JpA5IYRE7O');
INSERT INTO usuario VALUES (73, 'Jean Allen', '336 Logan Road', 'jallen20@biglobe.ne.jp', 'jallen20', '78W9xE6nmYU');
INSERT INTO usuario VALUES (74, 'Melissa Kennedy', '5 Packers Plaza', 'mkennedy21@noaa.gov', 'mkennedy21', 'LPRQWs');
INSERT INTO usuario VALUES (75, 'Evelyn Ferguson', '333 Crowley Park', 'eferguson22@rambler.ru', 'eferguson22', 'mKtN2oymoVW');
INSERT INTO usuario VALUES (222, 'Brian Hunt', '6464 Tomscot Pass', 'bhunt65@omniture.com', 'bhunt65', 'xYMgIoi');
INSERT INTO usuario VALUES (76, 'Helen Patterson', '69339 Schiller Court', 'hpatterson23@delicious.com', 'hpatterson23', 'KzEZatWv5EOM');
INSERT INTO usuario VALUES (77, 'Douglas Ford', '36 Springview Center', 'dford24@dot.gov', 'dford24', 'BL9cKpISK3p');
INSERT INTO usuario VALUES (78, 'Larry Williams', '27 Lotheville Park', 'lwilliams25@amazon.de', 'lwilliams25', 'ZxC9g1J64vi0');
INSERT INTO usuario VALUES (79, 'Brandon Riley', '75876 Grim Plaza', 'briley26@theguardian.com', 'briley26', 'b7FGHnMffFq5');
INSERT INTO usuario VALUES (80, 'Denise Hayes', '59 Meadow Ridge Hill', 'dhayes27@bandcamp.com', 'dhayes27', 'qvwJcROcapng');
INSERT INTO usuario VALUES (81, 'Alan Richards', '7083 Delaware Lane', 'arichards28@feedburner.com', 'arichards28', 'UYnPMG6VVtAx');
INSERT INTO usuario VALUES (82, 'Anna Gibson', '5 Portage Place', 'agibson29@redcross.org', 'agibson29', 'qGCfU00FbeG');
INSERT INTO usuario VALUES (83, 'Lisa Fernandez', '9612 Prentice Court', 'lfernandez2a@diigo.com', 'lfernandez2a', 'ZyGMiOWG');
INSERT INTO usuario VALUES (84, 'Sandra Thompson', '503 Carpenter Drive', 'sthompson2b@barnesandnoble.com', 'sthompson2b', 'N2HJp4ae9rRm');
INSERT INTO usuario VALUES (85, 'Tammy Hudson', '5672 Jenifer Court', 'thudson2c@miibeian.gov.cn', 'thudson2c', 'OwdlZmg');
INSERT INTO usuario VALUES (86, 'Victor Spencer', '64 Monterey Circle', 'vspencer2d@delicious.com', 'vspencer2d', 'WFPd6W');
INSERT INTO usuario VALUES (87, 'Raymond Arnold', '3911 Oneill Junction', 'rarnold2e@china.com.cn', 'rarnold2e', 'D5LNYrLsB');
INSERT INTO usuario VALUES (88, 'Stephen Gardner', '13 Sunnyside Hill', 'sgardner2f@psu.edu', 'sgardner2f', 'a2Lg9sD1cab');
INSERT INTO usuario VALUES (89, 'Laura Snyder', '11234 Goodland Court', 'lsnyder2g@delicious.com', 'lsnyder2g', 'AKqSaX');
INSERT INTO usuario VALUES (90, 'Kathryn Lawson', '76596 Bay Lane', 'klawson2h@imgur.com', 'klawson2h', 'g2bK8ZyP7Qdl');
INSERT INTO usuario VALUES (91, 'Jacqueline Reid', '69725 Portage Parkway', 'jreid2i@cpanel.net', 'jreid2i', 'UHWD6ZOoIi');
INSERT INTO usuario VALUES (92, 'Kimberly Stevens', '57 Truax Plaza', 'kstevens2j@naver.com', 'kstevens2j', '4BH4H1qEESL5');
INSERT INTO usuario VALUES (93, 'Steve Hart', '551 Helena Court', 'shart2k@weather.com', 'shart2k', 'GgySJP3Fkn');
INSERT INTO usuario VALUES (94, 'Timothy Little', '4732 Merrick Terrace', 'tlittle2l@eepurl.com', 'tlittle2l', 'VfoFZ6J');
INSERT INTO usuario VALUES (95, 'Joseph Hernandez', '113 Randy Court', 'jhernandez2m@gravatar.com', 'jhernandez2m', 'oOooLW7cSI');
INSERT INTO usuario VALUES (96, 'Scott Garcia', '0 Oneill Pass', 'sgarcia2n@cdbaby.com', 'sgarcia2n', 'xmOzRVnzQBK');
INSERT INTO usuario VALUES (97, 'Joe Howell', '8706 Spaight Terrace', 'jhowell2o@ucoz.com', 'jhowell2o', 'dVRKc0WMYF3');
INSERT INTO usuario VALUES (98, 'Julie Edwards', '73381 Sugar Park', 'jedwards2p@t-online.de', 'jedwards2p', '6i8j4w9Qgv');
INSERT INTO usuario VALUES (99, 'Helen Coleman', '78 Eastlawn Place', 'hcoleman2q@usatoday.com', 'hcoleman2q', '3zjgU2g');
INSERT INTO usuario VALUES (100, 'Christine Montgomery', '61904 Lindbergh Point', 'cmontgomery2r@purevolume.com', 'cmontgomery2r', 'hU8DhtF5ZTj');
INSERT INTO usuario VALUES (101, 'Carl George', '4447 Susan Pass', 'cgeorge2s@netscape.com', 'cgeorge2s', 'd3aZkMJ9h');
INSERT INTO usuario VALUES (102, 'Victor Turner', '8 Veith Road', 'vturner2t@nba.com', 'vturner2t', 'ljLyk61W');
INSERT INTO usuario VALUES (103, 'Rachel Fisher', '7618 Montana Plaza', 'rfisher2u@lycos.com', 'rfisher2u', 'SkXBoL');
INSERT INTO usuario VALUES (104, 'Wayne Little', '125 Ridgeview Hill', 'wlittle2v@timesonline.co.uk', 'wlittle2v', 'MXE3qAqkc');
INSERT INTO usuario VALUES (105, 'Alice Evans', '8734 Memorial Center', 'aevans2w@foxnews.com', 'aevans2w', 'Eo8hG0xvW5');
INSERT INTO usuario VALUES (106, 'Nancy Wheeler', '49334 Manley Crossing', 'nwheeler2x@ibm.com', 'nwheeler2x', 'nPTedKFXCVI');
INSERT INTO usuario VALUES (107, 'Amanda Howell', '26394 Roxbury Drive', 'ahowell2y@bizjournals.com', 'ahowell2y', 'w4ggV0w3N');
INSERT INTO usuario VALUES (108, 'Donna Nichols', '931 Westridge Drive', 'dnichols2z@4shared.com', 'dnichols2z', '9UaRU08E3n');
INSERT INTO usuario VALUES (109, 'Russell Fernandez', '529 Tennyson Hill', 'rfernandez30@about.me', 'rfernandez30', 'PECLB70');
INSERT INTO usuario VALUES (110, 'Timothy Wallace', '73 Carberry Center', 'twallace31@about.com', 'twallace31', 'ET7ZectZ');
INSERT INTO usuario VALUES (111, 'Ann Woods', '4300 Mcbride Avenue', 'awoods32@rakuten.co.jp', 'awoods32', '7QBc94wX');
INSERT INTO usuario VALUES (112, 'Jonathan Hawkins', '63047 Tennyson Road', 'jhawkins33@xrea.com', 'jhawkins33', 'zpYVlWPB06q');
INSERT INTO usuario VALUES (113, 'Judith Evans', '4 Maple Hill', 'jevans34@wisc.edu', 'jevans34', 'Nvi8tb4Dd');
INSERT INTO usuario VALUES (114, 'Benjamin Nguyen', '7241 Ludington Avenue', 'bnguyen35@state.tx.us', 'bnguyen35', 'NY0B8i8wIp6');
INSERT INTO usuario VALUES (115, 'Tina Crawford', '455 Dixon Terrace', 'tcrawford36@google.com.au', 'tcrawford36', 'MkiDThmxOUJ');
INSERT INTO usuario VALUES (116, 'Keith Snyder', '55180 Delaware Alley', 'ksnyder37@macromedia.com', 'ksnyder37', 'bvX1SIvb5JTt');
INSERT INTO usuario VALUES (117, 'David Riley', '131 Everett Trail', 'driley38@jalbum.net', 'driley38', 'dIsLYuVfezyL');
INSERT INTO usuario VALUES (118, 'Wanda Brooks', '71 Troy Street', 'wbrooks39@naver.com', 'wbrooks39', '9gsOwMOiSCk');
INSERT INTO usuario VALUES (119, 'Cheryl Perry', '3664 Delladonna Junction', 'cperry3a@1688.com', 'cperry3a', 'lVFKIl3');
INSERT INTO usuario VALUES (120, 'Jennifer Dixon', '8690 Trailsway Junction', 'jdixon3b@gmpg.org', 'jdixon3b', 'n8WkDT0uCE6D');
INSERT INTO usuario VALUES (121, 'James Duncan', '862 Sheridan Road', 'jduncan3c@weibo.com', 'jduncan3c', 'QMgNK98BludO');
INSERT INTO usuario VALUES (122, 'Martin King', '8318 Hoffman Lane', 'mking3d@tmall.com', 'mking3d', 'vqA5d6DLf');
INSERT INTO usuario VALUES (123, 'Angela Freeman', '7338 Gerald Avenue', 'afreeman3e@cdc.gov', 'afreeman3e', 'lSZijf5O');
INSERT INTO usuario VALUES (124, 'Ruth Weaver', '69173 Cambridge Junction', 'rweaver3f@multiply.com', 'rweaver3f', 'aKDhFY0');
INSERT INTO usuario VALUES (125, 'Alan Porter', '114 Milwaukee Place', 'aporter3g@answers.com', 'aporter3g', 'PxoKbJ');
INSERT INTO usuario VALUES (126, 'Billy Mills', '8573 Vahlen Center', 'bmills3h@list-manage.com', 'bmills3h', 'NV9WmJ');
INSERT INTO usuario VALUES (127, 'Frances Morris', '525 Buena Vista Circle', 'fmorris3i@sfgate.com', 'fmorris3i', 'ktFfy3KCVf');
INSERT INTO usuario VALUES (128, 'Kathryn Stanley', '70523 Johnson Avenue', 'kstanley3j@istockphoto.com', 'kstanley3j', '00bNpPuVy0aK');
INSERT INTO usuario VALUES (129, 'Virginia Martinez', '5 Pleasure Crossing', 'vmartinez3k@jigsy.com', 'vmartinez3k', 'gN01v2lBkJLO');
INSERT INTO usuario VALUES (130, 'Lori Morrison', '21777 Hauk Crossing', 'lmorrison3l@businessinsider.com', 'lmorrison3l', 'zl9ZNs');
INSERT INTO usuario VALUES (131, 'Alice Nelson', '9842 Miller Hill', 'anelson3m@studiopress.com', 'anelson3m', 'Dqsrwy0ep2E');
INSERT INTO usuario VALUES (132, 'Debra Diaz', '185 Lindbergh Junction', 'ddiaz3n@privacy.gov.au', 'ddiaz3n', '76LiG7j3GQH');
INSERT INTO usuario VALUES (133, 'Dorothy Murray', '98769 Eagan Drive', 'dmurray3o@shop-pro.jp', 'dmurray3o', 'dYgfWYv');
INSERT INTO usuario VALUES (134, 'Karen Anderson', '91 Superior Court', 'kanderson3p@google.nl', 'kanderson3p', 'CGIEFuu');
INSERT INTO usuario VALUES (135, 'David Gardner', '7 Badeau Drive', 'dgardner3q@mtv.com', 'dgardner3q', '2Oc385BIRY');
INSERT INTO usuario VALUES (136, 'Elizabeth Peters', '18708 Briar Crest Parkway', 'epeters3r@creativecommons.org', 'epeters3r', '5x76T1vN');
INSERT INTO usuario VALUES (137, 'Linda Ramirez', '30353 Moulton Point', 'lramirez3s@dot.gov', 'lramirez3s', 'nYf06Pq');
INSERT INTO usuario VALUES (138, 'Amanda Graham', '86 Golf View Avenue', 'agraham3t@nps.gov', 'agraham3t', 'zcPTdF2');
INSERT INTO usuario VALUES (139, 'Catherine Kennedy', '619 Maywood Alley', 'ckennedy3u@hostgator.com', 'ckennedy3u', 'U8JvzuMgdck2');
INSERT INTO usuario VALUES (140, 'Anne Wood', '75 Carpenter Street', 'awood3v@google.com', 'awood3v', 'vR7Zyoj0RXm');
INSERT INTO usuario VALUES (141, 'Donald Hunter', '28 Messerschmidt Hill', 'dhunter3w@chron.com', 'dhunter3w', 'ubmw2YWYspQ');
INSERT INTO usuario VALUES (142, 'Laura Moreno', '34515 Derek Center', 'lmoreno3x@reddit.com', 'lmoreno3x', 'mifxBsj');
INSERT INTO usuario VALUES (143, 'Henry Banks', '41365 Barnett Court', 'hbanks3y@arizona.edu', 'hbanks3y', 'ezeatawMzy');
INSERT INTO usuario VALUES (144, 'Joe Holmes', '5643 Kenwood Park', 'jholmes3z@bloglovin.com', 'jholmes3z', 'Ioz3H37');
INSERT INTO usuario VALUES (145, 'Eric Long', '4 Esch Parkway', 'elong40@weibo.com', 'elong40', 'MAoG4j1');
INSERT INTO usuario VALUES (146, 'Jacqueline Gutierrez', '5088 Bartelt Way', 'jgutierrez41@mapquest.com', 'jgutierrez41', 'icxOJGOB');
INSERT INTO usuario VALUES (147, 'Ann Ellis', '305 Stuart Pass', 'aellis42@networkadvertising.org', 'aellis42', 'z56hI6Z');
INSERT INTO usuario VALUES (148, 'Virginia Fuller', '86 Maple Wood Plaza', 'vfuller43@biblegateway.com', 'vfuller43', 'UlI6xK');
INSERT INTO usuario VALUES (149, 'Adam Rose', '9 Ruskin Alley', 'arose44@symantec.com', 'arose44', 'AHqUBDa5eA');
INSERT INTO usuario VALUES (150, 'Matthew Hawkins', '63122 Division Place', 'mhawkins45@wufoo.com', 'mhawkins45', 'OS8AFEpH');
INSERT INTO usuario VALUES (151, 'Irene Barnes', '9 Spohn Place', 'ibarnes46@yandex.ru', 'ibarnes46', 'ssQwVknos6va');
INSERT INTO usuario VALUES (152, 'Christine Kim', '0 Continental Junction', 'ckim47@barnesandnoble.com', 'ckim47', 'KC8xX4I0');
INSERT INTO usuario VALUES (153, 'Barbara Wheeler', '8113 Anthes Plaza', 'bwheeler48@scribd.com', 'bwheeler48', 'Fw6zAHDQArPk');
INSERT INTO usuario VALUES (154, 'Paul Marshall', '9 Columbus Plaza', 'pmarshall49@slideshare.net', 'pmarshall49', 'KPbJ3J3ya0k');
INSERT INTO usuario VALUES (155, 'Antonio Dixon', '83108 Cottonwood Avenue', 'adixon4a@skyrock.com', 'adixon4a', 'HAt8u3s');
INSERT INTO usuario VALUES (156, 'Michelle Roberts', '1 Rockefeller Way', 'mroberts4b@naver.com', 'mroberts4b', 'Ocq6LE');
INSERT INTO usuario VALUES (157, 'Ruth Burton', '543 Wayridge Avenue', 'rburton4c@redcross.org', 'rburton4c', 'gvO0pBRWh');
INSERT INTO usuario VALUES (158, 'Maria Cruz', '74 Roth Lane', 'mcruz4d@baidu.com', 'mcruz4d', '7kwnK4cbiEwX');
INSERT INTO usuario VALUES (159, 'Wayne Price', '1 Holmberg Parkway', 'wprice4e@dailymail.co.uk', 'wprice4e', 'KLKekvfHs2');
INSERT INTO usuario VALUES (160, 'Steven Sanchez', '401 Milwaukee Avenue', 'ssanchez4f@163.com', 'ssanchez4f', 'ljAuqTW');
INSERT INTO usuario VALUES (161, 'Gloria Taylor', '541 Vera Alley', 'gtaylor4g@goo.gl', 'gtaylor4g', 'ugcsWh7');
INSERT INTO usuario VALUES (162, 'Billy Stone', '4 Eagle Crest Court', 'bstone4h@abc.net.au', 'bstone4h', 'vVi7KIpI');
INSERT INTO usuario VALUES (163, 'Theresa Warren', '20 Brown Alley', 'twarren4i@hexun.com', 'twarren4i', 'wXMVCoQfVp');
INSERT INTO usuario VALUES (164, 'Andrew Fisher', '95 Hoard Terrace', 'afisher4j@biglobe.ne.jp', 'afisher4j', 'yrDj2bmmMg');
INSERT INTO usuario VALUES (165, 'Rebecca Wallace', '309 Tony Circle', 'rwallace4k@theatlantic.com', 'rwallace4k', 'ohpSAyl5j');
INSERT INTO usuario VALUES (166, 'Norma Flores', '7 Stephen Hill', 'nflores4l@alibaba.com', 'nflores4l', '0itDthcXJoPI');
INSERT INTO usuario VALUES (167, 'Evelyn Watkins', '0 Mifflin Crossing', 'ewatkins4m@upenn.edu', 'ewatkins4m', '1fUNbg');
INSERT INTO usuario VALUES (168, 'Adam Ramirez', '1 Rusk Center', 'aramirez4n@fc2.com', 'aramirez4n', 'wJOX7Flj4UJ');
INSERT INTO usuario VALUES (169, 'Mildred Olson', '7367 Lighthouse Bay Pass', 'molson4o@shinystat.com', 'molson4o', '0no1U5');
INSERT INTO usuario VALUES (170, 'Kathy Howell', '8722 Mallory Circle', 'khowell4p@cargocollective.com', 'khowell4p', 'qykJxMseTPI');
INSERT INTO usuario VALUES (171, 'Gloria Flores', '1323 Thompson Circle', 'gflores4q@hugedomains.com', 'gflores4q', 'HNbzTfkmM');
INSERT INTO usuario VALUES (172, 'Douglas Little', '65 Springs Hill', 'dlittle4r@nasa.gov', 'dlittle4r', 'ZLTMbXJzf');
INSERT INTO usuario VALUES (173, 'Russell Duncan', '9 Morrow Lane', 'rduncan4s@icq.com', 'rduncan4s', 'AwzLgRF');
INSERT INTO usuario VALUES (174, 'Kenneth Foster', '65 Ilene Place', 'kfoster4t@sakura.ne.jp', 'kfoster4t', '0SyjJLO');
INSERT INTO usuario VALUES (175, 'Jane Perkins', '2382 Susan Circle', 'jperkins4u@kickstarter.com', 'jperkins4u', 'LwvH4HmivVQ');
INSERT INTO usuario VALUES (176, 'Paula Richardson', '63 Sheridan Park', 'prichardson4v@posterous.com', 'prichardson4v', '9jl39B7');
INSERT INTO usuario VALUES (177, 'Scott Gomez', '0146 Esker Street', 'sgomez4w@hp.com', 'sgomez4w', 'akBGOBhY9');
INSERT INTO usuario VALUES (178, 'Debra Banks', '29345 Sage Hill', 'dbanks4x@hexun.com', 'dbanks4x', 'us2f4hU63');
INSERT INTO usuario VALUES (179, 'Victor Oliver', '65 Moland Avenue', 'voliver4y@furl.net', 'voliver4y', 'e0K2GaD');
INSERT INTO usuario VALUES (180, 'Amanda Simpson', '43993 Moulton Circle', 'asimpson4z@dot.gov', 'asimpson4z', 'PIWMF1ebYSaU');
INSERT INTO usuario VALUES (181, 'Shirley Arnold', '2358 Columbus Parkway', 'sarnold50@bizjournals.com', 'sarnold50', 'dJl8kui2');
INSERT INTO usuario VALUES (182, 'Ruth Mills', '27526 Meadow Ridge Point', 'rmills51@naver.com', 'rmills51', 'ikPUCbW9N');
INSERT INTO usuario VALUES (183, 'Doris Green', '20 Eggendart Park', 'dgreen52@trellian.com', 'dgreen52', 'xLc7Z97AXzk8');
INSERT INTO usuario VALUES (184, 'Michelle Murphy', '79 Carioca Trail', 'mmurphy53@wufoo.com', 'mmurphy53', '5Y37qhlyG');
INSERT INTO usuario VALUES (185, 'Keith Stephens', '218 Hollow Ridge Way', 'kstephens54@jimdo.com', 'kstephens54', 'MeJwv8il');
INSERT INTO usuario VALUES (186, 'Andrea Lynch', '886 Coolidge Avenue', 'alynch55@e-recht24.de', 'alynch55', '6N006Ngv');
INSERT INTO usuario VALUES (187, 'Juan Duncan', '9317 Westerfield Circle', 'jduncan56@blinklist.com', 'jduncan56', 'xeqlkCcSdrz');
INSERT INTO usuario VALUES (188, 'Lawrence Bishop', '10 Monterey Lane', 'lbishop57@statcounter.com', 'lbishop57', 'JNV6qwJT3');
INSERT INTO usuario VALUES (189, 'Diana Ward', '69 Golf View Drive', 'dward58@google.com', 'dward58', 'jDAVx7G');
INSERT INTO usuario VALUES (190, 'Amanda Barnes', '10202 Westend Point', 'abarnes59@princeton.edu', 'abarnes59', 'uECxiSmasfys');
INSERT INTO usuario VALUES (191, 'Gregory Bowman', '9 Lukken Park', 'gbowman5a@bloglines.com', 'gbowman5a', '4ThUmUl');
INSERT INTO usuario VALUES (192, 'Mildred Patterson', '72 Springs Road', 'mpatterson5b@google.ca', 'mpatterson5b', 'QNTZeN');
INSERT INTO usuario VALUES (193, 'Victor Morales', '69 Muir Trail', 'vmorales5c@reverbnation.com', 'vmorales5c', '8JRjQi');
INSERT INTO usuario VALUES (194, 'Sean Adams', '8726 Express Place', 'sadams5d@seesaa.net', 'sadams5d', 'gApHcCVYq');
INSERT INTO usuario VALUES (195, 'Walter Hansen', '90 Westport Circle', 'whansen5e@wired.com', 'whansen5e', 'RHCSuh8JT');
INSERT INTO usuario VALUES (196, 'Sharon Coleman', '8 Daystar Parkway', 'scoleman5f@comsenz.com', 'scoleman5f', 'mVJqk83Zp');
INSERT INTO usuario VALUES (197, 'Rachel Howell', '35 3rd Street', 'rhowell5g@seattletimes.com', 'rhowell5g', 'fwgq2YpNF');
INSERT INTO usuario VALUES (198, 'Jessica Cole', '24920 High Crossing Lane', 'jcole5h@miibeian.gov.cn', 'jcole5h', 'LIawCKfP');
INSERT INTO usuario VALUES (199, 'Joshua Ray', '0185 Manufacturers Drive', 'jray5i@bandcamp.com', 'jray5i', 'y4JxCdr8');
INSERT INTO usuario VALUES (200, 'Jack Gibson', '831 Reinke Lane', 'jgibson5j@dailymotion.com', 'jgibson5j', 'jKbV5lj');
INSERT INTO usuario VALUES (201, 'Paul Murray', '2 Rigney Terrace', 'pmurray5k@xrea.com', 'pmurray5k', 'u69zKxJgm');
INSERT INTO usuario VALUES (202, 'Emily Dunn', '47 Oak Plaza', 'edunn5l@hc360.com', 'edunn5l', 'Rxpy7BENrR5');
INSERT INTO usuario VALUES (203, 'Julie Rivera', '48966 Mandrake Park', 'jrivera5m@mozilla.org', 'jrivera5m', 'YeVaRwojOB');
INSERT INTO usuario VALUES (204, 'Nicholas Duncan', '89 Lunder Way', 'nduncan5n@redcross.org', 'nduncan5n', 'CRTZh2Jcg');
INSERT INTO usuario VALUES (205, 'Andrea Weaver', '3 Glendale Crossing', 'aweaver5o@economist.com', 'aweaver5o', 'fLzgcac0');
INSERT INTO usuario VALUES (206, 'Alan Parker', '63046 Blaine Park', 'aparker5p@npr.org', 'aparker5p', '8tvwNojd');
INSERT INTO usuario VALUES (207, 'Randy Nelson', '6878 Mockingbird Lane', 'rnelson5q@linkedin.com', 'rnelson5q', 'BklHCEHxfEn');
INSERT INTO usuario VALUES (208, 'Jacqueline Foster', '457 Crescent Oaks Road', 'jfoster5r@chron.com', 'jfoster5r', 'S6yOSpJvV');
INSERT INTO usuario VALUES (209, 'Craig George', '6225 Jackson Place', 'cgeorge5s@apache.org', 'cgeorge5s', 'RZecrf');
INSERT INTO usuario VALUES (210, 'Gloria Fernandez', '47 American Ash Park', 'gfernandez5t@vinaora.com', 'gfernandez5t', 'UOG7JGKyr68');
INSERT INTO usuario VALUES (211, 'Richard Berry', '392 Melby Trail', 'rberry5u@accuweather.com', 'rberry5u', 'XHCb8h');
INSERT INTO usuario VALUES (212, 'Martha Stanley', '2 Fair Oaks Road', 'mstanley5v@msn.com', 'mstanley5v', 'fCCELsWUk');
INSERT INTO usuario VALUES (213, 'Diane Fox', '9101 Hermina Circle', 'dfox5w@nature.com', 'dfox5w', 'GjsmW5U');
INSERT INTO usuario VALUES (214, 'Robert Mendoza', '4 Dottie Lane', 'rmendoza5x@imgur.com', 'rmendoza5x', 'wr3aL6vOt');
INSERT INTO usuario VALUES (215, 'Joe Dunn', '460 Continental Hill', 'jdunn5y@usnews.com', 'jdunn5y', '634DWZXB');
INSERT INTO usuario VALUES (216, 'Susan Stanley', '6 Messerschmidt Place', 'sstanley5z@gizmodo.com', 'sstanley5z', '6wbTAeX5');
INSERT INTO usuario VALUES (217, 'Robert Marshall', '21 Fremont Parkway', 'rmarshall60@twitpic.com', 'rmarshall60', 'XUDzye');
INSERT INTO usuario VALUES (218, 'Gerald Gardner', '63581 Lyons Alley', 'ggardner61@soup.io', 'ggardner61', 'dr1oLWIbjUL7');
INSERT INTO usuario VALUES (219, 'Jason Hamilton', '2 Stephen Way', 'jhamilton62@google.ca', 'jhamilton62', 's2kktKX9');
INSERT INTO usuario VALUES (220, 'Paul White', '4534 Meadow Ridge Pass', 'pwhite63@phpbb.com', 'pwhite63', 'dRerTG');
INSERT INTO usuario VALUES (221, 'Kimberly Price', '81029 Kennedy Pass', 'kprice64@mit.edu', 'kprice64', '9WsREk');
INSERT INTO usuario VALUES (223, 'Arthur Bennett', '74 4th Street', 'abennett66@europa.eu', 'abennett66', 'noZuqkAY');
INSERT INTO usuario VALUES (224, 'Louis Johnston', '189 Larry Avenue', 'ljohnston67@ibm.com', 'ljohnston67', '0TxNIx');
INSERT INTO usuario VALUES (225, 'Heather Thomas', '14 Service Point', 'hthomas68@google.com.br', 'hthomas68', 'y7aqrQTJQPR');
INSERT INTO usuario VALUES (226, 'Joan Phillips', '818 Charing Cross Alley', 'jphillips69@squidoo.com', 'jphillips69', 'kXwKWynWLu');
INSERT INTO usuario VALUES (227, 'Antonio Hansen', '365 Corscot Park', 'ahansen6a@miitbeian.gov.cn', 'ahansen6a', 'yKhMz9p76l0');
INSERT INTO usuario VALUES (228, 'Shirley Burns', '4514 Hooker Parkway', 'sburns6b@noaa.gov', 'sburns6b', 'myDvcKcR');
INSERT INTO usuario VALUES (229, 'Elizabeth Riley', '77 Dottie Place', 'eriley6c@arstechnica.com', 'eriley6c', 'e7u0bsg0Z');
INSERT INTO usuario VALUES (230, 'Billy Ryan', '180 Manufacturers Circle', 'bryan6d@csmonitor.com', 'bryan6d', 'gcR6DYW');
INSERT INTO usuario VALUES (231, 'Ann Scott', '90069 Dayton Alley', 'ascott6e@time.com', 'ascott6e', '3EXzS5');
INSERT INTO usuario VALUES (232, 'Joan Weaver', '26 Rigney Street', 'jweaver6f@psu.edu', 'jweaver6f', 'ePCSj4XIhiE');
INSERT INTO usuario VALUES (233, 'Joan Williamson', '5 Summit Circle', 'jwilliamson6g@bbb.org', 'jwilliamson6g', 'MO6MmGxA');
INSERT INTO usuario VALUES (234, 'Kathy Vasquez', '100 Loftsgordon Hill', 'kvasquez6h@exblog.jp', 'kvasquez6h', '4UHQp5V');
INSERT INTO usuario VALUES (235, 'Sharon Fowler', '6408 Corben Center', 'sfowler6i@clickbank.net', 'sfowler6i', 'o0ysW23h3V');
INSERT INTO usuario VALUES (236, 'Michael Alexander', '6 Superior Hill', 'malexander6j@loc.gov', 'malexander6j', '7sayX1HG');
INSERT INTO usuario VALUES (237, 'Ryan Martin', '2301 Kipling Place', 'rmartin6k@elegantthemes.com', 'rmartin6k', 'P36Kd42');
INSERT INTO usuario VALUES (238, 'Arthur Thompson', '29363 Vera Road', 'athompson6l@microsoft.com', 'athompson6l', 'hKPep2rwb');
INSERT INTO usuario VALUES (239, 'Willie Matthews', '86 Stoughton Junction', 'wmatthews6m@imgur.com', 'wmatthews6m', 'MozXoAe');
INSERT INTO usuario VALUES (240, 'Kenneth King', '492 Cottonwood Plaza', 'kking6n@salon.com', 'kking6n', 'dtkPcFzPc');
INSERT INTO usuario VALUES (241, 'Joan Carter', '802 Rigney Court', 'jcarter6o@ehow.com', 'jcarter6o', 'tpG2TPFMrXI');
INSERT INTO usuario VALUES (242, 'Kenneth Morgan', '82390 Sugar Pass', 'kmorgan6p@sohu.com', 'kmorgan6p', 'MdcRH2popufa');
INSERT INTO usuario VALUES (243, 'Beverly Hill', '44314 Northview Street', 'bhill6q@tripod.com', 'bhill6q', 'g7ne0CsPG2ce');
INSERT INTO usuario VALUES (244, 'Brandon Nelson', '252 Lerdahl Circle', 'bnelson6r@cloudflare.com', 'bnelson6r', 'lUtQNsPjwm7U');
INSERT INTO usuario VALUES (245, 'Linda Harris', '9118 Delladonna Road', 'lharris6s@1und1.de', 'lharris6s', 'HMt93jQMR42');
INSERT INTO usuario VALUES (246, 'Chris King', '254 Fairfield Lane', 'cking6t@csmonitor.com', 'cking6t', '3TviR8');
INSERT INTO usuario VALUES (247, 'Edward Henry', '6 Alpine Point', 'ehenry6u@edublogs.org', 'ehenry6u', 'W8FG4I2');
INSERT INTO usuario VALUES (248, 'Ronald Rivera', '557 Sloan Circle', 'rrivera6v@tiny.cc', 'rrivera6v', '2iDQnZZZ');
INSERT INTO usuario VALUES (249, 'John James', '71762 Bartelt Crossing', 'jjames6w@bizjournals.com', 'jjames6w', 'EjjKTT');
INSERT INTO usuario VALUES (250, 'Rose Harris', '07 Eagan Crossing', 'rharris6x@soundcloud.com', 'rharris6x', 'MDTQbdH');
INSERT INTO usuario VALUES (251, 'Carol Hall', '12554 High Crossing Avenue', 'chall6y@pagesperso-orange.fr', 'chall6y', '474pbfUZVS');
INSERT INTO usuario VALUES (252, 'Nicholas Andrews', '3786 Rieder Point', 'nandrews6z@people.com.cn', 'nandrews6z', 'Qmk6sqG');
INSERT INTO usuario VALUES (253, 'Jeremy Tucker', '911 Logan Avenue', 'jtucker70@ftc.gov', 'jtucker70', 'MnagOTOk');
INSERT INTO usuario VALUES (254, 'Arthur Elliott', '08669 Straubel Avenue', 'aelliott71@list-manage.com', 'aelliott71', 'CeMUEZEABdaa');
INSERT INTO usuario VALUES (255, 'Laura Jenkins', '0433 Lien Road', 'ljenkins72@wikia.com', 'ljenkins72', '7HswHXNTaoE');
INSERT INTO usuario VALUES (256, 'Laura Lawson', '504 Stone Corner Point', 'llawson73@google.com.au', 'llawson73', 'uoxxXVN3PM6h');
INSERT INTO usuario VALUES (257, 'Shirley Hudson', '269 Golf Course Road', 'shudson74@ovh.net', 'shudson74', 'KJz6zbkS');
INSERT INTO usuario VALUES (258, 'Marilyn Sanders', '98 Golden Leaf Way', 'msanders75@nps.gov', 'msanders75', 'YxJMuKPShkvc');
INSERT INTO usuario VALUES (259, 'Edward Payne', '684 Victoria Junction', 'epayne76@dion.ne.jp', 'epayne76', 'V2VupxAz');
INSERT INTO usuario VALUES (260, 'Russell Ruiz', '5 Hauk Pass', 'rruiz77@about.me', 'rruiz77', 'TyzAHw3U3');
INSERT INTO usuario VALUES (261, 'Patricia Murphy', '5986 La Follette Place', 'pmurphy78@google.ca', 'pmurphy78', 'zAx1OmwE');
INSERT INTO usuario VALUES (262, 'Richard Howell', '295 Commercial Plaza', 'rhowell79@home.pl', 'rhowell79', 'KnFqhV69rG8R');
INSERT INTO usuario VALUES (263, 'Bonnie Duncan', '4224 Summerview Road', 'bduncan7a@miitbeian.gov.cn', 'bduncan7a', '70BcXUgigd');
INSERT INTO usuario VALUES (264, 'Joyce Boyd', '3 Monument Drive', 'jboyd7b@oracle.com', 'jboyd7b', 'u4Mh90GQfw');
INSERT INTO usuario VALUES (265, 'Ralph Hicks', '7055 Sunbrook Park', 'rhicks7c@japanpost.jp', 'rhicks7c', 'rsZYluBbc');
INSERT INTO usuario VALUES (266, 'Tammy Stanley', '49 High Crossing Lane', 'tstanley7d@mapy.cz', 'tstanley7d', 'chiJkJwM');
INSERT INTO usuario VALUES (267, 'Kathryn Hunt', '605 Commercial Junction', 'khunt7e@yellowpages.com', 'khunt7e', 'yeJDacHP');
INSERT INTO usuario VALUES (268, 'Carol Allen', '958 Fisk Drive', 'callen7f@twitpic.com', 'callen7f', 'UXwpNZM');
INSERT INTO usuario VALUES (269, 'Andrew Thomas', '87172 Veith Crossing', 'athomas7g@ovh.net', 'athomas7g', 'VxJfrB');
INSERT INTO usuario VALUES (270, 'Scott Jenkins', '719 Barnett Pass', 'sjenkins7h@hhs.gov', 'sjenkins7h', 'p4tHAmjT');
INSERT INTO usuario VALUES (271, 'Antonio Murray', '22795 Fairfield Hill', 'amurray7i@theglobeandmail.com', 'amurray7i', 'tIrfOavuR2B');
INSERT INTO usuario VALUES (272, 'Kathy Murphy', '2127 Springs Center', 'kmurphy7j@unicef.org', 'kmurphy7j', '91qixpsLy');
INSERT INTO usuario VALUES (273, 'Charles Mills', '07 Village Hill', 'cmills7k@rediff.com', 'cmills7k', 'oA4ADoPiPyK');
INSERT INTO usuario VALUES (274, 'Mary Stewart', '43 Wayridge Place', 'mstewart7l@printfriendly.com', 'mstewart7l', '1UZ8DBCoVlRy');
INSERT INTO usuario VALUES (275, 'Sara Thomas', '0 Vahlen Trail', 'sthomas7m@theguardian.com', 'sthomas7m', 'nuincRsZDM');
INSERT INTO usuario VALUES (276, 'Steven Mccoy', '45191 Farragut Drive', 'smccoy7n@imageshack.us', 'smccoy7n', 'XUIuT7RWBV');
INSERT INTO usuario VALUES (277, 'Lisa Little', '329 Daystar Lane', 'llittle7o@blog.com', 'llittle7o', '79unQMYL4OLc');
INSERT INTO usuario VALUES (278, 'Joshua Brown', '9053 Meadow Vale Drive', 'jbrown7p@live.com', 'jbrown7p', '0nDO5vapps6R');
INSERT INTO usuario VALUES (279, 'Elizabeth Burke', '80956 Eastwood Park', 'eburke7q@constantcontact.com', 'eburke7q', 'SRzIfEl8S');
INSERT INTO usuario VALUES (280, 'Victor Baker', '4 Lyons Junction', 'vbaker7r@ftc.gov', 'vbaker7r', 'A3QY6o2WRwU');
INSERT INTO usuario VALUES (281, 'Jack Austin', '7 Moland Terrace', 'jaustin7s@networksolutions.com', 'jaustin7s', 'p818QV9');
INSERT INTO usuario VALUES (282, 'Daniel Walker', '5306 Packers Alley', 'dwalker7t@cornell.edu', 'dwalker7t', '77aJb04RKmN');
INSERT INTO usuario VALUES (283, 'Walter Powell', '20 Old Shore Junction', 'wpowell7u@bbb.org', 'wpowell7u', '0HDJBgS4L4');
INSERT INTO usuario VALUES (284, 'Rebecca Cunningham', '178 Nova Crossing', 'rcunningham7v@epa.gov', 'rcunningham7v', 'JhF8HwGBVJY');
INSERT INTO usuario VALUES (285, 'Craig Fuller', '3 South Parkway', 'cfuller7w@wikispaces.com', 'cfuller7w', 'enQlVBOTQ');
INSERT INTO usuario VALUES (286, 'Beverly Riley', '5 Farwell Terrace', 'briley7x@thetimes.co.uk', 'briley7x', 'DWFIW1');
INSERT INTO usuario VALUES (287, 'Ruth Andrews', '191 Browning Place', 'randrews7y@virginia.edu', 'randrews7y', 'paQESAB0SYG');
INSERT INTO usuario VALUES (288, 'Shirley Evans', '05166 Northland Place', 'sevans7z@europa.eu', 'sevans7z', 'qnJER37SionU');
INSERT INTO usuario VALUES (289, 'Jeffrey Davis', '95 Village Way', 'jdavis80@census.gov', 'jdavis80', 'knZ238kh');
INSERT INTO usuario VALUES (290, 'Larry Bryant', '9349 Ridgeway Circle', 'lbryant81@pcworld.com', 'lbryant81', 'LT413p');
INSERT INTO usuario VALUES (291, 'Linda Henderson', '9538 Johnson Court', 'lhenderson82@plala.or.jp', 'lhenderson82', 'Fu1vFuEJHP');
INSERT INTO usuario VALUES (292, 'Patrick Hanson', '28 Dayton Drive', 'phanson83@cmu.edu', 'phanson83', 'Y5O8YStO66');
INSERT INTO usuario VALUES (293, 'Jeremy Wheeler', '7384 Longview Court', 'jwheeler84@cornell.edu', 'jwheeler84', 'st7XFTDohPLY');
INSERT INTO usuario VALUES (294, 'Willie Thompson', '88644 Sundown Crossing', 'wthompson85@etsy.com', 'wthompson85', 'YUTEfUolge');
INSERT INTO usuario VALUES (295, 'Alan Elliott', '6152 Oak Valley Hill', 'aelliott86@vistaprint.com', 'aelliott86', '44dNV1');
INSERT INTO usuario VALUES (296, 'Annie Austin', '67295 Utah Trail', 'aaustin87@businessweek.com', 'aaustin87', 'bFxOR7');
INSERT INTO usuario VALUES (297, 'Sandra Wagner', '62450 Surrey Parkway', 'swagner88@cnbc.com', 'swagner88', '6qyy9cITT92W');
INSERT INTO usuario VALUES (298, 'Chris Myers', '752 Eliot Drive', 'cmyers89@msu.edu', 'cmyers89', 'VnRhXFNe');
INSERT INTO usuario VALUES (299, 'Jose Moreno', '761 Vidon Point', 'jmoreno8a@berkeley.edu', 'jmoreno8a', 'mnoIPtb6SFu');
INSERT INTO usuario VALUES (300, 'Raymond Hicks', '07024 Katie Way', 'rhicks8b@usgs.gov', 'rhicks8b', 'Ng5gswdiO1');
INSERT INTO usuario VALUES (301, 'Sandra Thomas', '28713 Oneill Place', 'sthomas8c@aol.com', 'sthomas8c', '4t7GbxNz');
INSERT INTO usuario VALUES (302, 'David Price', '0795 Hayes Alley', 'dprice8d@huffingtonpost.com', 'dprice8d', 'EttgvCQKp');
INSERT INTO usuario VALUES (303, 'Philip Hunt', '82 Prairieview Trail', 'phunt8e@jalbum.net', 'phunt8e', 'nugYcTuycwC');
INSERT INTO usuario VALUES (304, 'Jerry Lynch', '7 Ilene Drive', 'jlynch8f@hubpages.com', 'jlynch8f', 'ApXieh');
INSERT INTO usuario VALUES (305, 'Lillian Hicks', '53032 Hooker Parkway', 'lhicks8g@apache.org', 'lhicks8g', 'Folpexjf');
INSERT INTO usuario VALUES (306, 'Willie Robinson', '84500 Tony Lane', 'wrobinson8h@shop-pro.jp', 'wrobinson8h', '5sd7rzzeVgQt');
INSERT INTO usuario VALUES (307, 'Lisa Garrett', '2 Delaware Street', 'lgarrett8i@telegraph.co.uk', 'lgarrett8i', 'Gq5solIgvq');
INSERT INTO usuario VALUES (308, 'Dorothy Lee', '11 Meadow Valley Alley', 'dlee8j@paginegialle.it', 'dlee8j', '7sfLMq');
INSERT INTO usuario VALUES (309, 'Dennis Lawrence', '5 Artisan Parkway', 'dlawrence8k@uol.com.br', 'dlawrence8k', 'YQ637vvnHInY');
INSERT INTO usuario VALUES (310, 'Gerald Cox', '90 Carioca Road', 'gcox8l@oakley.com', 'gcox8l', 'bGYRgsWcxoSJ');
INSERT INTO usuario VALUES (311, 'Roger Ross', '95 Tony Pass', 'rross8m@blogspot.com', 'rross8m', 'RRxyAbe');
INSERT INTO usuario VALUES (312, 'Sharon Chapman', '015 Lunder Court', 'schapman8n@hostgator.com', 'schapman8n', 'CjNFYB2D6c8B');
INSERT INTO usuario VALUES (313, 'Lori Boyd', '54198 Shoshone Street', 'lboyd8o@posterous.com', 'lboyd8o', '0X37xHTr');
INSERT INTO usuario VALUES (314, 'Mary Garza', '3983 Beilfuss Drive', 'mgarza8p@usatoday.com', 'mgarza8p', 'C0JHb7a');
INSERT INTO usuario VALUES (315, 'Scott Parker', '21544 Donald Parkway', 'sparker8q@bing.com', 'sparker8q', 'ONkzKHwEjn7l');
INSERT INTO usuario VALUES (316, 'Bruce Miller', '34864 Marcy Park', 'bmiller8r@xinhuanet.com', 'bmiller8r', 'oauQqPubDB');
INSERT INTO usuario VALUES (317, 'Ruth Anderson', '138 Clarendon Parkway', 'randerson8s@printfriendly.com', 'randerson8s', 'iKvIt24h');
INSERT INTO usuario VALUES (318, 'Tammy Sanders', '138 Stone Corner Point', 'tsanders8t@ycombinator.com', 'tsanders8t', '6qIoqrzd');
INSERT INTO usuario VALUES (319, 'Nicole Lawrence', '6992 Crescent Oaks Way', 'nlawrence8u@bloglovin.com', 'nlawrence8u', 'kkHL7GFH');
INSERT INTO usuario VALUES (320, 'Katherine Hart', '41498 Maple Court', 'khart8v@ameblo.jp', 'khart8v', 'bkwBKGHDVd6Z');
INSERT INTO usuario VALUES (321, 'Albert Reed', '914 Ryan Plaza', 'areed8w@baidu.com', 'areed8w', 'kfl1NhTl');
INSERT INTO usuario VALUES (322, 'Robert Tucker', '99032 Eastlawn Point', 'rtucker8x@xinhuanet.com', 'rtucker8x', 'qBS6dS');
INSERT INTO usuario VALUES (323, 'Jean Flores', '56315 Cody Street', 'jflores8y@google.ca', 'jflores8y', 'kISjp4Bml3L6');
INSERT INTO usuario VALUES (324, 'Brian Jenkins', '52 Shopko Lane', 'bjenkins8z@deliciousdays.com', 'bjenkins8z', '41eds7gJ');
INSERT INTO usuario VALUES (325, 'Clarence Greene', '43604 Moland Plaza', 'cgreene90@webnode.com', 'cgreene90', 'tLhCqB6dcdu0');
INSERT INTO usuario VALUES (326, 'Patricia Sims', '25 Warner Court', 'psims91@geocities.com', 'psims91', 'mny3g3U');
INSERT INTO usuario VALUES (327, 'Harry Hart', '82 Cambridge Road', 'hhart92@stanford.edu', 'hhart92', 'iqxFLprAH9hK');
INSERT INTO usuario VALUES (328, 'Joshua Watson', '15555 Fulton Center', 'jwatson93@un.org', 'jwatson93', 'ZS3c5aTOht');
INSERT INTO usuario VALUES (329, 'Diane West', '1 Schmedeman Park', 'dwest94@networkadvertising.org', 'dwest94', '05dGUpEai');
INSERT INTO usuario VALUES (330, 'Kathryn Peters', '8259 Granby Pass', 'kpeters95@hugedomains.com', 'kpeters95', 'AJAse1JKL');
INSERT INTO usuario VALUES (331, 'Anne Hernandez', '03 Milwaukee Court', 'ahernandez96@canalblog.com', 'ahernandez96', 'EBzLvDalpMtl');
INSERT INTO usuario VALUES (332, 'Alan Shaw', '06 Blaine Hill', 'ashaw97@columbia.edu', 'ashaw97', 'M4o0kID');
INSERT INTO usuario VALUES (333, 'Earl Ford', '93036 Hallows Road', 'eford98@nymag.com', 'eford98', 'r4F7j71mCPbt');
INSERT INTO usuario VALUES (334, 'Maria Schmidt', '1 Bluejay Center', 'mschmidt99@multiply.com', 'mschmidt99', 'cLyBMTAl6');
INSERT INTO usuario VALUES (335, 'Raymond Alexander', '93 Ruskin Road', 'ralexander9a@blogspot.com', 'ralexander9a', 'E9fGfy9Icr9T');
INSERT INTO usuario VALUES (336, 'Carl Mccoy', '3 Briar Crest Alley', 'cmccoy9b@si.edu', 'cmccoy9b', 'LsI9CuaUZ');
INSERT INTO usuario VALUES (337, 'Jennifer Howell', '39241 Buell Trail', 'jhowell9c@bluehost.com', 'jhowell9c', 'hPVbfNVg');
INSERT INTO usuario VALUES (338, 'Margaret Gilbert', '748 Waubesa Circle', 'mgilbert9d@weibo.com', 'mgilbert9d', '4kFwcmtkwA');
INSERT INTO usuario VALUES (339, 'Larry Garcia', '57330 Randy Terrace', 'lgarcia9e@cnn.com', 'lgarcia9e', 'EXvVwPUmi');
INSERT INTO usuario VALUES (340, 'Joe Wheeler', '6 Muir Court', 'jwheeler9f@sourceforge.net', 'jwheeler9f', 'S3jkF8Wik8');
INSERT INTO usuario VALUES (341, 'Jennifer Turner', '77 Mosinee Place', 'jturner9g@jimdo.com', 'jturner9g', 'C1OVoIVHw');
INSERT INTO usuario VALUES (342, 'Martha Clark', '46468 Reindahl Court', 'mclark9h@com.com', 'mclark9h', 'SdtNrQk');
INSERT INTO usuario VALUES (343, 'Lawrence Smith', '29045 Green Terrace', 'lsmith9i@yandex.ru', 'lsmith9i', '92AGj2DeIcRA');
INSERT INTO usuario VALUES (344, 'Barbara Hayes', '0291 Onsgard Junction', 'bhayes9j@scientificamerican.com', 'bhayes9j', '5hhSC4GhS2m1');
INSERT INTO usuario VALUES (345, 'Kevin Myers', '03 Little Fleur Circle', 'kmyers9k@noaa.gov', 'kmyers9k', '0lpSpTLxpdv5');
INSERT INTO usuario VALUES (346, 'Kathy Morris', '168 Cascade Crossing', 'kmorris9l@behance.net', 'kmorris9l', '2iXfFmhgFI');
INSERT INTO usuario VALUES (347, 'Kathleen Bennett', '2754 Muir Place', 'kbennett9m@berkeley.edu', 'kbennett9m', '5VPR84Y1SDVN');
INSERT INTO usuario VALUES (348, 'Rachel Henderson', '404 Aberg Center', 'rhenderson9n@mac.com', 'rhenderson9n', 'LnbSOTm');
INSERT INTO usuario VALUES (349, 'Robin Ford', '9 Burrows Pass', 'rford9o@nyu.edu', 'rford9o', 'TX30vs');
INSERT INTO usuario VALUES (350, 'Christopher Stone', '10186 Esker Junction', 'cstone9p@japanpost.jp', 'cstone9p', 'SwLJ1h40');
INSERT INTO usuario VALUES (351, 'Jason Wallace', '5594 Mccormick Court', 'jwallace9q@tripadvisor.com', 'jwallace9q', 'YDCbJRT');
INSERT INTO usuario VALUES (352, 'Stephen Berry', '6 Portage Junction', 'sberry9r@imdb.com', 'sberry9r', 'kzAgmugywo');
INSERT INTO usuario VALUES (353, 'Anthony Rogers', '8362 Clarendon Parkway', 'arogers9s@bravesites.com', 'arogers9s', 'woXgbCOj');
INSERT INTO usuario VALUES (354, 'Lois Diaz', '85 Carpenter Park', 'ldiaz9t@xinhuanet.com', 'ldiaz9t', 'DvldkIeMgVi');
INSERT INTO usuario VALUES (355, 'Billy James', '95919 Hoepker Hill', 'bjames9u@dagondesign.com', 'bjames9u', 'jKQ3rJ8');
INSERT INTO usuario VALUES (356, 'Clarence Payne', '80424 Butterfield Hill', 'cpayne9v@netlog.com', 'cpayne9v', 'GAPJjusLA7I');
INSERT INTO usuario VALUES (357, 'Teresa Schmidt', '4789 Kinsman Park', 'tschmidt9w@mail.ru', 'tschmidt9w', 'HraEKu1UTC');
INSERT INTO usuario VALUES (358, 'Marie Stone', '31160 Utah Plaza', 'mstone9x@intel.com', 'mstone9x', '0wj4tiB');
INSERT INTO usuario VALUES (359, 'Pamela Bennett', '9 Johnson Lane', 'pbennett9y@oaic.gov.au', 'pbennett9y', 'uun6F2vdh4Aa');
INSERT INTO usuario VALUES (360, 'Roy Wright', '950 Spenser Way', 'rwright9z@nasa.gov', 'rwright9z', '6dQW8t');
INSERT INTO usuario VALUES (361, 'Heather Kelley', '5 Mifflin Park', 'hkelleya0@bloglovin.com', 'hkelleya0', 'YYCcoH9kj');
INSERT INTO usuario VALUES (362, 'Doris Howard', '3 Golden Leaf Trail', 'dhowarda1@arizona.edu', 'dhowarda1', 'mPpKvAM2E');
INSERT INTO usuario VALUES (363, 'Daniel Riley', '8499 Dahle Road', 'drileya2@constantcontact.com', 'drileya2', '3mRt8qg');
INSERT INTO usuario VALUES (364, 'Carl Hicks', '03 Kedzie Drive', 'chicksa3@scientificamerican.com', 'chicksa3', 'JuQjsaU');
INSERT INTO usuario VALUES (365, 'Gerald Banks', '8620 Meadow Ridge Hill', 'gbanksa4@gov.uk', 'gbanksa4', 'PeCrt5kre0');
INSERT INTO usuario VALUES (366, 'Brian Mcdonald', '6169 Oneill Park', 'bmcdonalda5@shinystat.com', 'bmcdonalda5', 'NH3Fwahawdgq');
INSERT INTO usuario VALUES (367, 'James Snyder', '580 Bunker Hill Parkway', 'jsnydera6@vistaprint.com', 'jsnydera6', 'ONsvNvb');
INSERT INTO usuario VALUES (368, 'Alice Ramirez', '0 Walton Junction', 'aramireza7@booking.com', 'aramireza7', 'rMNCLUuLM');
INSERT INTO usuario VALUES (369, 'Marilyn Garza', '90 Badeau Court', 'mgarzaa8@theguardian.com', 'mgarzaa8', 'oG3wQfTyp0');
INSERT INTO usuario VALUES (370, 'Frank Hawkins', '97 Bashford Alley', 'fhawkinsa9@printfriendly.com', 'fhawkinsa9', 'O684Defk4');
INSERT INTO usuario VALUES (371, 'Joseph Olson', '6152 Amoth Alley', 'jolsonaa@vimeo.com', 'jolsonaa', 'oyvZcRu');
INSERT INTO usuario VALUES (372, 'Harold Larson', '0185 Susan Drive', 'hlarsonab@huffingtonpost.com', 'hlarsonab', 'E8LeQTbWpYX');
INSERT INTO usuario VALUES (373, 'Janice Wright', '25674 Arapahoe Court', 'jwrightac@sourceforge.net', 'jwrightac', 'O6RKkv3Z0');
INSERT INTO usuario VALUES (374, 'Jane Kelley', '8 Raven Point', 'jkelleyad@unicef.org', 'jkelleyad', '1PK06rvrj');
INSERT INTO usuario VALUES (375, 'Phyllis Fisher', '58 Reindahl Circle', 'pfisherae@japanpost.jp', 'pfisherae', 'ZfDiwCP');
INSERT INTO usuario VALUES (376, 'Brenda Sanders', '4395 High Crossing Street', 'bsandersaf@smh.com.au', 'bsandersaf', 'pbH8iXVgtYG');
INSERT INTO usuario VALUES (377, 'Angela Mitchell', '96512 Haas Plaza', 'amitchellag@nature.com', 'amitchellag', 'b6zTYbNS');
INSERT INTO usuario VALUES (378, 'Marilyn Gibson', '85 Armistice Circle', 'mgibsonah@soup.io', 'mgibsonah', 'dqzmJljl');
INSERT INTO usuario VALUES (379, 'Jane Jenkins', '950 Anzinger Street', 'jjenkinsai@altervista.org', 'jjenkinsai', 'UAI5SAd82oJm');
INSERT INTO usuario VALUES (380, 'Mark Young', '54991 Prentice Parkway', 'myoungaj@msu.edu', 'myoungaj', '4r87cjliZkXi');
INSERT INTO usuario VALUES (381, 'Robert Day', '52 Dennis Way', 'rdayak@craigslist.org', 'rdayak', 'CO0Tt9IRho');
INSERT INTO usuario VALUES (382, 'Jack Perez', '36 Karstens Center', 'jperezal@hp.com', 'jperezal', '2AyILZ');
INSERT INTO usuario VALUES (383, 'Sara Burns', '60 Old Shore Parkway', 'sburnsam@storify.com', 'sburnsam', 'RXQG6V20T');
INSERT INTO usuario VALUES (384, 'Antonio Sullivan', '9 Kedzie Parkway', 'asullivanan@bloglovin.com', 'asullivanan', 'Q4x7VDfi');
INSERT INTO usuario VALUES (385, 'Diane Schmidt', '89962 Manufacturers Parkway', 'dschmidtao@e-recht24.de', 'dschmidtao', 'bkdxPZ');
INSERT INTO usuario VALUES (386, 'Larry Hayes', '1313 Farragut Point', 'lhayesap@addthis.com', 'lhayesap', 'Jf3WOo');
INSERT INTO usuario VALUES (387, 'Gloria Wells', '88 Kim Avenue', 'gwellsaq@123-reg.co.uk', 'gwellsaq', 'SPlOdvI1IW');
INSERT INTO usuario VALUES (388, 'Martha Burns', '05 Quincy Street', 'mburnsar@dropbox.com', 'mburnsar', 'gB0bdxxVbz');
INSERT INTO usuario VALUES (389, 'Billy Woods', '33 Moose Place', 'bwoodsas@twitpic.com', 'bwoodsas', 'Awy5fzb');
INSERT INTO usuario VALUES (390, 'Stephen Banks', '114 Utah Center', 'sbanksat@blogs.com', 'sbanksat', 'fO6wFXdZ');
INSERT INTO usuario VALUES (391, 'Albert Rice', '9 Lerdahl Circle', 'ariceau@umich.edu', 'ariceau', 'd5g86Py6XU');
INSERT INTO usuario VALUES (392, 'Harold Tucker', '8406 Bartillon Trail', 'htuckerav@google.it', 'htuckerav', 'sJPVFj2');
INSERT INTO usuario VALUES (393, 'Bruce Howard', '5 Crest Line Hill', 'bhowardaw@utexas.edu', 'bhowardaw', 'PUFljHGEcW');
INSERT INTO usuario VALUES (394, 'Helen Fields', '127 Transport Point', 'hfieldsax@i2i.jp', 'hfieldsax', 'tvIsDtX5');
INSERT INTO usuario VALUES (395, 'Alice Anderson', '849 Green Trail', 'aandersonay@mit.edu', 'aandersonay', 'IjXrhSel');
INSERT INTO usuario VALUES (396, 'Ronald Price', '206 Del Sol Avenue', 'rpriceaz@techcrunch.com', 'rpriceaz', 'RBgY6Oqwu');
INSERT INTO usuario VALUES (397, 'Sandra Morris', '4 Brickson Park Parkway', 'smorrisb0@wikia.com', 'smorrisb0', '2rNJnPvz2goF');
INSERT INTO usuario VALUES (398, 'Rachel Rodriguez', '95 Eastlawn Park', 'rrodriguezb1@ucsd.edu', 'rrodriguezb1', 'MMraFxA7ly');
INSERT INTO usuario VALUES (399, 'Carlos Castillo', '1506 Grasskamp Lane', 'ccastillob2@godaddy.com', 'ccastillob2', 'DiJtnEH');
INSERT INTO usuario VALUES (400, 'Andrea Crawford', '3 Longview Drive', 'acrawfordb3@ow.ly', 'acrawfordb3', '70f0kDj');
INSERT INTO usuario VALUES (401, 'Phillip Lane', '14 Huxley Park', 'planeb4@stumbleupon.com', 'planeb4', 'Ino7sacJ');
INSERT INTO usuario VALUES (402, 'Billy Castillo', '15 Eastlawn Way', 'bcastillob5@sciencedaily.com', 'bcastillob5', '0d8ge8uLu9Zj');
INSERT INTO usuario VALUES (403, 'Robert Berry', '8 Hovde Avenue', 'rberryb6@spotify.com', 'rberryb6', '6wZ2Pka');
INSERT INTO usuario VALUES (404, 'Patricia Wallace', '586 Hanover Circle', 'pwallaceb7@yale.edu', 'pwallaceb7', 'odcd3uZhbUnn');
INSERT INTO usuario VALUES (405, 'Timothy Olson', '23 Kingsford Way', 'tolsonb8@soundcloud.com', 'tolsonb8', '5GhUABy4TVK');
INSERT INTO usuario VALUES (406, 'Robin Hernandez', '4 Dryden Alley', 'rhernandezb9@state.tx.us', 'rhernandezb9', 'rMiCLH5bD');
INSERT INTO usuario VALUES (407, 'Joshua Cooper', '2791 Rockefeller Plaza', 'jcooperba@psu.edu', 'jcooperba', '1E1smFMu');
INSERT INTO usuario VALUES (408, 'Doris Rogers', '92 Ilene Drive', 'drogersbb@unicef.org', 'drogersbb', 'SQsmXJyazaF');
INSERT INTO usuario VALUES (409, 'Janice Woods', '9 Utah Place', 'jwoodsbc@blogs.com', 'jwoodsbc', 'WfL7aP4DTcC');
INSERT INTO usuario VALUES (410, 'Benjamin Kennedy', '4599 Kipling Plaza', 'bkennedybd@state.tx.us', 'bkennedybd', 'AXmTA3yJNr');
INSERT INTO usuario VALUES (411, 'Thomas Ramirez', '766 Caliangt Court', 'tramirezbe@shop-pro.jp', 'tramirezbe', 't4v6C4Yzcy2');
INSERT INTO usuario VALUES (412, 'Rachel Lee', '15 Coolidge Crossing', 'rleebf@addthis.com', 'rleebf', 'exb7Daj8H5S');
INSERT INTO usuario VALUES (413, 'Joyce Griffin', '25256 Lunder Center', 'jgriffinbg@tinyurl.com', 'jgriffinbg', 'tHf4H8');
INSERT INTO usuario VALUES (414, 'Benjamin Tucker', '8 Rigney Hill', 'btuckerbh@amazon.de', 'btuckerbh', 'EUNWs1py2dTx');
INSERT INTO usuario VALUES (415, 'Cheryl Fernandez', '43 Dayton Drive', 'cfernandezbi@webnode.com', 'cfernandezbi', 'LwHaCKmBla');
INSERT INTO usuario VALUES (416, 'Adam Russell', '97492 Browning Park', 'arussellbj@etsy.com', 'arussellbj', 'DDvhBRUPKV');
INSERT INTO usuario VALUES (417, 'Clarence Williamson', '75521 Kipling Trail', 'cwilliamsonbk@freewebs.com', 'cwilliamsonbk', 'fxiIbTw2if93');
INSERT INTO usuario VALUES (418, 'Kenneth Mccoy', '2295 Brentwood Circle', 'kmccoybl@wisc.edu', 'kmccoybl', 'BRrDjakE4v');
INSERT INTO usuario VALUES (419, 'Shawn Stanley', '81 Gulseth Street', 'sstanleybm@networkadvertising.org', 'sstanleybm', 'hCXwTA');
INSERT INTO usuario VALUES (420, 'Antonio Reyes', '70474 Eastwood Parkway', 'areyesbn@bandcamp.com', 'areyesbn', 'AHRHvW3');
INSERT INTO usuario VALUES (421, 'Walter Armstrong', '50 Tomscot Circle', 'warmstrongbo@51.la', 'warmstrongbo', 'Qj3PRR');
INSERT INTO usuario VALUES (422, 'Janice Hanson', '1522 Jenifer Parkway', 'jhansonbp@freewebs.com', 'jhansonbp', '8F96RZ');
INSERT INTO usuario VALUES (423, 'Larry Ross', '7845 Dryden Circle', 'lrossbq@senate.gov', 'lrossbq', 'KOg4LUs');
INSERT INTO usuario VALUES (424, 'Ralph George', '5377 Service Hill', 'rgeorgebr@cbc.ca', 'rgeorgebr', 'URr1SJ');
INSERT INTO usuario VALUES (425, 'Rose Sanders', '5321 Clove Lane', 'rsandersbs@google.com.br', 'rsandersbs', 'KhjofE');
INSERT INTO usuario VALUES (426, 'Mary Burton', '741 Center Trail', 'mburtonbt@dion.ne.jp', 'mburtonbt', 'fIJ58ou9W8W');
INSERT INTO usuario VALUES (427, 'Benjamin Davis', '1 Pond Circle', 'bdavisbu@craigslist.org', 'bdavisbu', 'HC5TJCUxR');
INSERT INTO usuario VALUES (428, 'Betty Mendoza', '73 Lukken Parkway', 'bmendozabv@creativecommons.org', 'bmendozabv', 'Y9IyI2E1wI');
INSERT INTO usuario VALUES (429, 'Joan Armstrong', '7 Forster Junction', 'jarmstrongbw@theglobeandmail.com', 'jarmstrongbw', 'v3yGSO8Uqt9');
INSERT INTO usuario VALUES (430, 'Karen Fernandez', '367 Green Ridge Park', 'kfernandezbx@t.co', 'kfernandezbx', 'rBNrXEu');
INSERT INTO usuario VALUES (431, 'Steve Fernandez', '1 Bartillon Court', 'sfernandezby@time.com', 'sfernandezby', 'te4EKFeYpEFr');
INSERT INTO usuario VALUES (432, 'Ryan Graham', '88 Merry Point', 'rgrahambz@biblegateway.com', 'rgrahambz', 'r7iouFwUH');
INSERT INTO usuario VALUES (433, 'Dorothy Boyd', '134 Jana Street', 'dboydc0@msn.com', 'dboydc0', 'YuRYvV');
INSERT INTO usuario VALUES (434, 'Gary Campbell', '0 Muir Drive', 'gcampbellc1@reverbnation.com', 'gcampbellc1', 'HYFyWf');
INSERT INTO usuario VALUES (435, 'Sarah Cunningham', '27382 Continental Avenue', 'scunninghamc2@tamu.edu', 'scunninghamc2', 'MvOnpJq');
INSERT INTO usuario VALUES (436, 'Amanda Torres', '48 Union Circle', 'atorresc3@acquirethisname.com', 'atorresc3', 'prpSrGd');
INSERT INTO usuario VALUES (437, 'Shawn Hughes', '2 Debs Street', 'shughesc4@deliciousdays.com', 'shughesc4', 'yrf33Pbx3');
INSERT INTO usuario VALUES (438, 'Joshua Sanchez', '7 Kenwood Street', 'jsanchezc5@apple.com', 'jsanchezc5', 'ZMFWksRbkhx');
INSERT INTO usuario VALUES (439, 'Larry Freeman', '7 Morning Avenue', 'lfreemanc6@trellian.com', 'lfreemanc6', 'jZTMyjEm');
INSERT INTO usuario VALUES (440, 'Janice Murphy', '2 Sundown Place', 'jmurphyc7@hhs.gov', 'jmurphyc7', 'V48udtOfm');
INSERT INTO usuario VALUES (441, 'Jason Gibson', '4792 Eastlawn Junction', 'jgibsonc8@ucla.edu', 'jgibsonc8', 'OUns41LJ5h');
INSERT INTO usuario VALUES (442, 'John Larson', '62 Autumn Leaf Alley', 'jlarsonc9@fastcompany.com', 'jlarsonc9', '5bRvkW');
INSERT INTO usuario VALUES (443, 'Christopher Flores', '2 Doe Crossing Park', 'cfloresca@slashdot.org', 'cfloresca', '1vfY0latH7rn');
INSERT INTO usuario VALUES (444, 'Jesse Tucker', '117 Welch Circle', 'jtuckercb@va.gov', 'jtuckercb', 'Dmh9b80Lv7nl');
INSERT INTO usuario VALUES (445, 'Shirley Weaver', '049 Vahlen Hill', 'sweavercc@nsw.gov.au', 'sweavercc', 'Pb9IgB90');
INSERT INTO usuario VALUES (446, 'Craig Ortiz', '50 Haas Circle', 'cortizcd@youtube.com', 'cortizcd', 'lA0zuYxZqFqJ');
INSERT INTO usuario VALUES (447, 'Nicole Phillips', '492 Onsgard Circle', 'nphillipsce@paginegialle.it', 'nphillipsce', 'QciWzIF');
INSERT INTO usuario VALUES (448, 'Rose Wright', '8 Commercial Way', 'rwrightcf@apache.org', 'rwrightcf', 'femA2B7FsP');
INSERT INTO usuario VALUES (449, 'Sandra West', '9115 North Way', 'swestcg@comsenz.com', 'swestcg', '8cK1ZQ0l');
INSERT INTO usuario VALUES (450, 'Nicole Torres', '88 Evergreen Parkway', 'ntorresch@bigcartel.com', 'ntorresch', 'nwGFlzb3');
INSERT INTO usuario VALUES (451, 'Andrea Rodriguez', '679 Porter Lane', 'arodriguezci@lycos.com', 'arodriguezci', '3xHsxfBJ1PdQ');
INSERT INTO usuario VALUES (452, 'Alice Griffin', '19013 Norway Maple Trail', 'agriffincj@ihg.com', 'agriffincj', 'L1nX8K65Yg');
INSERT INTO usuario VALUES (453, 'Jack Collins', '55815 Blue Bill Park Crossing', 'jcollinsck@tmall.com', 'jcollinsck', 'jrD8PN4eq');
INSERT INTO usuario VALUES (454, 'Betty Lopez', '5275 Columbus Trail', 'blopezcl@cnbc.com', 'blopezcl', 'ykvpgJTOyl');
INSERT INTO usuario VALUES (455, 'William Washington', '088 Muir Place', 'wwashingtoncm@sohu.com', 'wwashingtoncm', '90mzI8GY');
INSERT INTO usuario VALUES (456, 'Jason Fernandez', '06609 Sachs Plaza', 'jfernandezcn@fastcompany.com', 'jfernandezcn', 'EJklhlEwU');
INSERT INTO usuario VALUES (457, 'Patrick Lawson', '507 Blaine Avenue', 'plawsonco@tumblr.com', 'plawsonco', 'aaywoTpU1N');
INSERT INTO usuario VALUES (458, 'Michael Ryan', '2793 Bashford Park', 'mryancp@hhs.gov', 'mryancp', 'aqfsbJ');
INSERT INTO usuario VALUES (459, 'Kenneth Johnson', '6479 Ridgeview Trail', 'kjohnsoncq@sourceforge.net', 'kjohnsoncq', '7LLCVIOQk');
INSERT INTO usuario VALUES (460, 'Katherine Fuller', '633 Lindbergh Crossing', 'kfullercr@ucoz.com', 'kfullercr', 'IjeVzqnAD');
INSERT INTO usuario VALUES (461, 'Betty Nichols', '8988 Grover Center', 'bnicholscs@jimdo.com', 'bnicholscs', 'btYdOCq');
INSERT INTO usuario VALUES (462, 'Irene Vasquez', '8249 Roxbury Lane', 'ivasquezct@reddit.com', 'ivasquezct', 'LmxMe7HfIy');
INSERT INTO usuario VALUES (463, 'Nicholas Patterson', '086 Gerald Point', 'npattersoncu@mit.edu', 'npattersoncu', 'cBc76C');
INSERT INTO usuario VALUES (464, 'Roger Smith', '50 Rigney Pass', 'rsmithcv@privacy.gov.au', 'rsmithcv', 'xRYvUhQh');
INSERT INTO usuario VALUES (465, 'Earl Moore', '80 Boyd Alley', 'emoorecw@eepurl.com', 'emoorecw', 'SEFrZnzmn7I');
INSERT INTO usuario VALUES (466, 'Judy Brooks', '2981 Fisk Pass', 'jbrookscx@google.co.jp', 'jbrookscx', 'rwpnAh');
INSERT INTO usuario VALUES (467, 'Frances Robertson', '274 Kennedy Park', 'frobertsoncy@woothemes.com', 'frobertsoncy', 'Ik7tz0fWDjT');
INSERT INTO usuario VALUES (468, 'Roy Barnes', '75 Iowa Park', 'rbarnescz@cafepress.com', 'rbarnescz', 'fXtinXrwCLe6');
INSERT INTO usuario VALUES (469, 'Robin Elliott', '298 Maple Crossing', 'relliottd0@bigcartel.com', 'relliottd0', 'huBIieLrL7N');
INSERT INTO usuario VALUES (470, 'Chris Elliott', '63 Park Meadow Parkway', 'celliottd1@ibm.com', 'celliottd1', 'sa4HKTApKwmZ');
INSERT INTO usuario VALUES (471, 'Sandra Elliott', '4532 Magdeline Point', 'selliottd2@about.me', 'selliottd2', 'p18b10');
INSERT INTO usuario VALUES (472, 'Bobby Elliott', '933 Boyd Alley', 'belliottd3@devhub.com', 'belliottd3', 'Snm339');
INSERT INTO usuario VALUES (473, 'Diane Gutierrez', '04730 Twin Pines Lane', 'dgutierrezd4@e-recht24.de', 'dgutierrezd4', '0atrVaAjnIc');
INSERT INTO usuario VALUES (474, 'Douglas Johnston', '5 Helena Avenue', 'djohnstond5@stanford.edu', 'djohnstond5', 'ILSaBF');
INSERT INTO usuario VALUES (475, 'Catherine Matthews', '8 Eastlawn Pass', 'cmatthewsd6@taobao.com', 'cmatthewsd6', 'tBkz5U2nICi');
INSERT INTO usuario VALUES (476, 'Steven Moore', '05 Trailsway Plaza', 'smoored7@miitbeian.gov.cn', 'smoored7', 'Gn8Y3XBe');
INSERT INTO usuario VALUES (477, 'Louise Bell', '98057 Fuller Terrace', 'lbelld8@irs.gov', 'lbelld8', '8bqxg3');
INSERT INTO usuario VALUES (478, 'Elizabeth Miller', '8954 Shopko Trail', 'emillerd9@oracle.com', 'emillerd9', '6emLXC6SX');
INSERT INTO usuario VALUES (479, 'Lois Holmes', '8683 Lawn Court', 'lholmesda@auda.org.au', 'lholmesda', 'vhXpt1jInWky');
INSERT INTO usuario VALUES (480, 'Sara Frazier', '26 Warbler Parkway', 'sfrazierdb@g.co', 'sfrazierdb', 'Zo96uMIn');
INSERT INTO usuario VALUES (481, 'Julia Snyder', '78258 Hintze Place', 'jsnyderdc@flavors.me', 'jsnyderdc', 'NcF6iNHD6ywJ');
INSERT INTO usuario VALUES (482, 'Judith Gray', '257 Forest Dale Circle', 'jgraydd@hostgator.com', 'jgraydd', '9OlRHe');
INSERT INTO usuario VALUES (483, 'Ann Turner', '3 Red Cloud Alley', 'aturnerde@bloglines.com', 'aturnerde', 'IUscuJLppCiT');
INSERT INTO usuario VALUES (484, 'Kathryn Austin', '1043 Anzinger Trail', 'kaustindf@cnet.com', 'kaustindf', 'GeMISuOAV');
INSERT INTO usuario VALUES (485, 'Eugene Reed', '4041 Welch Circle', 'ereeddg@google.com', 'ereeddg', 'eCqawk7');
INSERT INTO usuario VALUES (486, 'Bonnie Bowman', '647 Russell Drive', 'bbowmandh@si.edu', 'bbowmandh', 'Egb2bbed');
INSERT INTO usuario VALUES (487, 'Kelly Wheeler', '471 Forster Point', 'kwheelerdi@wikia.com', 'kwheelerdi', 'ST2oEM1U');
INSERT INTO usuario VALUES (488, 'Betty Ferguson', '4 Ramsey Plaza', 'bfergusondj@twitpic.com', 'bfergusondj', 'MgLjnF');
INSERT INTO usuario VALUES (489, 'Alan Tucker', '8517 Golden Leaf Plaza', 'atuckerdk@google.com.br', 'atuckerdk', 'tYyMQ0h');
INSERT INTO usuario VALUES (490, 'Phillip Gonzales', '74839 Heath Park', 'pgonzalesdl@boston.com', 'pgonzalesdl', 'kJbXqOB5E');
INSERT INTO usuario VALUES (491, 'Kenneth Cole', '5 Colorado Crossing', 'kcoledm@auda.org.au', 'kcoledm', 'A7XLqT');
INSERT INTO usuario VALUES (492, 'Teresa Gibson', '52722 Pearson Park', 'tgibsondn@hp.com', 'tgibsondn', '55sCKh');
INSERT INTO usuario VALUES (493, 'Larry Ferguson', '6 Old Shore Plaza', 'lfergusondo@oracle.com', 'lfergusondo', '16XP3N');
INSERT INTO usuario VALUES (494, 'Nicholas Robertson', '1 Goodland Trail', 'nrobertsondp@cmu.edu', 'nrobertsondp', 'IORhuC27');
INSERT INTO usuario VALUES (495, 'Chris Ford', '15 Dakota Parkway', 'cforddq@mozilla.org', 'cforddq', 'd1UXDa');
INSERT INTO usuario VALUES (496, 'William White', '12 Nevada Trail', 'wwhitedr@gravatar.com', 'wwhitedr', 'WEInIiWc');
INSERT INTO usuario VALUES (497, 'Randy Wells', '86 Dexter Circle', 'rwellsds@de.vu', 'rwellsds', 'kFTVLYRD418');
INSERT INTO usuario VALUES (498, 'Lori Shaw', '143 Lakewood Gardens Pass', 'lshawdt@live.com', 'lshawdt', 'aD7E6Rj9');
INSERT INTO usuario VALUES (499, 'William Medina', '3 Oak Alley', 'wmedinadu@mac.com', 'wmedinadu', 'RZrWJeLue2oC');
INSERT INTO usuario VALUES (500, 'Christine Bennett', '92906 Petterle Trail', 'cbennettdv@yahoo.com', 'cbennettdv', 'uiektM');
INSERT INTO usuario VALUES (501, 'Rebecca Gutierrez', '53 Melrose Crossing', 'rgutierrezdw@skyrock.com', 'rgutierrezdw', 'nomL6QK');
INSERT INTO usuario VALUES (502, 'Karen Wilson', '67687 Jana Center', 'kwilsondx@unesco.org', 'kwilsondx', 'bI3Fn3RM6');
INSERT INTO usuario VALUES (503, 'Patrick Burton', '70467 Truax Plaza', 'pburtondy@storify.com', 'pburtondy', 'SaOOX0xdZd');
INSERT INTO usuario VALUES (504, 'Willie Ortiz', '429 Rieder Park', 'wortizdz@friendfeed.com', 'wortizdz', 'piCTO4WSj');
INSERT INTO usuario VALUES (505, 'Cheryl Baker', '4390 Northview Parkway', 'cbakere0@issuu.com', 'cbakere0', 'gg8i9n8uNvOa');
INSERT INTO usuario VALUES (506, 'Katherine Rogers', '48 Macpherson Avenue', 'krogerse1@elegantthemes.com', 'krogerse1', 'YewB47rMcql');
INSERT INTO usuario VALUES (507, 'Stephen Bailey', '9 Nobel Pass', 'sbaileye2@liveinternet.ru', 'sbaileye2', '51qgLWA');
INSERT INTO usuario VALUES (508, 'James Banks', '6392 Talisman Center', 'jbankse3@feedburner.com', 'jbankse3', 'ajP6I8N4Gr5N');
INSERT INTO usuario VALUES (509, 'Lori Hunt', '75 Lien Park', 'lhunte4@whitehouse.gov', 'lhunte4', 'GN4YgUvIXt5j');
INSERT INTO usuario VALUES (510, 'Frank Alexander', '4 Kedzie Hill', 'falexandere5@jiathis.com', 'falexandere5', 'Red1b74N');
INSERT INTO usuario VALUES (511, 'Bobby Patterson', '78 Melby Avenue', 'bpattersone6@jalbum.net', 'bpattersone6', 'pHoCoZ0WU');
INSERT INTO usuario VALUES (512, 'Ashley Owens', '05 Eliot Parkway', 'aowense7@rambler.ru', 'aowense7', '0DRWqKRzB');
INSERT INTO usuario VALUES (513, 'Terry Carroll', '66699 Eagan Avenue', 'tcarrolle8@home.pl', 'tcarrolle8', 'AXnMuJug');
INSERT INTO usuario VALUES (514, 'Nancy Marshall', '70809 Elmside Court', 'nmarshalle9@creativecommons.org', 'nmarshalle9', 'uxr5WrRNMkL');
INSERT INTO usuario VALUES (515, 'Alan Wilson', '69 Carioca Center', 'awilsonea@walmart.com', 'awilsonea', 'DzK9wzhnsiiD');
INSERT INTO usuario VALUES (516, 'Shirley Flores', '4 Schlimgen Pass', 'sfloreseb@mayoclinic.com', 'sfloreseb', '0iUzRYv');
INSERT INTO usuario VALUES (517, 'Elizabeth Kennedy', '83 Pleasure Park', 'ekennedyec@epa.gov', 'ekennedyec', 'qarjxiNJ');
INSERT INTO usuario VALUES (518, 'Justin Jacobs', '67 Coolidge Point', 'jjacobsed@foxnews.com', 'jjacobsed', '2fKf8LFD0Ou');
INSERT INTO usuario VALUES (519, 'Aaron Kelley', '13 Myrtle Way', 'akelleyee@toplist.cz', 'akelleyee', 'qOSgqD');
INSERT INTO usuario VALUES (520, 'Brian Kennedy', '6 Bluestem Circle', 'bkennedyef@homestead.com', 'bkennedyef', 'x1R3FCkimW');
INSERT INTO usuario VALUES (521, 'Edward Stanley', '6 Monica Avenue', 'estanleyeg@rambler.ru', 'estanleyeg', 'MtubctZI');
INSERT INTO usuario VALUES (522, 'Elizabeth Franklin', '585 Golden Leaf Avenue', 'efranklineh@cafepress.com', 'efranklineh', 'fLL3iMg1');
INSERT INTO usuario VALUES (523, 'Amanda Wagner', '6680 Heffernan Point', 'awagnerei@friendfeed.com', 'awagnerei', 'wX3M6H4p2m');
INSERT INTO usuario VALUES (524, 'Rebecca Clark', '8943 Loeprich Avenue', 'rclarkej@va.gov', 'rclarkej', 'VeZ2FlA');
INSERT INTO usuario VALUES (525, 'Tina Johnson', '4266 Nancy Center', 'tjohnsonek@mapy.cz', 'tjohnsonek', 'jgTPWKTn');
INSERT INTO usuario VALUES (526, 'Ruth Medina', '28342 Hagan Park', 'rmedinael@sun.com', 'rmedinael', '1Z4i4N');
INSERT INTO usuario VALUES (527, 'Karen Johnston', '4561 Hermina Circle', 'kjohnstonem@archive.org', 'kjohnstonem', 'NLKnas');
INSERT INTO usuario VALUES (528, 'Justin Carpenter', '9 Hansons Court', 'jcarpenteren@wordpress.com', 'jcarpenteren', 'qmJikxT8');
INSERT INTO usuario VALUES (529, 'Betty Frazier', '8855 Knutson Alley', 'bfraziereo@europa.eu', 'bfraziereo', '8WpbRQwoIp');
INSERT INTO usuario VALUES (530, 'Nicole Jackson', '3623 Birchwood Lane', 'njacksonep@yolasite.com', 'njacksonep', 'gTWe7H33Uk');
INSERT INTO usuario VALUES (531, 'Jacqueline Riley', '3240 Roth Alley', 'jrileyeq@altervista.org', 'jrileyeq', 'RDjrY0D');
INSERT INTO usuario VALUES (532, 'Jeffrey Daniels', '4979 Utah Avenue', 'jdanielser@ehow.com', 'jdanielser', '68RfWRnnbLP');
INSERT INTO usuario VALUES (533, 'Catherine Coleman', '53681 Crest Line Trail', 'ccolemanes@qq.com', 'ccolemanes', 'WH3ID6Nsa');
INSERT INTO usuario VALUES (534, 'Howard Riley', '064 Scofield Road', 'hrileyet@printfriendly.com', 'hrileyet', 'L4boBwY');
INSERT INTO usuario VALUES (535, 'Jean Morales', '1 La Follette Road', 'jmoraleseu@whitehouse.gov', 'jmoraleseu', 'Ksp1ny5q');
INSERT INTO usuario VALUES (536, 'Louis Mendoza', '044 Briar Crest Terrace', 'lmendozaev@phoca.cz', 'lmendozaev', 'bbnnS4o2NNHj');
INSERT INTO usuario VALUES (537, 'Charles Sullivan', '1799 Clarendon Street', 'csullivanew@ucoz.com', 'csullivanew', 'mYVvBfYOP60i');
INSERT INTO usuario VALUES (538, 'Brenda Rodriguez', '78649 Ryan Court', 'brodriguezex@gmpg.org', 'brodriguezex', 'szavhlg00');
INSERT INTO usuario VALUES (539, 'Phillip Turner', '1071 Sycamore Terrace', 'pturnerey@usda.gov', 'pturnerey', 'pm4pwJry1T');
INSERT INTO usuario VALUES (540, 'Steven Perry', '3060 Jenna Terrace', 'sperryez@nydailynews.com', 'sperryez', 'JdiZmy5');
INSERT INTO usuario VALUES (541, 'Thomas Bell', '00 Columbus Court', 'tbellf0@fc2.com', 'tbellf0', 'huD8OQFV2');
INSERT INTO usuario VALUES (542, 'Norma Romero', '59 Warner Circle', 'nromerof1@facebook.com', 'nromerof1', 'bR5kydBEIsbd');
INSERT INTO usuario VALUES (543, 'Steve Smith', '754 Old Shore Crossing', 'ssmithf2@wikispaces.com', 'ssmithf2', 'OIqT3zmOmWH');
INSERT INTO usuario VALUES (544, 'Barbara Morgan', '740 Rowland Terrace', 'bmorganf3@blogspot.com', 'bmorganf3', 'HBVPT04JR3P');
INSERT INTO usuario VALUES (545, 'Louis Welch', '09495 Anthes Junction', 'lwelchf4@shutterfly.com', 'lwelchf4', 'SMN2vjk');
INSERT INTO usuario VALUES (546, 'Annie Wallace', '7 Heath Center', 'awallacef5@indiegogo.com', 'awallacef5', 'UevhyYoT');
INSERT INTO usuario VALUES (547, 'Victor Wood', '48 Arapahoe Lane', 'vwoodf6@ebay.co.uk', 'vwoodf6', 'S3BbHWv');
INSERT INTO usuario VALUES (548, 'Helen Jackson', '7590 Jay Park', 'hjacksonf7@bloglines.com', 'hjacksonf7', 'hOi8x4');
INSERT INTO usuario VALUES (549, 'Christina Nichols', '2422 Cardinal Pass', 'cnicholsf8@oakley.com', 'cnicholsf8', 'yLU5tiXO3HUt');
INSERT INTO usuario VALUES (550, 'Jesse Olson', '578 Buhler Street', 'jolsonf9@nih.gov', 'jolsonf9', 'JWS3bTUVP');
INSERT INTO usuario VALUES (551, 'Jack Henry', '0 Oxford Road', 'jhenryfa@scientificamerican.com', 'jhenryfa', 'A8PaPmJXFr');
INSERT INTO usuario VALUES (552, 'Debra Mccoy', '447 Sauthoff Hill', 'dmccoyfb@mapquest.com', 'dmccoyfb', 'XhvapQ');
INSERT INTO usuario VALUES (553, 'Aaron Stone', '47 Summit Park', 'astonefc@tmall.com', 'astonefc', 'xfDbPN3Vm');
INSERT INTO usuario VALUES (554, 'Ernest Hughes', '19 Ilene Pass', 'ehughesfd@nasa.gov', 'ehughesfd', 'qYpLRIf1');
INSERT INTO usuario VALUES (555, 'Arthur Kim', '35 American Ash Way', 'akimfe@rambler.ru', 'akimfe', 'vuH37JDiYh');
INSERT INTO usuario VALUES (556, 'Christina Black', '72 Bowman Junction', 'cblackff@digg.com', 'cblackff', 'lsa2pyOT');
INSERT INTO usuario VALUES (557, 'Antonio Hansen', '7139 Jana Alley', 'ahansenfg@amazon.co.jp', 'ahansenfg', 'lGiHekTz7');
INSERT INTO usuario VALUES (558, 'Jane Sims', '47153 Prairieview Junction', 'jsimsfh@blogger.com', 'jsimsfh', 'zVyeQxHNkV');
INSERT INTO usuario VALUES (559, 'Jimmy James', '8448 Memorial Junction', 'jjamesfi@youtube.com', 'jjamesfi', 'G023d9');
INSERT INTO usuario VALUES (560, 'Kenneth Bennett', '756 East Plaza', 'kbennettfj@un.org', 'kbennettfj', 'ayxFbQ7igS4i');
INSERT INTO usuario VALUES (561, 'Sean Ramirez', '0 Summerview Park', 'sramirezfk@bing.com', 'sramirezfk', 'OyPqxK8vku');
INSERT INTO usuario VALUES (562, 'Donna Ryan', '69355 Brentwood Plaza', 'dryanfl@ft.com', 'dryanfl', 'eGGgpGc7MTb');
INSERT INTO usuario VALUES (563, 'Randy Phillips', '47899 Westport Avenue', 'rphillipsfm@smugmug.com', 'rphillipsfm', 'Oyw30Hh');
INSERT INTO usuario VALUES (564, 'Edward Foster', '193 Tony Crossing', 'efosterfn@etsy.com', 'efosterfn', 'aFXK8H');
INSERT INTO usuario VALUES (565, 'Amy Barnes', '0 Columbus Avenue', 'abarnesfo@who.int', 'abarnesfo', 'Gv8iLJ7QlsvU');
INSERT INTO usuario VALUES (566, 'Virginia Mendoza', '5086 Bellgrove Avenue', 'vmendozafp@ow.ly', 'vmendozafp', '07jYNUFYv');
INSERT INTO usuario VALUES (567, 'Jeremy Lee', '812 Bobwhite Junction', 'jleefq@cyberchimps.com', 'jleefq', '0Z6BWg98DEn');
INSERT INTO usuario VALUES (568, 'Jimmy Romero', '00 Di Loreto Road', 'jromerofr@senate.gov', 'jromerofr', 't9JksoMp3Qx');
INSERT INTO usuario VALUES (569, 'Sandra Robinson', '094 Texas Center', 'srobinsonfs@netvibes.com', 'srobinsonfs', '23JMPjO2Y');
INSERT INTO usuario VALUES (570, 'Willie Nguyen', '75188 Milwaukee Junction', 'wnguyenft@hao123.com', 'wnguyenft', 'GN6PcutU');
INSERT INTO usuario VALUES (571, 'Douglas Howard', '507 Corry Terrace', 'dhowardfu@nytimes.com', 'dhowardfu', 'GspbgT');
INSERT INTO usuario VALUES (572, 'Donna Price', '1787 Pearson Center', 'dpricefv@craigslist.org', 'dpricefv', 'EX8yUwm');
INSERT INTO usuario VALUES (573, 'Timothy Fuller', '6785 Trailsway Street', 'tfullerfw@reverbnation.com', 'tfullerfw', 'cFoDDc6');
INSERT INTO usuario VALUES (574, 'Deborah Welch', '5 Stone Corner Court', 'dwelchfx@imdb.com', 'dwelchfx', '54XsR5TTMXXT');
INSERT INTO usuario VALUES (575, 'Henry Hall', '78 Shoshone Crossing', 'hhallfy@biglobe.ne.jp', 'hhallfy', 'JhghctS');
INSERT INTO usuario VALUES (576, 'Anna Bryant', '7 South Circle', 'abryantfz@nydailynews.com', 'abryantfz', 'NVubiR');
INSERT INTO usuario VALUES (577, 'Christina Austin', '1548 Esch Plaza', 'causting0@webs.com', 'causting0', 'q6gPzY7Q');
INSERT INTO usuario VALUES (578, 'Sarah Meyer', '8 Oxford Junction', 'smeyerg1@drupal.org', 'smeyerg1', 'JYzdha');
INSERT INTO usuario VALUES (579, 'Ronald Berry', '14 Carioca Point', 'rberryg2@answers.com', 'rberryg2', 'Z2170emlp');
INSERT INTO usuario VALUES (580, 'Jane Gordon', '225 Division Road', 'jgordong3@auda.org.au', 'jgordong3', 'AvouV8b0V1E');
INSERT INTO usuario VALUES (581, 'Norma Parker', '2294 Linden Junction', 'nparkerg4@mozilla.com', 'nparkerg4', 'lIbeQZB9A');
INSERT INTO usuario VALUES (582, 'Virginia Armstrong', '3 Summer Ridge Parkway', 'varmstrongg5@gravatar.com', 'varmstrongg5', 'k9BfyMaYcph');
INSERT INTO usuario VALUES (583, 'Joan Knight', '5 Blaine Point', 'jknightg6@cargocollective.com', 'jknightg6', 'YqArqbs15i8');
INSERT INTO usuario VALUES (584, 'Michael Coleman', '56 7th Center', 'mcolemang7@angelfire.com', 'mcolemang7', 'zco7907q4');
INSERT INTO usuario VALUES (585, 'Cynthia Arnold', '47 Boyd Lane', 'carnoldg8@reference.com', 'carnoldg8', '0ee6z1I03');
INSERT INTO usuario VALUES (586, 'Joshua Thompson', '307 Anhalt Park', 'jthompsong9@jigsy.com', 'jthompsong9', 'Pelb46FhIU');
INSERT INTO usuario VALUES (587, 'Helen Perez', '28621 Fremont Park', 'hperezga@hp.com', 'hperezga', 'DLv7g8we');
INSERT INTO usuario VALUES (588, 'Janice Martinez', '1 4th Drive', 'jmartinezgb@homestead.com', 'jmartinezgb', 's2Tu0vl');
INSERT INTO usuario VALUES (589, 'Kathryn Ryan', '42 Walton Alley', 'kryangc@uol.com.br', 'kryangc', 'UKlJcVYLaS5R');
INSERT INTO usuario VALUES (590, 'Karen Howell', '78 Hooker Center', 'khowellgd@disqus.com', 'khowellgd', 'UDQI7bpRO');
INSERT INTO usuario VALUES (591, 'Tina Rogers', '98 La Follette Street', 'trogersge@devhub.com', 'trogersge', 'VGw852jwFKPM');
INSERT INTO usuario VALUES (592, 'Doris Clark', '8097 Arapahoe Point', 'dclarkgf@slate.com', 'dclarkgf', 'vsvOCX');
INSERT INTO usuario VALUES (593, 'Harold Spencer', '98 Pearson Parkway', 'hspencergg@illinois.edu', 'hspencergg', 'c4SI1H');
INSERT INTO usuario VALUES (594, 'Justin Burke', '640 East Junction', 'jburkegh@ask.com', 'jburkegh', 'Wa6wgwxeyj');
INSERT INTO usuario VALUES (595, 'Randy White', '9391 Almo Hill', 'rwhitegi@cnbc.com', 'rwhitegi', '6eHgmx2');
INSERT INTO usuario VALUES (596, 'Louis Burke', '90 Linden Avenue', 'lburkegj@networksolutions.com', 'lburkegj', 'nKUBzq');
INSERT INTO usuario VALUES (597, 'Christine Fields', '831 Old Shore Hill', 'cfieldsgk@opensource.org', 'cfieldsgk', '8KyhEGSleIv');
INSERT INTO usuario VALUES (598, 'Maria George', '0221 Clarendon Road', 'mgeorgegl@nyu.edu', 'mgeorgegl', 'SCE1NlBPCblP');
INSERT INTO usuario VALUES (599, 'Carl Garza', '576 Portage Pass', 'cgarzagm@google.com', 'cgarzagm', '8mp4we');
INSERT INTO usuario VALUES (600, 'Paula Gutierrez', '74263 Independence Terrace', 'pgutierrezgn@businessinsider.com', 'pgutierrezgn', 'Y5TbyG');
INSERT INTO usuario VALUES (601, 'Bruce Cooper', '85 Pankratz Plaza', 'bcoopergo@typepad.com', 'bcoopergo', 'jsC8x2P');
INSERT INTO usuario VALUES (602, 'Albert Berry', '84285 Memorial Lane', 'aberrygp@mayoclinic.com', 'aberrygp', 'k79ODb7');
INSERT INTO usuario VALUES (603, 'Victor Brooks', '45 Paget Circle', 'vbrooksgq@lycos.com', 'vbrooksgq', 'ZnufmvVe');
INSERT INTO usuario VALUES (604, 'Amanda Fisher', '8976 Upham Alley', 'afishergr@eventbrite.com', 'afishergr', '417QuB8jE6N');
INSERT INTO usuario VALUES (605, 'Susan Graham', '443 Carpenter Way', 'sgrahamgs@plala.or.jp', 'sgrahamgs', 'wDVCgb6s');
INSERT INTO usuario VALUES (606, 'Melissa Matthews', '52 Texas Pass', 'mmatthewsgt@tripadvisor.com', 'mmatthewsgt', 'lVfsI0p6G');
INSERT INTO usuario VALUES (607, 'Jonathan Richards', '4 Dayton Avenue', 'jrichardsgu@businessweek.com', 'jrichardsgu', 'MIS4JUd05P0');
INSERT INTO usuario VALUES (608, 'Gerald Stephens', '300 Lighthouse Bay Lane', 'gstephensgv@blogspot.com', 'gstephensgv', 'UMRi4wvyRj');
INSERT INTO usuario VALUES (609, 'Eugene Martinez', '979 Ruskin Way', 'emartinezgw@unesco.org', 'emartinezgw', 'ZexZBj5dmurR');
INSERT INTO usuario VALUES (610, 'Ronald Graham', '0 Westerfield Parkway', 'rgrahamgx@un.org', 'rgrahamgx', 'PerudMiA');
INSERT INTO usuario VALUES (611, 'Randy Vasquez', '36971 Calypso Park', 'rvasquezgy@pagesperso-orange.fr', 'rvasquezgy', 'AhNcsScOPn0');
INSERT INTO usuario VALUES (612, 'Phillip Alexander', '6391 Bartillon Junction', 'palexandergz@instagram.com', 'palexandergz', 'G62mtZXnwi');
INSERT INTO usuario VALUES (613, 'Daniel Rodriguez', '820 Pepper Wood Court', 'drodriguezh0@umich.edu', 'drodriguezh0', 'vjDv1LLdMuyL');
INSERT INTO usuario VALUES (614, 'Ryan Russell', '344 Mendota Place', 'rrussellh1@cmu.edu', 'rrussellh1', 'hmcWTydcBgyQ');
INSERT INTO usuario VALUES (615, 'Doris Jacobs', '880 Jenifer Court', 'djacobsh2@youtube.com', 'djacobsh2', 'ary71LEoGE');
INSERT INTO usuario VALUES (616, 'Ernest Edwards', '2804 Gateway Road', 'eedwardsh3@dagondesign.com', 'eedwardsh3', 'keLopl79');
INSERT INTO usuario VALUES (617, 'Aaron Oliver', '134 Grasskamp Court', 'aoliverh4@spiegel.de', 'aoliverh4', 'XpBeLivNfH');
INSERT INTO usuario VALUES (618, 'Amy Campbell', '135 Menomonie Crossing', 'acampbellh5@vkontakte.ru', 'acampbellh5', 'y8b7zTkwtK');
INSERT INTO usuario VALUES (619, 'Shirley Stanley', '2 Buhler Alley', 'sstanleyh6@hostgator.com', 'sstanleyh6', 'PSGk3jo8');
INSERT INTO usuario VALUES (620, 'Matthew Gibson', '4814 Lindbergh Parkway', 'mgibsonh7@chron.com', 'mgibsonh7', 'Kg8XPI90CMw');
INSERT INTO usuario VALUES (621, 'Philip Mason', '11 Hoffman Junction', 'pmasonh8@scribd.com', 'pmasonh8', 'pva3w1iLJ1A2');
INSERT INTO usuario VALUES (622, 'Lois Scott', '24876 Vera Street', 'lscotth9@ihg.com', 'lscotth9', 'Mow0sNPWN');
INSERT INTO usuario VALUES (623, 'Roy Hill', '4 Bay Street', 'rhillha@dailymotion.com', 'rhillha', 'hwQDFcCan3LZ');
INSERT INTO usuario VALUES (624, 'Barbara Morris', '52 Truax Hill', 'bmorrishb@blogtalkradio.com', 'bmorrishb', 'yb1AId');
INSERT INTO usuario VALUES (625, 'Jessica Brooks', '6725 Lakeland Park', 'jbrookshc@histats.com', 'jbrookshc', 'ifrK4guK');
INSERT INTO usuario VALUES (626, 'Kelly Moreno', '5 Calypso Junction', 'kmorenohd@eventbrite.com', 'kmorenohd', 'lTrKQl');
INSERT INTO usuario VALUES (627, 'Nicholas Tucker', '93088 Northwestern Road', 'ntuckerhe@t.co', 'ntuckerhe', 'hoYHH17rktVD');
INSERT INTO usuario VALUES (628, 'Bruce Bowman', '8092 Mcbride Alley', 'bbowmanhf@wired.com', 'bbowmanhf', 'gCYyRaYbAG5V');
INSERT INTO usuario VALUES (629, 'Shawn Little', '927 Florence Alley', 'slittlehg@redcross.org', 'slittlehg', '2XWtuD');
INSERT INTO usuario VALUES (630, 'Rose Anderson', '46457 Mesta Drive', 'randersonhh@foxnews.com', 'randersonhh', 'GX93yup');
INSERT INTO usuario VALUES (631, 'Maria Johnston', '35 Gerald Plaza', 'mjohnstonhi@topsy.com', 'mjohnstonhi', 'RSGthMV');
INSERT INTO usuario VALUES (632, 'Scott Cole', '00 Meadow Vale Place', 'scolehj@altervista.org', 'scolehj', 'vfh9ZaVksBOO');
INSERT INTO usuario VALUES (633, 'Walter Phillips', '2 Ohio Lane', 'wphillipshk@dailymotion.com', 'wphillipshk', 'aRjo11hpX1tL');
INSERT INTO usuario VALUES (634, 'Joshua Hughes', '29 Mariners Cove Alley', 'jhugheshl@blogspot.com', 'jhugheshl', '4qfEdhoMSf');
INSERT INTO usuario VALUES (635, 'Richard Harper', '63635 Starling Lane', 'rharperhm@blogspot.com', 'rharperhm', 'Lf1No6ifeV');
INSERT INTO usuario VALUES (636, 'Jonathan Alvarez', '837 Lyons Alley', 'jalvarezhn@ameblo.jp', 'jalvarezhn', 'W0H8c3dY0dI6');
INSERT INTO usuario VALUES (637, 'Steven Graham', '66 Blaine Road', 'sgrahamho@theatlantic.com', 'sgrahamho', 'vWVdv3s1');
INSERT INTO usuario VALUES (638, 'Sean Murray', '98 Stephen Drive', 'smurrayhp@rediff.com', 'smurrayhp', 'BW9xNY');
INSERT INTO usuario VALUES (639, 'Emily Williamson', '04789 Shasta Park', 'ewilliamsonhq@cargocollective.com', 'ewilliamsonhq', 'AOsy9YjN');
INSERT INTO usuario VALUES (640, 'Dorothy Perkins', '2 Gale Alley', 'dperkinshr@cdbaby.com', 'dperkinshr', 'bwl1T3a');
INSERT INTO usuario VALUES (641, 'Stephen Carr', '27 Orin Way', 'scarrhs@purevolume.com', 'scarrhs', '7eEzcd');
INSERT INTO usuario VALUES (642, 'Doris Cox', '37231 Utah Trail', 'dcoxht@loc.gov', 'dcoxht', '7uGBIH4WjgW');
INSERT INTO usuario VALUES (643, 'Scott Williams', '44 Montana Avenue', 'swilliamshu@soup.io', 'swilliamshu', 'Y3Sv1Ztl60');
INSERT INTO usuario VALUES (644, 'David Washington', '467 La Follette Parkway', 'dwashingtonhv@webmd.com', 'dwashingtonhv', 'ut5XoeWPhL');
INSERT INTO usuario VALUES (645, 'Jason Hicks', '38 Mayfield Junction', 'jhickshw@boston.com', 'jhickshw', 'hnWA7dRwGS');
INSERT INTO usuario VALUES (646, 'Dorothy Ramos', '831 Drewry Crossing', 'dramoshx@wired.com', 'dramoshx', 'DF0QLXc8');
INSERT INTO usuario VALUES (647, 'Heather Cooper', '128 Continental Drive', 'hcooperhy@go.com', 'hcooperhy', 'gaSItjjh');
INSERT INTO usuario VALUES (648, 'Aaron Ford', '50 Express Parkway', 'afordhz@imdb.com', 'afordhz', '6JhLam3hOWqG');
INSERT INTO usuario VALUES (649, 'Paul Stone', '807 Garrison Junction', 'pstonei0@theguardian.com', 'pstonei0', 'UmtKYIOG8');
INSERT INTO usuario VALUES (650, 'Cheryl Williamson', '64059 American Plaza', 'cwilliamsoni1@cnn.com', 'cwilliamsoni1', 'QlD0fLfdG5d');
INSERT INTO usuario VALUES (651, 'Henry Castillo', '20439 Sachs Alley', 'hcastilloi2@google.de', 'hcastilloi2', 'zidPgks3RU');
INSERT INTO usuario VALUES (652, 'Jennifer Snyder', '5790 Norway Maple Lane', 'jsnyderi3@amazon.com', 'jsnyderi3', 'd8JmBYZE');
INSERT INTO usuario VALUES (653, 'Frances Rose', '8 Stang Drive', 'frosei4@cisco.com', 'frosei4', 'kvYm04');
INSERT INTO usuario VALUES (654, 'Maria Gutierrez', '7587 Summit Center', 'mgutierrezi5@google.it', 'mgutierrezi5', 'SHZj7zNMj');
INSERT INTO usuario VALUES (655, 'Diane Palmer', '04 Vermont Drive', 'dpalmeri6@imdb.com', 'dpalmeri6', 'XjqkDWSsG54');
INSERT INTO usuario VALUES (656, 'Gerald Day', '9 Melody Road', 'gdayi7@yahoo.co.jp', 'gdayi7', 'de7FgDez56');
INSERT INTO usuario VALUES (657, 'Barbara Hernandez', '54083 Valley Edge Pass', 'bhernandezi8@homestead.com', 'bhernandezi8', 'M4M124Dk');
INSERT INTO usuario VALUES (658, 'Lisa Peters', '746 Colorado Avenue', 'lpetersi9@reverbnation.com', 'lpetersi9', '4swScXq');
INSERT INTO usuario VALUES (659, 'Lisa Kennedy', '9 Ludington Way', 'lkennedyia@newyorker.com', 'lkennedyia', 'YOF94ZGVsp');
INSERT INTO usuario VALUES (660, 'Kathryn Webb', '90627 Lakeland Place', 'kwebbib@fema.gov', 'kwebbib', '8Qm2G8Y4j');
INSERT INTO usuario VALUES (661, 'Cynthia Ford', '3240 Milwaukee Pass', 'cfordic@europa.eu', 'cfordic', 'YPHSEQ');
INSERT INTO usuario VALUES (662, 'Phillip Mills', '198 Sunfield Avenue', 'pmillsid@ebay.com', 'pmillsid', 'Lqp7HUWTWm4E');
INSERT INTO usuario VALUES (663, 'Clarence Ward', '5933 Clove Pass', 'cwardie@shop-pro.jp', 'cwardie', 'bdamqhwf7');
INSERT INTO usuario VALUES (664, 'Billy Kelley', '0 Rowland Junction', 'bkelleyif@earthlink.net', 'bkelleyif', '17xy3b');
INSERT INTO usuario VALUES (665, 'Eric Coleman', '59 Sommers Lane', 'ecolemanig@marriott.com', 'ecolemanig', 'oJhVDaw1Op');
INSERT INTO usuario VALUES (666, 'Barbara Walker', '49 Annamark Road', 'bwalkerih@spotify.com', 'bwalkerih', 'YFZTMfUhElQl');
INSERT INTO usuario VALUES (667, 'Jane Vasquez', '31311 Green Ridge Plaza', 'jvasquezii@domainmarket.com', 'jvasquezii', 'nk3CbiWwO5');
INSERT INTO usuario VALUES (668, 'Thomas Butler', '53371 Dwight Lane', 'tbutlerij@linkedin.com', 'tbutlerij', 'RyErTZ');
INSERT INTO usuario VALUES (669, 'Deborah Burton', '1 Oxford Street', 'dburtonik@privacy.gov.au', 'dburtonik', 'VaWn6I2');
INSERT INTO usuario VALUES (670, 'Steven Andrews', '5329 Vera Junction', 'sandrewsil@wiley.com', 'sandrewsil', '6ST1EpagYS');
INSERT INTO usuario VALUES (671, 'Frances Peterson', '236 Badeau Hill', 'fpetersonim@wordpress.com', 'fpetersonim', 'upY4Krx0kE');
INSERT INTO usuario VALUES (672, 'Diana Olson', '049 Hollow Ridge Place', 'dolsonin@prweb.com', 'dolsonin', 'pM75zQJzh4iB');
INSERT INTO usuario VALUES (673, 'Jeffrey Berry', '168 Shelley Court', 'jberryio@wikipedia.org', 'jberryio', 'tFmGOT');
INSERT INTO usuario VALUES (674, 'Louis Franklin', '36145 Judy Lane', 'lfranklinip@un.org', 'lfranklinip', 'Nk1qnCc2SdL');
INSERT INTO usuario VALUES (675, 'Judy Parker', '80105 Elgar Hill', 'jparkeriq@linkedin.com', 'jparkeriq', 'jAq1izUP');
INSERT INTO usuario VALUES (676, 'Keith Brown', '71273 Mitchell Parkway', 'kbrownir@theatlantic.com', 'kbrownir', 'dTusY9KkYsLS');
INSERT INTO usuario VALUES (677, 'Phillip Fields', '11 Oneill Court', 'pfieldsis@ucsd.edu', 'pfieldsis', 'ma2Ipe9W');
INSERT INTO usuario VALUES (678, 'Wayne Howard', '35650 Judy Avenue', 'whowardit@weather.com', 'whowardit', 'DXcZZn');
INSERT INTO usuario VALUES (679, 'Ashley Shaw', '6 Scott Center', 'ashawiu@jigsy.com', 'ashawiu', 'spYqNPUdDkZz');
INSERT INTO usuario VALUES (680, 'Bruce Kelley', '34 Texas Alley', 'bkelleyiv@businesswire.com', 'bkelleyiv', 'fo9qSr');
INSERT INTO usuario VALUES (681, 'Rose Jordan', '8444 Monterey Trail', 'rjordaniw@kickstarter.com', 'rjordaniw', 'mgQs0b');
INSERT INTO usuario VALUES (682, 'Walter Hicks', '9 East Terrace', 'whicksix@ask.com', 'whicksix', '4Ds8yjWvKJ');
INSERT INTO usuario VALUES (683, 'Walter Cooper', '3875 Grover Place', 'wcooperiy@cornell.edu', 'wcooperiy', 'HT50wyS');
INSERT INTO usuario VALUES (684, 'Kathy Fernandez', '60384 Hooker Hill', 'kfernandeziz@pinterest.com', 'kfernandeziz', 'bSyibrbL');
INSERT INTO usuario VALUES (685, 'Barbara Murphy', '34827 Killdeer Center', 'bmurphyj0@youtube.com', 'bmurphyj0', 'u5pPTQbU1D');
INSERT INTO usuario VALUES (686, 'Craig Coleman', '4457 Bay Hill', 'ccolemanj1@who.int', 'ccolemanj1', 'CEcgpa1');
INSERT INTO usuario VALUES (687, 'Kathleen Hicks', '08 Blackbird Point', 'khicksj2@buzzfeed.com', 'khicksj2', '3E4ymDk');
INSERT INTO usuario VALUES (688, 'Amy Gonzalez', '74 Jana Road', 'agonzalezj3@dagondesign.com', 'agonzalezj3', '4He4KNczvy');
INSERT INTO usuario VALUES (689, 'Jacqueline Garza', '12178 Corry Crossing', 'jgarzaj4@tinypic.com', 'jgarzaj4', 'ClXEaq');
INSERT INTO usuario VALUES (690, 'Patrick Medina', '36 Riverside Way', 'pmedinaj5@admin.ch', 'pmedinaj5', 'A1z4bNxm');
INSERT INTO usuario VALUES (691, 'Roger Nguyen', '609 Sherman Plaza', 'rnguyenj6@mysql.com', 'rnguyenj6', 'wB12Wk0s');
INSERT INTO usuario VALUES (692, 'Lawrence Jones', '2144 Bashford Way', 'ljonesj7@ning.com', 'ljonesj7', 'z3CHk3qkl');
INSERT INTO usuario VALUES (693, 'Edward Perry', '1 Huxley Way', 'eperryj8@wiley.com', 'eperryj8', '2e5hi2');
INSERT INTO usuario VALUES (694, 'Brian Frazier', '3 Moland Plaza', 'bfrazierj9@baidu.com', 'bfrazierj9', '6gZSHVLQF92O');
INSERT INTO usuario VALUES (695, 'Mary Cook', '28554 Eastwood Plaza', 'mcookja@tripadvisor.com', 'mcookja', '0DtgVF9k5');
INSERT INTO usuario VALUES (696, 'Harry Wheeler', '84 Susan Place', 'hwheelerjb@gravatar.com', 'hwheelerjb', 'Tb8Re4dhl');
INSERT INTO usuario VALUES (697, 'Doris Adams', '14 Fremont Plaza', 'dadamsjc@i2i.jp', 'dadamsjc', 'Hb1OAcij3yE');
INSERT INTO usuario VALUES (698, 'Eugene Henry', '06 Di Loreto Court', 'ehenryjd@sogou.com', 'ehenryjd', 'mvf2nllPf');
INSERT INTO usuario VALUES (699, 'Beverly Welch', '0 Milwaukee Plaza', 'bwelchje@bbc.co.uk', 'bwelchje', 'OZQAQx2XIxP');
INSERT INTO usuario VALUES (700, 'Carl Coleman', '14119 Florence Drive', 'ccolemanjf@geocities.jp', 'ccolemanjf', 'DM7wPCd');
INSERT INTO usuario VALUES (701, 'Karen Jenkins', '5 Linden Place', 'kjenkinsjg@example.com', 'kjenkinsjg', 'sgrubv9EQJr');
INSERT INTO usuario VALUES (702, 'Jacqueline Warren', '6688 Oakridge Junction', 'jwarrenjh@walmart.com', 'jwarrenjh', 'gpb9ib');
INSERT INTO usuario VALUES (703, 'Kevin Stone', '73769 Spenser Alley', 'kstoneji@dailymotion.com', 'kstoneji', 'QC84AR8jm');
INSERT INTO usuario VALUES (704, 'Alice Coleman', '833 Truax Parkway', 'acolemanjj@washingtonpost.com', 'acolemanjj', '8jV85WyN');
INSERT INTO usuario VALUES (705, 'Shirley Oliver', '0280 Ridgeway Court', 'soliverjk@about.com', 'soliverjk', 'fWQmJulNEU');
INSERT INTO usuario VALUES (706, 'Alan Hart', '849 Weeping Birch Avenue', 'ahartjl@ft.com', 'ahartjl', '7UjehMm');
INSERT INTO usuario VALUES (707, 'Joshua Sanders', '69850 Pankratz Road', 'jsandersjm@ihg.com', 'jsandersjm', 'U6ws64eOkOF');
INSERT INTO usuario VALUES (708, 'Adam Russell', '7 Mayfield Drive', 'arusselljn@examiner.com', 'arusselljn', 'kiKUPeHRc');
INSERT INTO usuario VALUES (709, 'Norma Wheeler', '5510 Mosinee Drive', 'nwheelerjo@dyndns.org', 'nwheelerjo', '9rfLXhvv');
INSERT INTO usuario VALUES (710, 'Gary Diaz', '8489 Loftsgordon Point', 'gdiazjp@mtv.com', 'gdiazjp', '4G2qGfE');
INSERT INTO usuario VALUES (711, 'Wayne Jones', '4046 Corscot Hill', 'wjonesjq@examiner.com', 'wjonesjq', 'srXaaZV');
INSERT INTO usuario VALUES (712, 'Stephanie Austin', '2457 Forest Place', 'saustinjr@weibo.com', 'saustinjr', 'QSOy4R2Hv0');
INSERT INTO usuario VALUES (713, 'Shirley Hill', '1179 Chive Terrace', 'shilljs@squarespace.com', 'shilljs', 'FCwSN7iVxM');
INSERT INTO usuario VALUES (714, 'Angela Freeman', '39 2nd Drive', 'afreemanjt@loc.gov', 'afreemanjt', '5maTgQGL81o');
INSERT INTO usuario VALUES (715, 'Roger Washington', '87603 Farragut Avenue', 'rwashingtonju@woothemes.com', 'rwashingtonju', 'mczomLxb');
INSERT INTO usuario VALUES (716, 'Paul Arnold', '59957 Ridge Oak Circle', 'parnoldjv@java.com', 'parnoldjv', 'm6zJhnq');
INSERT INTO usuario VALUES (717, 'Willie Day', '221 Fuller Place', 'wdayjw@ovh.net', 'wdayjw', 'kn3DMGckHIJ');
INSERT INTO usuario VALUES (718, 'Pamela Hayes', '53115 Orin Court', 'phayesjx@w3.org', 'phayesjx', '35uRTYRn');
INSERT INTO usuario VALUES (719, 'Lawrence Evans', '93805 Shopko Park', 'levansjy@cloudflare.com', 'levansjy', 'XuWlj0Ilzaa');
INSERT INTO usuario VALUES (720, 'Eugene Edwards', '52 Superior Drive', 'eedwardsjz@ocn.ne.jp', 'eedwardsjz', 'CYsseK');
INSERT INTO usuario VALUES (721, 'Shawn Thomas', '8026 John Wall Point', 'sthomask0@oracle.com', 'sthomask0', 'V2IFjQ');
INSERT INTO usuario VALUES (722, 'Julie Diaz', '40749 Reinke Crossing', 'jdiazk1@ucsd.edu', 'jdiazk1', '9hvQPzsgtkq');
INSERT INTO usuario VALUES (723, 'Willie Barnes', '9 Twin Pines Junction', 'wbarnesk2@hud.gov', 'wbarnesk2', 'TdAcOWLTNMq');
INSERT INTO usuario VALUES (724, 'Norma Martin', '023 Lighthouse Bay Junction', 'nmartink3@cnbc.com', 'nmartink3', 'nOVmrn');
INSERT INTO usuario VALUES (725, 'Cheryl Sanchez', '21845 Oxford Way', 'csanchezk4@behance.net', 'csanchezk4', 'cv4SlxZz');
INSERT INTO usuario VALUES (726, 'Jean Fox', '6760 Scott Plaza', 'jfoxk5@cargocollective.com', 'jfoxk5', 'ZFIzX2yQvNK');
INSERT INTO usuario VALUES (727, 'Julie Rogers', '0 Loeprich Avenue', 'jrogersk6@discovery.com', 'jrogersk6', 'PzpHuoQt9');
INSERT INTO usuario VALUES (728, 'Diane Reid', '3094 Monterey Street', 'dreidk7@sciencedirect.com', 'dreidk7', 'YdxwCzC23Wa');
INSERT INTO usuario VALUES (729, 'Frank Mendoza', '16829 Graedel Lane', 'fmendozak8@cnet.com', 'fmendozak8', 'mXtMKcxz');
INSERT INTO usuario VALUES (730, 'Joan Washington', '1 Bartillon Place', 'jwashingtonk9@bing.com', 'jwashingtonk9', 'YvnuvC9eH');
INSERT INTO usuario VALUES (731, 'William Rodriguez', '3 Bashford Drive', 'wrodriguezka@sbwire.com', 'wrodriguezka', 'Bst7PX');
INSERT INTO usuario VALUES (732, 'Pamela Burton', '94355 Sutteridge Road', 'pburtonkb@yellowbook.com', 'pburtonkb', 'exRiJuMytdU');
INSERT INTO usuario VALUES (733, 'Judy Rice', '86 Miller Avenue', 'jricekc@elpais.com', 'jricekc', 'HL2Yow');
INSERT INTO usuario VALUES (734, 'Jason Vasquez', '59 Katie Road', 'jvasquezkd@icio.us', 'jvasquezkd', 'q99aLu');
INSERT INTO usuario VALUES (735, 'Wayne Porter', '9452 Ohio Street', 'wporterke@skype.com', 'wporterke', 'QFp3OmCy');
INSERT INTO usuario VALUES (736, 'Clarence Long', '0037 Riverside Road', 'clongkf@cornell.edu', 'clongkf', 'qW8jjg');
INSERT INTO usuario VALUES (737, 'Harry Daniels', '181 Brentwood Terrace', 'hdanielskg@people.com.cn', 'hdanielskg', 'd5GVlnuW');
INSERT INTO usuario VALUES (738, 'Lori Reid', '4791 Mifflin Plaza', 'lreidkh@cmu.edu', 'lreidkh', 'oAf74l');
INSERT INTO usuario VALUES (739, 'Amanda Scott', '60592 Dwight Street', 'ascottki@cpanel.net', 'ascottki', 'ri6kUp5');
INSERT INTO usuario VALUES (740, 'Jennifer Alexander', '057 Clemons Junction', 'jalexanderkj@japanpost.jp', 'jalexanderkj', 'RqhEXBZtN');
INSERT INTO usuario VALUES (741, 'Mary Gonzalez', '25980 New Castle Plaza', 'mgonzalezkk@nps.gov', 'mgonzalezkk', '5izDx3f1Eg');
INSERT INTO usuario VALUES (742, 'Louise Berry', '656 Continental Parkway', 'lberrykl@jugem.jp', 'lberrykl', 'TZMlP5abyj8V');
INSERT INTO usuario VALUES (743, 'Jack Roberts', '52 Swallow Way', 'jrobertskm@nbcnews.com', 'jrobertskm', 'ail5Vlh');
INSERT INTO usuario VALUES (744, 'Jean Williams', '5969 Forest Place', 'jwilliamskn@harvard.edu', 'jwilliamskn', 'oM6Sge');
INSERT INTO usuario VALUES (745, 'Paul James', '33419 John Wall Court', 'pjamesko@opera.com', 'pjamesko', 'XmNZGEUNW');
INSERT INTO usuario VALUES (746, 'Sara Wright', '339 Fuller Lane', 'swrightkp@narod.ru', 'swrightkp', 'BRKup2cLmWXQ');
INSERT INTO usuario VALUES (747, 'Lillian Hicks', '4 Hoard Pass', 'lhickskq@ibm.com', 'lhickskq', 'NKMIFiltE');
INSERT INTO usuario VALUES (748, 'Juan Warren', '327 Vermont Plaza', 'jwarrenkr@ibm.com', 'jwarrenkr', '52LUO0');
INSERT INTO usuario VALUES (749, 'Walter Fields', '7 Scoville Avenue', 'wfieldsks@huffingtonpost.com', 'wfieldsks', 'EVv7HY');
INSERT INTO usuario VALUES (750, 'Billy Lane', '34 Spaight Drive', 'blanekt@skyrock.com', 'blanekt', 'ZWogkv');
INSERT INTO usuario VALUES (751, 'Alan Sims', '5 Oriole Lane', 'asimsku@opensource.org', 'asimsku', 'LDXg9I6SB');
INSERT INTO usuario VALUES (752, 'Joan Garcia', '09 Fallview Place', 'jgarciakv@4shared.com', 'jgarciakv', '6NmR574GKl');
INSERT INTO usuario VALUES (753, 'Denise Morales', '6 Mccormick Lane', 'dmoraleskw@dailymail.co.uk', 'dmoraleskw', 'wRWdzeJZLWlK');
INSERT INTO usuario VALUES (754, 'Carlos Willis', '2 Eastlawn Lane', 'cwilliskx@alibaba.com', 'cwilliskx', 'j70aNAzCkAX');
INSERT INTO usuario VALUES (755, 'Christopher Lee', '9488 Packers Alley', 'cleeky@virginia.edu', 'cleeky', 'evk0Od');
INSERT INTO usuario VALUES (756, 'Jose Cunningham', '343 Jay Trail', 'jcunninghamkz@foxnews.com', 'jcunninghamkz', 'Rploro');
INSERT INTO usuario VALUES (757, 'Frank Montgomery', '72 Arizona Plaza', 'fmontgomeryl0@jugem.jp', 'fmontgomeryl0', 'M2rKqUOXKze');
INSERT INTO usuario VALUES (758, 'Alan Dunn', '673 Dapin Alley', 'adunnl1@prnewswire.com', 'adunnl1', 'vOPcQA');
INSERT INTO usuario VALUES (759, 'Wayne Peters', '38 Monterey Lane', 'wpetersl2@marriott.com', 'wpetersl2', 'DiF2xBoO7V');
INSERT INTO usuario VALUES (760, 'Phyllis Fields', '82159 Jana Place', 'pfieldsl3@opensource.org', 'pfieldsl3', '5uOCKYy1v');
INSERT INTO usuario VALUES (761, 'Rose Ramirez', '85 Dottie Plaza', 'rramirezl4@oracle.com', 'rramirezl4', 'bFt1YCJ');
INSERT INTO usuario VALUES (762, 'Deborah Sims', '5132 Troy Hill', 'dsimsl5@google.co.jp', 'dsimsl5', 'ZrXJYMyb');
INSERT INTO usuario VALUES (763, 'Gregory Snyder', '23 Longview Circle', 'gsnyderl6@whitehouse.gov', 'gsnyderl6', 'n8SKh133MD');
INSERT INTO usuario VALUES (764, 'Christopher Armstrong', '79 Eggendart Pass', 'carmstrongl7@nytimes.com', 'carmstrongl7', '867nVY4UAV2o');
INSERT INTO usuario VALUES (765, 'Paul Owens', '71 Homewood Terrace', 'powensl8@smugmug.com', 'powensl8', 'CECPXOvdHoX6');
INSERT INTO usuario VALUES (766, 'Jonathan Walker', '77 Manufacturers Junction', 'jwalkerl9@seesaa.net', 'jwalkerl9', 'SmTe6lV');
INSERT INTO usuario VALUES (767, 'Ruth Coleman', '473 Novick Drive', 'rcolemanla@whitehouse.gov', 'rcolemanla', '5rJCtzvLi7');
INSERT INTO usuario VALUES (768, 'Patricia Crawford', '6 Stephen Circle', 'pcrawfordlb@independent.co.uk', 'pcrawfordlb', 'Xfj6UKtwq');
INSERT INTO usuario VALUES (769, 'Edward Reynolds', '33 Veith Lane', 'ereynoldslc@example.com', 'ereynoldslc', 'SOgwk7sMxv');
INSERT INTO usuario VALUES (770, 'Jimmy Morris', '1180 Pierstorff Way', 'jmorrisld@patch.com', 'jmorrisld', 'XikU4ucm8');
INSERT INTO usuario VALUES (771, 'Paul Castillo', '0431 Hollow Ridge Junction', 'pcastillole@163.com', 'pcastillole', 'uHfMwj7Q');
INSERT INTO usuario VALUES (772, 'Catherine Ellis', '4 Westend Terrace', 'cellislf@linkedin.com', 'cellislf', 'Om3zKWg');
INSERT INTO usuario VALUES (773, 'Justin Lane', '8186 Northland Place', 'jlanelg@seattletimes.com', 'jlanelg', '3oM6dOx');
INSERT INTO usuario VALUES (774, 'Jack Weaver', '542 Gulseth Circle', 'jweaverlh@cbslocal.com', 'jweaverlh', '8nSeaSJwqfu');
INSERT INTO usuario VALUES (775, 'Helen Howell', '3 Bashford Alley', 'hhowellli@loc.gov', 'hhowellli', 'z6BHMb');
INSERT INTO usuario VALUES (776, 'Dennis Turner', '2 Porter Court', 'dturnerlj@netlog.com', 'dturnerlj', 'ChF6nPg8Fkyz');
INSERT INTO usuario VALUES (777, 'Christopher Thomas', '77 Victoria Center', 'cthomaslk@admin.ch', 'cthomaslk', 'V0Hpii3dg');
INSERT INTO usuario VALUES (778, 'Samuel Ross', '534 Kim Junction', 'srossll@vk.com', 'srossll', 'hbH2uKVu');
INSERT INTO usuario VALUES (779, 'Albert Reed', '91 Brentwood Point', 'areedlm@slashdot.org', 'areedlm', 'wT8MeH');
INSERT INTO usuario VALUES (780, 'Bruce Hicks', '316 Mcguire Alley', 'bhicksln@statcounter.com', 'bhicksln', '8OBp5890');
INSERT INTO usuario VALUES (781, 'Frances Chavez', '2678 Delladonna Point', 'fchavezlo@friendfeed.com', 'fchavezlo', 'dmPLpaDcYhU');
INSERT INTO usuario VALUES (782, 'Anna Watson', '19 Sommers Road', 'awatsonlp@geocities.com', 'awatsonlp', 'UczZV1qfMlG5');
INSERT INTO usuario VALUES (783, 'Gregory Gilbert', '06698 Lindbergh Center', 'ggilbertlq@theatlantic.com', 'ggilbertlq', 'AuJ1lB8');
INSERT INTO usuario VALUES (784, 'George Phillips', '008 Nelson Street', 'gphillipslr@bandcamp.com', 'gphillipslr', '9aGePMC');
INSERT INTO usuario VALUES (785, 'Teresa Hanson', '749 Bluestem Terrace', 'thansonls@virginia.edu', 'thansonls', 'lrZGp5iZW');
INSERT INTO usuario VALUES (786, 'Nicole Kim', '801 Fulton Alley', 'nkimlt@ca.gov', 'nkimlt', 'n6IqJh');
INSERT INTO usuario VALUES (787, 'Chris Harris', '3077 Dexter Hill', 'charrislu@miitbeian.gov.cn', 'charrislu', 'KEEeQ1');
INSERT INTO usuario VALUES (788, 'Carolyn Thompson', '7440 Starling Way', 'cthompsonlv@bizjournals.com', 'cthompsonlv', 'cNjMGU0MrYj');
INSERT INTO usuario VALUES (789, 'Judy Alexander', '20659 Coolidge Alley', 'jalexanderlw@paginegialle.it', 'jalexanderlw', 'ggqAbInUVh');
INSERT INTO usuario VALUES (790, 'Daniel Hudson', '498 Hovde Hill', 'dhudsonlx@vimeo.com', 'dhudsonlx', 'urRDck3OT');
INSERT INTO usuario VALUES (791, 'Christina Payne', '04 2nd Plaza', 'cpaynely@icio.us', 'cpaynely', '4KIwHT');
INSERT INTO usuario VALUES (792, 'Stephanie Anderson', '7 Northfield Terrace', 'sandersonlz@cmu.edu', 'sandersonlz', 'WrepndSYTF4');
INSERT INTO usuario VALUES (793, 'Chris Henry', '466 Ryan Hill', 'chenrym0@whitehouse.gov', 'chenrym0', '3anF71Cg');
INSERT INTO usuario VALUES (794, 'Todd Kim', '3554 Sommers Street', 'tkimm1@php.net', 'tkimm1', 'qx18mXtDg');
INSERT INTO usuario VALUES (795, 'David Greene', '2 Dexter Circle', 'dgreenem2@macromedia.com', 'dgreenem2', 'sfDTkIVAKXL');
INSERT INTO usuario VALUES (796, 'Pamela Burton', '1 Pawling Plaza', 'pburtonm3@g.co', 'pburtonm3', 'tUIqVex');
INSERT INTO usuario VALUES (797, 'Stephanie Robertson', '9 Londonderry Lane', 'srobertsonm4@studiopress.com', 'srobertsonm4', 'jiKnC0q7DcWT');
INSERT INTO usuario VALUES (798, 'Jonathan Willis', '81021 4th Center', 'jwillism5@ucoz.ru', 'jwillism5', 'rK1438');
INSERT INTO usuario VALUES (799, 'Katherine Dixon', '21494 Comanche Road', 'kdixonm6@ihg.com', 'kdixonm6', 'JnAY9n');
INSERT INTO usuario VALUES (800, 'Jose Robertson', '6999 Del Sol Pass', 'jrobertsonm7@wikia.com', 'jrobertsonm7', 'IhhEg32');
INSERT INTO usuario VALUES (801, 'David Garza', '137 Elgar Crossing', 'dgarzam8@jiathis.com', 'dgarzam8', 'MfH3Bt');
INSERT INTO usuario VALUES (802, 'Dennis Porter', '47 Randy Road', 'dporterm9@miibeian.gov.cn', 'dporterm9', 'mDmuFElGCFTk');
INSERT INTO usuario VALUES (803, 'Amanda Stephens', '534 Elmside Parkway', 'astephensma@exblog.jp', 'astephensma', 'XqpYmx5l3SO6');
INSERT INTO usuario VALUES (804, 'Russell Little', '7851 Lakewood Gardens Place', 'rlittlemb@studiopress.com', 'rlittlemb', 'VQjpWsZ');
INSERT INTO usuario VALUES (805, 'Randy Cunningham', '72949 Oxford Place', 'rcunninghammc@globo.com', 'rcunninghammc', 'SsIVUAexSF');
INSERT INTO usuario VALUES (806, 'Alan Carr', '181 Cambridge Crossing', 'acarrmd@yellowbook.com', 'acarrmd', '1mN1aLav');
INSERT INTO usuario VALUES (807, 'Stephen Cox', '3 Goodland Road', 'scoxme@google.com.br', 'scoxme', 'w9K4G2xK6XF');
INSERT INTO usuario VALUES (808, 'Anne Alexander', '23611 Fairfield Center', 'aalexandermf@multiply.com', 'aalexandermf', 'BK7usubQ06t');
INSERT INTO usuario VALUES (809, 'Kathy Lopez', '8787 Sheridan Avenue', 'klopezmg@java.com', 'klopezmg', '6gTMQJHG');
INSERT INTO usuario VALUES (810, 'Jacqueline Gordon', '7 Meadow Ridge Park', 'jgordonmh@weibo.com', 'jgordonmh', 'uyL1g4zE');
INSERT INTO usuario VALUES (811, 'Russell Austin', '2668 Lyons Circle', 'raustinmi@ask.com', 'raustinmi', 'Ls4ZYMj3S');
INSERT INTO usuario VALUES (812, 'Brenda Freeman', '4976 Katie Pass', 'bfreemanmj@stanford.edu', 'bfreemanmj', 'cbWSvz');
INSERT INTO usuario VALUES (813, 'Lillian Freeman', '16 Lillian Point', 'lfreemanmk@issuu.com', 'lfreemanmk', 'vD9o0E7Mw');
INSERT INTO usuario VALUES (814, 'Deborah Fox', '91 Upham Junction', 'dfoxml@wix.com', 'dfoxml', 'XDWHkgLq');
INSERT INTO usuario VALUES (815, 'Stephen Cook', '70 Lakewood Drive', 'scookmm@cyberchimps.com', 'scookmm', 'iDjipLm0lS');
INSERT INTO usuario VALUES (816, 'Jerry Price', '1 Homewood Street', 'jpricemn@hp.com', 'jpricemn', 'V7bqbCs6xqL');
INSERT INTO usuario VALUES (817, 'Kevin Thomas', '57387 Oriole Alley', 'kthomasmo@wiley.com', 'kthomasmo', 'mQhjAetJe');
INSERT INTO usuario VALUES (818, 'Jerry Fuller', '0 Truax Lane', 'jfullermp@craigslist.org', 'jfullermp', 'j1YGnCkSS1zp');
INSERT INTO usuario VALUES (819, 'Debra Kelley', '93601 Logan Point', 'dkelleymq@springer.com', 'dkelleymq', 'dmz6LsSt');
INSERT INTO usuario VALUES (820, 'Matthew Bryant', '766 Hermina Parkway', 'mbryantmr@stumbleupon.com', 'mbryantmr', 'NkWlzW');
INSERT INTO usuario VALUES (821, 'Heather Nguyen', '1575 Grover Drive', 'hnguyenms@delicious.com', 'hnguyenms', 'QtlhXAtOfVq1');
INSERT INTO usuario VALUES (822, 'Timothy Howard', '9 Mayer Lane', 'thowardmt@wired.com', 'thowardmt', 'UyQAsq');
INSERT INTO usuario VALUES (823, 'Victor Price', '5 Grim Lane', 'vpricemu@bigcartel.com', 'vpricemu', 'Lq31wwXF');
INSERT INTO usuario VALUES (824, 'Peter Riley', '95 Carpenter Place', 'prileymv@bigcartel.com', 'prileymv', 'CtquNwSg509');
INSERT INTO usuario VALUES (825, 'Judith Burns', '030 Dayton Center', 'jburnsmw@github.io', 'jburnsmw', 'ypND0W');
INSERT INTO usuario VALUES (826, 'Karen Walker', '2046 Sullivan Avenue', 'kwalkermx@t-online.de', 'kwalkermx', 'JTaBpkXcpU');
INSERT INTO usuario VALUES (827, 'Amy Hamilton', '57 Westend Terrace', 'ahamiltonmy@japanpost.jp', 'ahamiltonmy', 'WteuIn');
INSERT INTO usuario VALUES (828, 'Karen Evans', '86723 Melby Court', 'kevansmz@furl.net', 'kevansmz', 'atOp2Anl4');
INSERT INTO usuario VALUES (829, 'Heather Diaz', '6801 Bobwhite Junction', 'hdiazn0@tumblr.com', 'hdiazn0', 'L6k6OyM');
INSERT INTO usuario VALUES (830, 'Alice Moreno', '989 Ludington Terrace', 'amorenon1@constantcontact.com', 'amorenon1', 'qnYZerdC');
INSERT INTO usuario VALUES (831, 'Stephanie Carroll', '6 Basil Circle', 'scarrolln2@xing.com', 'scarrolln2', 'D1fwU2jOKvn');
INSERT INTO usuario VALUES (832, 'Walter Boyd', '6 Karstens Park', 'wboydn3@hugedomains.com', 'wboydn3', 'koXCD44R');
INSERT INTO usuario VALUES (833, 'Billy Boyd', '5 Service Drive', 'bboydn4@ucoz.com', 'bboydn4', 'lPZLDZBOMW');
INSERT INTO usuario VALUES (834, 'Ashley Jackson', '01 Golden Leaf Circle', 'ajacksonn5@is.gd', 'ajacksonn5', 'kCJlzMZEigA');
INSERT INTO usuario VALUES (835, 'Anthony Romero', '01 Corben Trail', 'aromeron6@reuters.com', 'aromeron6', 'Rbx0T2');
INSERT INTO usuario VALUES (836, 'Diana Peterson', '0871 Manley Parkway', 'dpetersonn7@ustream.tv', 'dpetersonn7', 'qwAo4lJpZ');
INSERT INTO usuario VALUES (837, 'Rose Welch', '7 Crescent Oaks Plaza', 'rwelchn8@g.co', 'rwelchn8', '9LkGdgsVxaJ');
INSERT INTO usuario VALUES (838, 'Tammy Sullivan', '8621 Delladonna Pass', 'tsullivann9@vistaprint.com', 'tsullivann9', 'xrQEaV');
INSERT INTO usuario VALUES (839, 'Matthew Weaver', '4672 Nova Park', 'mweaverna@kickstarter.com', 'mweaverna', 'luEr9yAu');
INSERT INTO usuario VALUES (840, 'Daniel Stewart', '81004 Buena Vista Drive', 'dstewartnb@delicious.com', 'dstewartnb', 'fxtv6cJLUtpN');
INSERT INTO usuario VALUES (841, 'Jose Lee', '577 Dapin Park', 'jleenc@ycombinator.com', 'jleenc', 'sI4bararCE');
INSERT INTO usuario VALUES (842, 'Helen Bradley', '66760 Sheridan Way', 'hbradleynd@vistaprint.com', 'hbradleynd', 'xny4k2e');
INSERT INTO usuario VALUES (843, 'Matthew Owens', '8586 Twin Pines Pass', 'mowensne@woothemes.com', 'mowensne', '86wTFM4eJP');
INSERT INTO usuario VALUES (844, 'Antonio Lee', '74 Brentwood Street', 'aleenf@cocolog-nifty.com', 'aleenf', 'tAN92ZLaX');
INSERT INTO usuario VALUES (845, 'Alan Gonzalez', '30 Hanover Park', 'agonzalezng@tripod.com', 'agonzalezng', 'gS7mMHnjIS');
INSERT INTO usuario VALUES (846, 'Matthew Porter', '78856 Forest Dale Street', 'mporternh@sakura.ne.jp', 'mporternh', 'FBarDi00H');
INSERT INTO usuario VALUES (847, 'Steven Palmer', '1490 Granby Avenue', 'spalmerni@skype.com', 'spalmerni', 'TjPgfpT');
INSERT INTO usuario VALUES (848, 'Thomas Watkins', '819 Northland Trail', 'twatkinsnj@deliciousdays.com', 'twatkinsnj', 'jtfed1R8YR');
INSERT INTO usuario VALUES (849, 'Sandra Ward', '15 Talisman Alley', 'swardnk@booking.com', 'swardnk', 'KnBTitPn3i0');
INSERT INTO usuario VALUES (850, 'Dennis Weaver', '435 Maywood Crossing', 'dweavernl@fda.gov', 'dweavernl', 'uVEjG46Cf');
INSERT INTO usuario VALUES (851, 'Irene Nguyen', '8761 Karstens Road', 'inguyennm@theguardian.com', 'inguyennm', 'tsL7dl9');
INSERT INTO usuario VALUES (852, 'Kathryn Kelley', '0600 Lukken Parkway', 'kkelleynn@marketwatch.com', 'kkelleynn', 'UeMQVYtCQr');
INSERT INTO usuario VALUES (853, 'Patricia Robertson', '6 Manufacturers Court', 'probertsonno@issuu.com', 'probertsonno', 'cZQiiTX7E0sd');
INSERT INTO usuario VALUES (854, 'Joshua Garcia', '198 Mandrake Pass', 'jgarcianp@aboutads.info', 'jgarcianp', 'KIhEMSvKR');
INSERT INTO usuario VALUES (855, 'Ernest Howell', '7 Straubel Avenue', 'ehowellnq@usatoday.com', 'ehowellnq', 'haUMXxfx136');
INSERT INTO usuario VALUES (856, 'Katherine Collins', '89 Shelley Point', 'kcollinsnr@bizjournals.com', 'kcollinsnr', '271pbc50uyah');
INSERT INTO usuario VALUES (857, 'Martha West', '3 Sutherland Avenue', 'mwestns@blinklist.com', 'mwestns', 'okM7OOtnj');
INSERT INTO usuario VALUES (858, 'Louise Bowman', '75 Monterey Road', 'lbowmannt@omniture.com', 'lbowmannt', 'PEo2Pm');
INSERT INTO usuario VALUES (859, 'Catherine Fields', '9 Burning Wood Way', 'cfieldsnu@europa.eu', 'cfieldsnu', '0WjmM51cmFV');
INSERT INTO usuario VALUES (860, 'Adam Watson', '1 6th Alley', 'awatsonnv@joomla.org', 'awatsonnv', 'fOeupHtLvh');
INSERT INTO usuario VALUES (861, 'Joe Gordon', '41025 Esch Court', 'jgordonnw@ocn.ne.jp', 'jgordonnw', 'Cs2BEMz');
INSERT INTO usuario VALUES (862, 'Wanda Tucker', '3769 Goodland Plaza', 'wtuckernx@furl.net', 'wtuckernx', 'H2BnkH');
INSERT INTO usuario VALUES (863, 'Brandon Woods', '532 Annamark Hill', 'bwoodsny@yandex.ru', 'bwoodsny', 'SLQ58RsagBS');
INSERT INTO usuario VALUES (864, 'Sandra Fisher', '43281 Mallard Court', 'sfishernz@trellian.com', 'sfishernz', 'by7lcqi8W');
INSERT INTO usuario VALUES (865, 'Ashley Banks', '74 Ridgeway Road', 'abankso0@stumbleupon.com', 'abankso0', 'nXBzZa');
INSERT INTO usuario VALUES (866, 'Aaron Henry', '34 Fairview Court', 'ahenryo1@wired.com', 'ahenryo1', 'XdR1CnKm');
INSERT INTO usuario VALUES (867, 'Dorothy Martin', '55804 Corben Street', 'dmartino2@pagesperso-orange.fr', 'dmartino2', 'QqFeYi0f');
INSERT INTO usuario VALUES (868, 'Stephen Stone', '996 Almo Place', 'sstoneo3@gmpg.org', 'sstoneo3', 'SEH0T0Xp');
INSERT INTO usuario VALUES (869, 'Barbara Cox', '71181 Elmside Alley', 'bcoxo4@apple.com', 'bcoxo4', 'Y7C9IK');
INSERT INTO usuario VALUES (870, 'Beverly Gilbert', '64649 8th Crossing', 'bgilberto5@disqus.com', 'bgilberto5', 'vTxGiFs');
INSERT INTO usuario VALUES (871, 'Anne Williamson', '8 South Center', 'awilliamsono6@people.com.cn', 'awilliamsono6', 'yo0Hf2');
INSERT INTO usuario VALUES (872, 'Michael Phillips', '74 Meadow Vale Hill', 'mphillipso7@umn.edu', 'mphillipso7', '7NqheDZ');
INSERT INTO usuario VALUES (873, 'Joe Oliver', '04 Forster Street', 'jolivero8@wsj.com', 'jolivero8', 'rLKTToC7');
INSERT INTO usuario VALUES (874, 'Eric Lewis', '87491 Lawn Junction', 'elewiso9@vk.com', 'elewiso9', 'b0iGhP');
INSERT INTO usuario VALUES (875, 'Aaron Gonzales', '49470 Rutledge Road', 'agonzalesoa@accuweather.com', 'agonzalesoa', 'iHfB9kb');
INSERT INTO usuario VALUES (876, 'Annie Owens', '6932 Aberg Junction', 'aowensob@wsj.com', 'aowensob', '92ykAa');
INSERT INTO usuario VALUES (877, 'Judy Mccoy', '1 Melody Circle', 'jmccoyoc@themeforest.net', 'jmccoyoc', 'heZnUnG5qM');
INSERT INTO usuario VALUES (878, 'Adam Austin', '89 Almo Crossing', 'aaustinod@freewebs.com', 'aaustinod', '69bMqDvRQzln');
INSERT INTO usuario VALUES (879, 'Gary Simmons', '2 Forest Court', 'gsimmonsoe@aol.com', 'gsimmonsoe', 'OkTbtA2');
INSERT INTO usuario VALUES (880, 'Michelle Greene', '3570 Grim Point', 'mgreeneof@issuu.com', 'mgreeneof', 'DiKRvR5kF1gu');
INSERT INTO usuario VALUES (881, 'Judy Morales', '03798 6th Plaza', 'jmoralesog@skype.com', 'jmoralesog', '1qVKC0P');
INSERT INTO usuario VALUES (882, 'Thomas Chavez', '00638 American Ash Park', 'tchavezoh@themeforest.net', 'tchavezoh', 'kTFqB9Di');
INSERT INTO usuario VALUES (883, 'Jerry Spencer', '1782 Anthes Avenue', 'jspenceroi@bbb.org', 'jspenceroi', 'i4jYd7Ko');
INSERT INTO usuario VALUES (884, 'Mary Oliver', '92 Lakewood Gardens Circle', 'moliveroj@cargocollective.com', 'moliveroj', 'HPMCjf1NIUVk');
INSERT INTO usuario VALUES (885, 'Doris Allen', '038 Jenna Hill', 'dallenok@intel.com', 'dallenok', 'pQ34fQWl');
INSERT INTO usuario VALUES (886, 'Carl Rodriguez', '97 Columbus Court', 'crodriguezol@ifeng.com', 'crodriguezol', 'rAlqJv4pBVgb');
INSERT INTO usuario VALUES (887, 'Brenda Knight', '16 Katie Pass', 'bknightom@yale.edu', 'bknightom', '4Jwb0JN');
INSERT INTO usuario VALUES (888, 'Lisa Fisher', '7596 Haas Point', 'lfisheron@independent.co.uk', 'lfisheron', 'giaEVR31UBI');
INSERT INTO usuario VALUES (889, 'Philip Bell', '78 Village Avenue', 'pbelloo@blogger.com', 'pbelloo', 'c9nlpR8');
INSERT INTO usuario VALUES (890, 'Matthew Lawrence', '51 Eliot Avenue', 'mlawrenceop@hexun.com', 'mlawrenceop', 'eFzSyyO');
INSERT INTO usuario VALUES (891, 'Sarah Oliver', '28 Larry Road', 'soliveroq@tripod.com', 'soliveroq', 'f8S88bA1');
INSERT INTO usuario VALUES (892, 'Harry James', '1358 Drewry Center', 'hjamesor@pcworld.com', 'hjamesor', 'uHsaGKHq');
INSERT INTO usuario VALUES (893, 'Juan Rivera', '30 Norway Maple Pass', 'jriveraos@bravesites.com', 'jriveraos', 'KlUtst3WQ');
INSERT INTO usuario VALUES (894, 'Kimberly Snyder', '4710 Grasskamp Hill', 'ksnyderot@so-net.ne.jp', 'ksnyderot', 'ulsLTgb1uPcu');
INSERT INTO usuario VALUES (895, 'Carolyn Brooks', '79 Commercial Junction', 'cbrooksou@wiley.com', 'cbrooksou', 'zvm65Kj6MzK');
INSERT INTO usuario VALUES (896, 'Nicholas Simmons', '18 Roxbury Drive', 'nsimmonsov@cdc.gov', 'nsimmonsov', '1oasD5lWvBGq');
INSERT INTO usuario VALUES (897, 'Benjamin Hunter', '1 Corben Park', 'bhunterow@ustream.tv', 'bhunterow', 'oxqaJJT');
INSERT INTO usuario VALUES (898, 'Julie Montgomery', '850 Talisman Pass', 'jmontgomeryox@oakley.com', 'jmontgomeryox', 'zH0RfolRJVOg');
INSERT INTO usuario VALUES (899, 'Elizabeth Hanson', '9118 Summerview Pass', 'ehansonoy@twitpic.com', 'ehansonoy', 'DBwpVnd');
INSERT INTO usuario VALUES (900, 'Jonathan Anderson', '2 Emmet Road', 'jandersonoz@purevolume.com', 'jandersonoz', 'Eq6sSfFfe5');
INSERT INTO usuario VALUES (901, 'Alan Hawkins', '75 Mosinee Circle', 'ahawkinsp0@clickbank.net', 'ahawkinsp0', '8wi75VqK');
INSERT INTO usuario VALUES (902, 'Jeremy Freeman', '943 Barnett Alley', 'jfreemanp1@forbes.com', 'jfreemanp1', 'TWAfDc');
INSERT INTO usuario VALUES (903, 'Steve Coleman', '6 Bay Park', 'scolemanp2@sphinn.com', 'scolemanp2', 'kuqLN0dnsnV');
INSERT INTO usuario VALUES (904, 'Roger Campbell', '790 Pine View Lane', 'rcampbellp3@mysql.com', 'rcampbellp3', 'UXWzcPsrBuzs');
INSERT INTO usuario VALUES (905, 'Jean White', '2 Grasskamp Trail', 'jwhitep4@ycombinator.com', 'jwhitep4', 'tLTeEnDIzopR');
INSERT INTO usuario VALUES (906, 'Pamela Ford', '435 Washington Drive', 'pfordp5@mit.edu', 'pfordp5', 'PiJaj4xMUGV');
INSERT INTO usuario VALUES (907, 'Bonnie Banks', '78932 John Wall Center', 'bbanksp6@amazon.co.uk', 'bbanksp6', 'R98EOhMbPm');
INSERT INTO usuario VALUES (908, 'Louise Wallace', '3097 Kennedy Trail', 'lwallacep7@unc.edu', 'lwallacep7', 'GfMLNCnh');
INSERT INTO usuario VALUES (909, 'Sharon Lane', '0 Sundown Center', 'slanep8@ehow.com', 'slanep8', 'ICHYGWljA');
INSERT INTO usuario VALUES (910, 'Arthur Weaver', '6610 Oak Valley Court', 'aweaverp9@gov.uk', 'aweaverp9', 'FesU3j5');
INSERT INTO usuario VALUES (911, 'Roy Myers', '59 Vahlen Drive', 'rmyerspa@diigo.com', 'rmyerspa', '1dAQt9wwHAcd');
INSERT INTO usuario VALUES (912, 'Sara Young', '43 Jay Alley', 'syoungpb@exblog.jp', 'syoungpb', '0pBHn62Zu');
INSERT INTO usuario VALUES (913, 'Mark Bryant', '3 Elka Plaza', 'mbryantpc@weibo.com', 'mbryantpc', '6C2m0Ibn3o');
INSERT INTO usuario VALUES (914, 'Carl Shaw', '53769 Linden Parkway', 'cshawpd@zdnet.com', 'cshawpd', 'KTJR4lTzC');
INSERT INTO usuario VALUES (915, 'Paul Hamilton', '6624 Center Circle', 'phamiltonpe@amazonaws.com', 'phamiltonpe', 'E6rUEdyQ3');
INSERT INTO usuario VALUES (916, 'Thomas Schmidt', '08020 Schlimgen Alley', 'tschmidtpf@uol.com.br', 'tschmidtpf', 'RNAAjbqnWG');
INSERT INTO usuario VALUES (917, 'Bonnie Webb', '37228 Butterfield Circle', 'bwebbpg@infoseek.co.jp', 'bwebbpg', 'UueV8lXq');
INSERT INTO usuario VALUES (918, 'Doris Richards', '3 Buell Alley', 'drichardsph@sakura.ne.jp', 'drichardsph', 'Tu0zXHrP');
INSERT INTO usuario VALUES (919, 'Kelly Moore', '8 Marquette Parkway', 'kmoorepi@apache.org', 'kmoorepi', 'f9CjPuEY2');
INSERT INTO usuario VALUES (920, 'Patrick Griffin', '42475 High Crossing Road', 'pgriffinpj@google.de', 'pgriffinpj', 'FvCPIb7JE');
INSERT INTO usuario VALUES (921, 'Aaron Price', '88 Lawn Park', 'apricepk@house.gov', 'apricepk', 'CYlkTA');
INSERT INTO usuario VALUES (922, 'William Patterson', '5 Reinke Street', 'wpattersonpl@amazon.de', 'wpattersonpl', 'ff2R6xMRiQO');
INSERT INTO usuario VALUES (923, 'Thomas Welch', '88 Delaware Trail', 'twelchpm@mysql.com', 'twelchpm', 'UhFNuVC8AMV');
INSERT INTO usuario VALUES (924, 'Steven Cunningham', '58077 Gateway Street', 'scunninghampn@skyrock.com', 'scunninghampn', 'l0l75CCj7kXN');
INSERT INTO usuario VALUES (925, 'George Wagner', '744 Schiller Street', 'gwagnerpo@cbslocal.com', 'gwagnerpo', 'u6TMCaYLU07');
INSERT INTO usuario VALUES (926, 'Christine Fowler', '3 Morrow Circle', 'cfowlerpp@apache.org', 'cfowlerpp', 'vuHLlfg2');
INSERT INTO usuario VALUES (927, 'Wayne Harrison', '28 Mifflin Pass', 'wharrisonpq@ftc.gov', 'wharrisonpq', 'M2khi3cY');
INSERT INTO usuario VALUES (928, 'Emily George', '76671 Eggendart Terrace', 'egeorgepr@mediafire.com', 'egeorgepr', 'DgekMT2');
INSERT INTO usuario VALUES (929, 'Tammy Gray', '5369 Reinke Point', 'tgrayps@salon.com', 'tgrayps', 'YlYDgsoQl');
INSERT INTO usuario VALUES (930, 'Mildred Hansen', '8 Harper Court', 'mhansenpt@free.fr', 'mhansenpt', 'PgAJjhU');
INSERT INTO usuario VALUES (931, 'Carlos Burke', '0 Troy Alley', 'cburkepu@usnews.com', 'cburkepu', 'QHrXJQfrV');
INSERT INTO usuario VALUES (932, 'Tina Olson', '519 Duke Avenue', 'tolsonpv@icq.com', 'tolsonpv', 'zne0CavUPZ');
INSERT INTO usuario VALUES (933, 'William Cunningham', '24791 Saint Paul Point', 'wcunninghampw@sogou.com', 'wcunninghampw', 'DMtBU1d0');
INSERT INTO usuario VALUES (934, 'Steven Miller', '76185 Burrows Crossing', 'smillerpx@columbia.edu', 'smillerpx', 'BONUezFv');
INSERT INTO usuario VALUES (935, 'Samuel Murray', '9 Anniversary Trail', 'smurraypy@hud.gov', 'smurraypy', 'DJDC6Dq');
INSERT INTO usuario VALUES (936, 'Evelyn Coleman', '7 Kenwood Center', 'ecolemanpz@jigsy.com', 'ecolemanpz', 'K32iuk');
INSERT INTO usuario VALUES (937, 'Brenda Chavez', '822 Center Crossing', 'bchavezq0@last.fm', 'bchavezq0', 'SiNbcT9hooNa');
INSERT INTO usuario VALUES (938, 'Frances Fowler', '8343 Armistice Circle', 'ffowlerq1@so-net.ne.jp', 'ffowlerq1', 'GhuIJpF0o');
INSERT INTO usuario VALUES (939, 'Heather Johnston', '9 Mayfield Pass', 'hjohnstonq2@wsj.com', 'hjohnstonq2', 'jG3POQ825');
INSERT INTO usuario VALUES (940, 'Phyllis Long', '95 Burrows Alley', 'plongq3@shop-pro.jp', 'plongq3', 'iksXoy3');
INSERT INTO usuario VALUES (941, 'Nicole Hanson', '886 Pierstorff Point', 'nhansonq4@indiegogo.com', 'nhansonq4', 'aBDPtfq');
INSERT INTO usuario VALUES (942, 'Tammy Murray', '06002 2nd Circle', 'tmurrayq5@hexun.com', 'tmurrayq5', 'xHwODL');
INSERT INTO usuario VALUES (943, 'Ashley Perry', '7 Summer Ridge Park', 'aperryq6@squidoo.com', 'aperryq6', 'p5YVkf7HO');
INSERT INTO usuario VALUES (944, 'Paul Burns', '78 Stoughton Crossing', 'pburnsq7@mapy.cz', 'pburnsq7', 'hw6tZpVT');
INSERT INTO usuario VALUES (945, 'Thomas Hunter', '32 Artisan Parkway', 'thunterq8@mtv.com', 'thunterq8', 'K2mr5C');
INSERT INTO usuario VALUES (946, 'Justin Burke', '0 Ilene Plaza', 'jburkeq9@zimbio.com', 'jburkeq9', 'UvhsvpJWl1');
INSERT INTO usuario VALUES (947, 'Jimmy Owens', '14816 Talisman Alley', 'jowensqa@nifty.com', 'jowensqa', '7bxTuurHFHle');
INSERT INTO usuario VALUES (948, 'Karen Black', '264 Everett Road', 'kblackqb@bbc.co.uk', 'kblackqb', 'tBGehl');
INSERT INTO usuario VALUES (949, 'Paula Perkins', '99 Huxley Street', 'pperkinsqc@economist.com', 'pperkinsqc', 'TojALn');
INSERT INTO usuario VALUES (950, 'Frances Burns', '9015 Golf View Park', 'fburnsqd@i2i.jp', 'fburnsqd', 'oIGVwPLYrQw');
INSERT INTO usuario VALUES (951, 'Benjamin Richardson', '5 Forest Run Lane', 'brichardsonqe@google.pl', 'brichardsonqe', 'YoS9eI');
INSERT INTO usuario VALUES (952, 'Carol Gonzales', '189 Calypso Hill', 'cgonzalesqf@wikimedia.org', 'cgonzalesqf', 'ICrvz7hH2xO');
INSERT INTO usuario VALUES (953, 'Tina Berry', '437 Debs Center', 'tberryqg@cdc.gov', 'tberryqg', 'M8PrpWp8B');
INSERT INTO usuario VALUES (954, 'Wayne Cruz', '28827 Rusk Point', 'wcruzqh@cbc.ca', 'wcruzqh', 'XsjN07l');
INSERT INTO usuario VALUES (955, 'Eric Patterson', '098 Gateway Crossing', 'epattersonqi@scientificamerican.com', 'epattersonqi', '8IXF6tyDzXb');
INSERT INTO usuario VALUES (956, 'Ruby Reyes', '0 Myrtle Park', 'rreyesqj@163.com', 'rreyesqj', 'gR36CSX');
INSERT INTO usuario VALUES (957, 'Victor Griffin', '7 Pleasure Circle', 'vgriffinqk@hud.gov', 'vgriffinqk', 'E9RosSawz');
INSERT INTO usuario VALUES (958, 'Phillip Dixon', '9409 Banding Road', 'pdixonql@mit.edu', 'pdixonql', 'DojfV0KmY2');
INSERT INTO usuario VALUES (959, 'Howard Gilbert', '1513 Cardinal Terrace', 'hgilbertqm@mlb.com', 'hgilbertqm', 'BzOww4Vhk');
INSERT INTO usuario VALUES (960, 'Jane Peters', '340 Washington Place', 'jpetersqn@netlog.com', 'jpetersqn', 'DkCft2uu');
INSERT INTO usuario VALUES (961, 'Emily Martinez', '34350 John Wall Street', 'emartinezqo@infoseek.co.jp', 'emartinezqo', 'noXgh30J');
INSERT INTO usuario VALUES (962, 'Lois Carroll', '0989 Prairie Rose Junction', 'lcarrollqp@blogs.com', 'lcarrollqp', 'zn0M6zP49');
INSERT INTO usuario VALUES (963, 'David Harvey', '0 Shelley Center', 'dharveyqq@nasa.gov', 'dharveyqq', 'fzvqyRB');
INSERT INTO usuario VALUES (964, 'Jane Stone', '04765 Susan Point', 'jstoneqr@comcast.net', 'jstoneqr', 'DAoQwdHxd');
INSERT INTO usuario VALUES (965, 'Jack Mills', '866 Colorado Point', 'jmillsqs@163.com', 'jmillsqs', 'vfw5cmJOfZ');
INSERT INTO usuario VALUES (966, 'Bonnie Anderson', '19468 Beilfuss Way', 'bandersonqt@wiley.com', 'bandersonqt', '7gpO4GaCz');
INSERT INTO usuario VALUES (967, 'Stephanie Wright', '05185 Ludington Road', 'swrightqu@myspace.com', 'swrightqu', 'r0nHSG3');
INSERT INTO usuario VALUES (968, 'Maria Cooper', '3464 Cherokee Avenue', 'mcooperqv@lycos.com', 'mcooperqv', '4es2qdve0');
INSERT INTO usuario VALUES (969, 'Jean Ramirez', '5 Dahle Road', 'jramirezqw@amazon.co.uk', 'jramirezqw', 'gUTfhQiiY35z');
INSERT INTO usuario VALUES (970, 'Edward Jones', '8235 Namekagon Plaza', 'ejonesqx@networkadvertising.org', 'ejonesqx', 'hGfiAx');
INSERT INTO usuario VALUES (971, 'Frank Bennett', '600 Vernon Park', 'fbennettqy@ted.com', 'fbennettqy', 'LgRyfoG8W2tM');
INSERT INTO usuario VALUES (972, 'Rebecca Cruz', '74 Heath Hill', 'rcruzqz@merriam-webster.com', 'rcruzqz', 'pJ1GT3aapK');
INSERT INTO usuario VALUES (973, 'Daniel Thompson', '0 Packers Park', 'dthompsonr0@comcast.net', 'dthompsonr0', 'dtNjDJer');
INSERT INTO usuario VALUES (974, 'Willie Gordon', '098 Glacier Hill Road', 'wgordonr1@tuttocitta.it', 'wgordonr1', 'zHoUVzD');
INSERT INTO usuario VALUES (975, 'Jennifer Cox', '1 Harbort Court', 'jcoxr2@usda.gov', 'jcoxr2', 'iTYADfweAw');
INSERT INTO usuario VALUES (976, 'John Cruz', '4528 Columbus Drive', 'jcruzr3@narod.ru', 'jcruzr3', 'r3vqDZCXC');
INSERT INTO usuario VALUES (977, 'Maria Bishop', '5 Evergreen Street', 'mbishopr4@illinois.edu', 'mbishopr4', '5qC99t');
INSERT INTO usuario VALUES (978, 'Irene Cooper', '214 Chive Park', 'icooperr5@gizmodo.com', 'icooperr5', 'KMq6I09PQ');
INSERT INTO usuario VALUES (979, 'Frank Rice', '984 Ilene Point', 'fricer6@army.mil', 'fricer6', 'hFaeUzC9K');
INSERT INTO usuario VALUES (980, 'Kathleen Nelson', '6 Express Crossing', 'knelsonr7@devhub.com', 'knelsonr7', 'IHocjiNn4');
INSERT INTO usuario VALUES (981, 'Paul Sullivan', '1 Evergreen Junction', 'psullivanr8@unesco.org', 'psullivanr8', 'zhXrWdj02');
INSERT INTO usuario VALUES (982, 'Joan Welch', '7093 Warrior Drive', 'jwelchr9@fema.gov', 'jwelchr9', 'jEh7Z0X4b4M7');
INSERT INTO usuario VALUES (983, 'Jessica Hawkins', '70 Kingsford Park', 'jhawkinsra@tripadvisor.com', 'jhawkinsra', 'S6DY1vlwh');
INSERT INTO usuario VALUES (984, 'George Ramirez', '5 Straubel Crossing', 'gramirezrb@java.com', 'gramirezrb', 'HsI2zHFfn');
INSERT INTO usuario VALUES (985, 'Paul Bishop', '244 Calypso Trail', 'pbishoprc@netscape.com', 'pbishoprc', 'EyG6odxA');
INSERT INTO usuario VALUES (986, 'Mark Rice', '9 Cardinal Road', 'mricerd@soup.io', 'mricerd', 'yet0Y5kKp4');
INSERT INTO usuario VALUES (987, 'Lillian Harris', '59596 Scott Drive', 'lharrisre@independent.co.uk', 'lharrisre', 'IxpebU');
INSERT INTO usuario VALUES (988, 'Jean Cook', '72 Reindahl Plaza', 'jcookrf@oracle.com', 'jcookrf', 'vmHEEpm');
INSERT INTO usuario VALUES (989, 'Frances Stephens', '62757 Northland Pass', 'fstephensrg@xrea.com', 'fstephensrg', 'j4ZrxLlU2');
INSERT INTO usuario VALUES (990, 'Ashley Lewis', '683 Corry Drive', 'alewisrh@biglobe.ne.jp', 'alewisrh', 'scjROmauFzB');
INSERT INTO usuario VALUES (991, 'Anthony Wilson', '656 Pearson Terrace', 'awilsonri@amazon.com', 'awilsonri', 'T0e30gCH');
INSERT INTO usuario VALUES (992, 'Betty Perry', '2243 Donald Lane', 'bperryrj@oracle.com', 'bperryrj', 'YlGqKP3jKh');
INSERT INTO usuario VALUES (993, 'Deborah Carter', '34735 Tony Court', 'dcarterrk@jiathis.com', 'dcarterrk', 'tTBXt30rE');
INSERT INTO usuario VALUES (994, 'Christopher Grant', '039 Buell Center', 'cgrantrl@google.ca', 'cgrantrl', '9bYPp82Yp');
INSERT INTO usuario VALUES (995, 'Jose Matthews', '29234 Forster Junction', 'jmatthewsrm@surveymonkey.com', 'jmatthewsrm', 'SOuP7UsS');
INSERT INTO usuario VALUES (996, 'Joe Bennett', '2194 Manley Junction', 'jbennettrn@surveymonkey.com', 'jbennettrn', 'jnbjpCFw');
INSERT INTO usuario VALUES (997, 'Jennifer Peters', '4764 Tennessee Junction', 'jpetersro@foxnews.com', 'jpetersro', '6EEl62m1S');
INSERT INTO usuario VALUES (998, 'Brandon Elliott', '3 Little Fleur Court', 'belliottrp@oaic.gov.au', 'belliottrp', 'WO6IlM80cUpr');
INSERT INTO usuario VALUES (999, 'Ruby Mason', '91 Talisman Point', 'rmasonrq@nsw.gov.au', 'rmasonrq', 'kbwzRo');
INSERT INTO usuario VALUES (1000, 'Janet Dunn', '4 Lindbergh Drive', 'jdunnrr@usatoday.com', 'jdunnrr', 'k29K7UetHbvx');


--
-- TOC entry 2196 (class 0 OID 16675)
-- Dependencies: 183
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente VALUES (1);
INSERT INTO cliente VALUES (2);
INSERT INTO cliente VALUES (3);
INSERT INTO cliente VALUES (4);
INSERT INTO cliente VALUES (5);
INSERT INTO cliente VALUES (6);
INSERT INTO cliente VALUES (7);
INSERT INTO cliente VALUES (8);
INSERT INTO cliente VALUES (9);
INSERT INTO cliente VALUES (11);
INSERT INTO cliente VALUES (12);
INSERT INTO cliente VALUES (13);
INSERT INTO cliente VALUES (14);
INSERT INTO cliente VALUES (15);
INSERT INTO cliente VALUES (16);
INSERT INTO cliente VALUES (17);
INSERT INTO cliente VALUES (18);
INSERT INTO cliente VALUES (19);
INSERT INTO cliente VALUES (20);
INSERT INTO cliente VALUES (21);
INSERT INTO cliente VALUES (22);
INSERT INTO cliente VALUES (23);
INSERT INTO cliente VALUES (24);
INSERT INTO cliente VALUES (25);
INSERT INTO cliente VALUES (26);
INSERT INTO cliente VALUES (27);
INSERT INTO cliente VALUES (28);
INSERT INTO cliente VALUES (29);
INSERT INTO cliente VALUES (30);
INSERT INTO cliente VALUES (31);
INSERT INTO cliente VALUES (32);
INSERT INTO cliente VALUES (33);
INSERT INTO cliente VALUES (34);
INSERT INTO cliente VALUES (35);
INSERT INTO cliente VALUES (36);
INSERT INTO cliente VALUES (37);
INSERT INTO cliente VALUES (38);
INSERT INTO cliente VALUES (39);
INSERT INTO cliente VALUES (40);
INSERT INTO cliente VALUES (41);
INSERT INTO cliente VALUES (42);
INSERT INTO cliente VALUES (43);
INSERT INTO cliente VALUES (44);
INSERT INTO cliente VALUES (45);
INSERT INTO cliente VALUES (46);
INSERT INTO cliente VALUES (47);
INSERT INTO cliente VALUES (48);
INSERT INTO cliente VALUES (49);
INSERT INTO cliente VALUES (50);
INSERT INTO cliente VALUES (51);
INSERT INTO cliente VALUES (52);
INSERT INTO cliente VALUES (53);
INSERT INTO cliente VALUES (54);
INSERT INTO cliente VALUES (55);
INSERT INTO cliente VALUES (56);
INSERT INTO cliente VALUES (57);
INSERT INTO cliente VALUES (58);
INSERT INTO cliente VALUES (59);
INSERT INTO cliente VALUES (60);
INSERT INTO cliente VALUES (61);
INSERT INTO cliente VALUES (62);
INSERT INTO cliente VALUES (63);
INSERT INTO cliente VALUES (64);
INSERT INTO cliente VALUES (65);
INSERT INTO cliente VALUES (66);
INSERT INTO cliente VALUES (67);
INSERT INTO cliente VALUES (68);
INSERT INTO cliente VALUES (69);
INSERT INTO cliente VALUES (70);
INSERT INTO cliente VALUES (71);
INSERT INTO cliente VALUES (72);
INSERT INTO cliente VALUES (73);
INSERT INTO cliente VALUES (74);
INSERT INTO cliente VALUES (75);
INSERT INTO cliente VALUES (76);
INSERT INTO cliente VALUES (77);
INSERT INTO cliente VALUES (78);
INSERT INTO cliente VALUES (79);
INSERT INTO cliente VALUES (80);
INSERT INTO cliente VALUES (81);
INSERT INTO cliente VALUES (82);
INSERT INTO cliente VALUES (83);
INSERT INTO cliente VALUES (84);
INSERT INTO cliente VALUES (85);
INSERT INTO cliente VALUES (86);
INSERT INTO cliente VALUES (87);
INSERT INTO cliente VALUES (88);
INSERT INTO cliente VALUES (89);
INSERT INTO cliente VALUES (90);
INSERT INTO cliente VALUES (91);
INSERT INTO cliente VALUES (92);
INSERT INTO cliente VALUES (93);
INSERT INTO cliente VALUES (94);
INSERT INTO cliente VALUES (95);
INSERT INTO cliente VALUES (96);
INSERT INTO cliente VALUES (97);
INSERT INTO cliente VALUES (98);
INSERT INTO cliente VALUES (99);
INSERT INTO cliente VALUES (100);
INSERT INTO cliente VALUES (101);
INSERT INTO cliente VALUES (102);
INSERT INTO cliente VALUES (103);
INSERT INTO cliente VALUES (104);
INSERT INTO cliente VALUES (105);
INSERT INTO cliente VALUES (106);
INSERT INTO cliente VALUES (107);
INSERT INTO cliente VALUES (108);
INSERT INTO cliente VALUES (109);
INSERT INTO cliente VALUES (110);
INSERT INTO cliente VALUES (111);
INSERT INTO cliente VALUES (112);
INSERT INTO cliente VALUES (113);
INSERT INTO cliente VALUES (114);
INSERT INTO cliente VALUES (115);
INSERT INTO cliente VALUES (116);
INSERT INTO cliente VALUES (117);
INSERT INTO cliente VALUES (118);
INSERT INTO cliente VALUES (119);
INSERT INTO cliente VALUES (120);
INSERT INTO cliente VALUES (121);
INSERT INTO cliente VALUES (122);
INSERT INTO cliente VALUES (123);
INSERT INTO cliente VALUES (124);
INSERT INTO cliente VALUES (125);
INSERT INTO cliente VALUES (126);
INSERT INTO cliente VALUES (127);
INSERT INTO cliente VALUES (128);
INSERT INTO cliente VALUES (129);
INSERT INTO cliente VALUES (130);
INSERT INTO cliente VALUES (131);
INSERT INTO cliente VALUES (132);
INSERT INTO cliente VALUES (133);
INSERT INTO cliente VALUES (134);
INSERT INTO cliente VALUES (135);
INSERT INTO cliente VALUES (136);
INSERT INTO cliente VALUES (137);
INSERT INTO cliente VALUES (138);
INSERT INTO cliente VALUES (139);
INSERT INTO cliente VALUES (140);
INSERT INTO cliente VALUES (141);
INSERT INTO cliente VALUES (142);
INSERT INTO cliente VALUES (143);
INSERT INTO cliente VALUES (144);
INSERT INTO cliente VALUES (145);
INSERT INTO cliente VALUES (146);
INSERT INTO cliente VALUES (147);
INSERT INTO cliente VALUES (148);
INSERT INTO cliente VALUES (149);
INSERT INTO cliente VALUES (150);
INSERT INTO cliente VALUES (151);
INSERT INTO cliente VALUES (152);
INSERT INTO cliente VALUES (153);
INSERT INTO cliente VALUES (154);
INSERT INTO cliente VALUES (155);
INSERT INTO cliente VALUES (156);
INSERT INTO cliente VALUES (157);
INSERT INTO cliente VALUES (158);
INSERT INTO cliente VALUES (159);
INSERT INTO cliente VALUES (160);
INSERT INTO cliente VALUES (161);
INSERT INTO cliente VALUES (162);
INSERT INTO cliente VALUES (163);
INSERT INTO cliente VALUES (164);
INSERT INTO cliente VALUES (165);
INSERT INTO cliente VALUES (166);
INSERT INTO cliente VALUES (167);
INSERT INTO cliente VALUES (168);
INSERT INTO cliente VALUES (169);
INSERT INTO cliente VALUES (170);
INSERT INTO cliente VALUES (171);
INSERT INTO cliente VALUES (172);
INSERT INTO cliente VALUES (173);
INSERT INTO cliente VALUES (174);
INSERT INTO cliente VALUES (175);
INSERT INTO cliente VALUES (176);
INSERT INTO cliente VALUES (177);
INSERT INTO cliente VALUES (178);
INSERT INTO cliente VALUES (179);
INSERT INTO cliente VALUES (180);
INSERT INTO cliente VALUES (181);
INSERT INTO cliente VALUES (182);
INSERT INTO cliente VALUES (183);
INSERT INTO cliente VALUES (184);
INSERT INTO cliente VALUES (185);
INSERT INTO cliente VALUES (186);
INSERT INTO cliente VALUES (187);
INSERT INTO cliente VALUES (188);
INSERT INTO cliente VALUES (189);
INSERT INTO cliente VALUES (190);
INSERT INTO cliente VALUES (191);
INSERT INTO cliente VALUES (192);
INSERT INTO cliente VALUES (193);
INSERT INTO cliente VALUES (194);
INSERT INTO cliente VALUES (195);
INSERT INTO cliente VALUES (196);
INSERT INTO cliente VALUES (197);
INSERT INTO cliente VALUES (198);
INSERT INTO cliente VALUES (199);
INSERT INTO cliente VALUES (200);
INSERT INTO cliente VALUES (201);
INSERT INTO cliente VALUES (202);
INSERT INTO cliente VALUES (203);
INSERT INTO cliente VALUES (204);
INSERT INTO cliente VALUES (205);
INSERT INTO cliente VALUES (206);
INSERT INTO cliente VALUES (207);
INSERT INTO cliente VALUES (208);
INSERT INTO cliente VALUES (209);
INSERT INTO cliente VALUES (210);
INSERT INTO cliente VALUES (211);
INSERT INTO cliente VALUES (212);
INSERT INTO cliente VALUES (213);
INSERT INTO cliente VALUES (214);
INSERT INTO cliente VALUES (215);
INSERT INTO cliente VALUES (216);
INSERT INTO cliente VALUES (217);
INSERT INTO cliente VALUES (218);
INSERT INTO cliente VALUES (219);
INSERT INTO cliente VALUES (220);
INSERT INTO cliente VALUES (221);
INSERT INTO cliente VALUES (222);
INSERT INTO cliente VALUES (223);
INSERT INTO cliente VALUES (224);
INSERT INTO cliente VALUES (225);
INSERT INTO cliente VALUES (226);
INSERT INTO cliente VALUES (227);
INSERT INTO cliente VALUES (228);
INSERT INTO cliente VALUES (229);
INSERT INTO cliente VALUES (230);
INSERT INTO cliente VALUES (231);
INSERT INTO cliente VALUES (232);
INSERT INTO cliente VALUES (233);
INSERT INTO cliente VALUES (234);
INSERT INTO cliente VALUES (235);
INSERT INTO cliente VALUES (236);
INSERT INTO cliente VALUES (237);
INSERT INTO cliente VALUES (238);
INSERT INTO cliente VALUES (239);
INSERT INTO cliente VALUES (240);
INSERT INTO cliente VALUES (241);
INSERT INTO cliente VALUES (242);
INSERT INTO cliente VALUES (243);
INSERT INTO cliente VALUES (244);
INSERT INTO cliente VALUES (245);
INSERT INTO cliente VALUES (246);
INSERT INTO cliente VALUES (247);
INSERT INTO cliente VALUES (248);
INSERT INTO cliente VALUES (249);
INSERT INTO cliente VALUES (250);
INSERT INTO cliente VALUES (251);
INSERT INTO cliente VALUES (252);
INSERT INTO cliente VALUES (253);
INSERT INTO cliente VALUES (254);
INSERT INTO cliente VALUES (255);
INSERT INTO cliente VALUES (256);
INSERT INTO cliente VALUES (257);
INSERT INTO cliente VALUES (258);
INSERT INTO cliente VALUES (259);
INSERT INTO cliente VALUES (260);
INSERT INTO cliente VALUES (261);
INSERT INTO cliente VALUES (262);
INSERT INTO cliente VALUES (263);
INSERT INTO cliente VALUES (264);
INSERT INTO cliente VALUES (265);
INSERT INTO cliente VALUES (266);
INSERT INTO cliente VALUES (267);
INSERT INTO cliente VALUES (268);
INSERT INTO cliente VALUES (269);
INSERT INTO cliente VALUES (270);
INSERT INTO cliente VALUES (271);
INSERT INTO cliente VALUES (272);
INSERT INTO cliente VALUES (273);
INSERT INTO cliente VALUES (274);
INSERT INTO cliente VALUES (275);
INSERT INTO cliente VALUES (276);
INSERT INTO cliente VALUES (277);
INSERT INTO cliente VALUES (278);
INSERT INTO cliente VALUES (279);
INSERT INTO cliente VALUES (280);
INSERT INTO cliente VALUES (281);
INSERT INTO cliente VALUES (282);
INSERT INTO cliente VALUES (283);
INSERT INTO cliente VALUES (284);
INSERT INTO cliente VALUES (285);
INSERT INTO cliente VALUES (286);
INSERT INTO cliente VALUES (287);
INSERT INTO cliente VALUES (288);
INSERT INTO cliente VALUES (289);
INSERT INTO cliente VALUES (290);
INSERT INTO cliente VALUES (291);
INSERT INTO cliente VALUES (292);
INSERT INTO cliente VALUES (293);
INSERT INTO cliente VALUES (294);
INSERT INTO cliente VALUES (295);
INSERT INTO cliente VALUES (296);
INSERT INTO cliente VALUES (297);
INSERT INTO cliente VALUES (298);
INSERT INTO cliente VALUES (299);
INSERT INTO cliente VALUES (300);
INSERT INTO cliente VALUES (301);
INSERT INTO cliente VALUES (302);
INSERT INTO cliente VALUES (303);
INSERT INTO cliente VALUES (304);
INSERT INTO cliente VALUES (305);
INSERT INTO cliente VALUES (306);
INSERT INTO cliente VALUES (307);
INSERT INTO cliente VALUES (308);
INSERT INTO cliente VALUES (309);
INSERT INTO cliente VALUES (310);
INSERT INTO cliente VALUES (311);
INSERT INTO cliente VALUES (312);
INSERT INTO cliente VALUES (313);
INSERT INTO cliente VALUES (314);
INSERT INTO cliente VALUES (315);
INSERT INTO cliente VALUES (316);
INSERT INTO cliente VALUES (317);
INSERT INTO cliente VALUES (318);
INSERT INTO cliente VALUES (319);
INSERT INTO cliente VALUES (320);
INSERT INTO cliente VALUES (321);
INSERT INTO cliente VALUES (322);
INSERT INTO cliente VALUES (323);
INSERT INTO cliente VALUES (324);
INSERT INTO cliente VALUES (325);
INSERT INTO cliente VALUES (326);
INSERT INTO cliente VALUES (327);
INSERT INTO cliente VALUES (328);
INSERT INTO cliente VALUES (329);
INSERT INTO cliente VALUES (330);
INSERT INTO cliente VALUES (331);
INSERT INTO cliente VALUES (332);
INSERT INTO cliente VALUES (333);
INSERT INTO cliente VALUES (334);
INSERT INTO cliente VALUES (335);
INSERT INTO cliente VALUES (336);
INSERT INTO cliente VALUES (337);
INSERT INTO cliente VALUES (338);
INSERT INTO cliente VALUES (339);
INSERT INTO cliente VALUES (340);
INSERT INTO cliente VALUES (341);
INSERT INTO cliente VALUES (342);
INSERT INTO cliente VALUES (343);
INSERT INTO cliente VALUES (344);
INSERT INTO cliente VALUES (345);
INSERT INTO cliente VALUES (346);
INSERT INTO cliente VALUES (347);
INSERT INTO cliente VALUES (348);
INSERT INTO cliente VALUES (349);
INSERT INTO cliente VALUES (350);
INSERT INTO cliente VALUES (351);
INSERT INTO cliente VALUES (352);
INSERT INTO cliente VALUES (353);
INSERT INTO cliente VALUES (354);
INSERT INTO cliente VALUES (355);
INSERT INTO cliente VALUES (356);
INSERT INTO cliente VALUES (357);
INSERT INTO cliente VALUES (358);
INSERT INTO cliente VALUES (359);
INSERT INTO cliente VALUES (360);
INSERT INTO cliente VALUES (361);
INSERT INTO cliente VALUES (362);
INSERT INTO cliente VALUES (363);
INSERT INTO cliente VALUES (364);
INSERT INTO cliente VALUES (365);
INSERT INTO cliente VALUES (366);
INSERT INTO cliente VALUES (367);
INSERT INTO cliente VALUES (368);
INSERT INTO cliente VALUES (369);
INSERT INTO cliente VALUES (370);
INSERT INTO cliente VALUES (371);
INSERT INTO cliente VALUES (372);
INSERT INTO cliente VALUES (373);
INSERT INTO cliente VALUES (374);
INSERT INTO cliente VALUES (375);
INSERT INTO cliente VALUES (376);
INSERT INTO cliente VALUES (377);
INSERT INTO cliente VALUES (378);
INSERT INTO cliente VALUES (379);
INSERT INTO cliente VALUES (380);
INSERT INTO cliente VALUES (381);
INSERT INTO cliente VALUES (382);
INSERT INTO cliente VALUES (383);
INSERT INTO cliente VALUES (384);
INSERT INTO cliente VALUES (385);
INSERT INTO cliente VALUES (386);
INSERT INTO cliente VALUES (387);
INSERT INTO cliente VALUES (388);
INSERT INTO cliente VALUES (389);
INSERT INTO cliente VALUES (390);
INSERT INTO cliente VALUES (391);
INSERT INTO cliente VALUES (392);
INSERT INTO cliente VALUES (393);
INSERT INTO cliente VALUES (394);
INSERT INTO cliente VALUES (395);
INSERT INTO cliente VALUES (396);
INSERT INTO cliente VALUES (397);
INSERT INTO cliente VALUES (398);
INSERT INTO cliente VALUES (399);
INSERT INTO cliente VALUES (400);
INSERT INTO cliente VALUES (401);
INSERT INTO cliente VALUES (402);
INSERT INTO cliente VALUES (403);
INSERT INTO cliente VALUES (404);
INSERT INTO cliente VALUES (405);
INSERT INTO cliente VALUES (406);
INSERT INTO cliente VALUES (407);
INSERT INTO cliente VALUES (408);
INSERT INTO cliente VALUES (409);
INSERT INTO cliente VALUES (410);
INSERT INTO cliente VALUES (411);
INSERT INTO cliente VALUES (412);
INSERT INTO cliente VALUES (413);
INSERT INTO cliente VALUES (414);
INSERT INTO cliente VALUES (415);
INSERT INTO cliente VALUES (416);
INSERT INTO cliente VALUES (417);
INSERT INTO cliente VALUES (418);
INSERT INTO cliente VALUES (419);
INSERT INTO cliente VALUES (420);
INSERT INTO cliente VALUES (421);
INSERT INTO cliente VALUES (422);
INSERT INTO cliente VALUES (423);
INSERT INTO cliente VALUES (424);
INSERT INTO cliente VALUES (425);
INSERT INTO cliente VALUES (426);
INSERT INTO cliente VALUES (427);
INSERT INTO cliente VALUES (428);
INSERT INTO cliente VALUES (429);
INSERT INTO cliente VALUES (430);
INSERT INTO cliente VALUES (431);
INSERT INTO cliente VALUES (432);
INSERT INTO cliente VALUES (433);
INSERT INTO cliente VALUES (434);
INSERT INTO cliente VALUES (435);
INSERT INTO cliente VALUES (436);
INSERT INTO cliente VALUES (437);
INSERT INTO cliente VALUES (438);
INSERT INTO cliente VALUES (439);
INSERT INTO cliente VALUES (440);
INSERT INTO cliente VALUES (441);
INSERT INTO cliente VALUES (442);
INSERT INTO cliente VALUES (443);
INSERT INTO cliente VALUES (444);
INSERT INTO cliente VALUES (445);
INSERT INTO cliente VALUES (446);
INSERT INTO cliente VALUES (447);
INSERT INTO cliente VALUES (448);
INSERT INTO cliente VALUES (449);
INSERT INTO cliente VALUES (450);
INSERT INTO cliente VALUES (451);
INSERT INTO cliente VALUES (452);
INSERT INTO cliente VALUES (453);
INSERT INTO cliente VALUES (454);
INSERT INTO cliente VALUES (455);
INSERT INTO cliente VALUES (456);
INSERT INTO cliente VALUES (457);
INSERT INTO cliente VALUES (458);
INSERT INTO cliente VALUES (459);
INSERT INTO cliente VALUES (460);
INSERT INTO cliente VALUES (461);
INSERT INTO cliente VALUES (462);
INSERT INTO cliente VALUES (463);
INSERT INTO cliente VALUES (464);
INSERT INTO cliente VALUES (465);
INSERT INTO cliente VALUES (466);
INSERT INTO cliente VALUES (467);
INSERT INTO cliente VALUES (468);
INSERT INTO cliente VALUES (469);
INSERT INTO cliente VALUES (470);
INSERT INTO cliente VALUES (471);
INSERT INTO cliente VALUES (472);
INSERT INTO cliente VALUES (473);
INSERT INTO cliente VALUES (474);
INSERT INTO cliente VALUES (475);
INSERT INTO cliente VALUES (476);
INSERT INTO cliente VALUES (477);
INSERT INTO cliente VALUES (478);
INSERT INTO cliente VALUES (479);
INSERT INTO cliente VALUES (480);
INSERT INTO cliente VALUES (481);
INSERT INTO cliente VALUES (482);
INSERT INTO cliente VALUES (483);
INSERT INTO cliente VALUES (484);
INSERT INTO cliente VALUES (485);
INSERT INTO cliente VALUES (486);
INSERT INTO cliente VALUES (487);
INSERT INTO cliente VALUES (488);
INSERT INTO cliente VALUES (489);
INSERT INTO cliente VALUES (490);
INSERT INTO cliente VALUES (491);
INSERT INTO cliente VALUES (492);
INSERT INTO cliente VALUES (493);
INSERT INTO cliente VALUES (494);
INSERT INTO cliente VALUES (495);
INSERT INTO cliente VALUES (496);
INSERT INTO cliente VALUES (497);
INSERT INTO cliente VALUES (498);
INSERT INTO cliente VALUES (499);
INSERT INTO cliente VALUES (500);
INSERT INTO cliente VALUES (501);
INSERT INTO cliente VALUES (502);
INSERT INTO cliente VALUES (503);
INSERT INTO cliente VALUES (504);
INSERT INTO cliente VALUES (505);
INSERT INTO cliente VALUES (506);
INSERT INTO cliente VALUES (507);
INSERT INTO cliente VALUES (508);
INSERT INTO cliente VALUES (509);
INSERT INTO cliente VALUES (510);
INSERT INTO cliente VALUES (511);
INSERT INTO cliente VALUES (512);
INSERT INTO cliente VALUES (513);
INSERT INTO cliente VALUES (514);
INSERT INTO cliente VALUES (515);
INSERT INTO cliente VALUES (516);
INSERT INTO cliente VALUES (517);
INSERT INTO cliente VALUES (518);
INSERT INTO cliente VALUES (519);
INSERT INTO cliente VALUES (520);
INSERT INTO cliente VALUES (521);
INSERT INTO cliente VALUES (522);
INSERT INTO cliente VALUES (523);
INSERT INTO cliente VALUES (524);
INSERT INTO cliente VALUES (525);
INSERT INTO cliente VALUES (526);
INSERT INTO cliente VALUES (527);
INSERT INTO cliente VALUES (528);
INSERT INTO cliente VALUES (529);
INSERT INTO cliente VALUES (530);
INSERT INTO cliente VALUES (531);
INSERT INTO cliente VALUES (532);
INSERT INTO cliente VALUES (533);
INSERT INTO cliente VALUES (534);
INSERT INTO cliente VALUES (535);
INSERT INTO cliente VALUES (536);
INSERT INTO cliente VALUES (537);
INSERT INTO cliente VALUES (538);
INSERT INTO cliente VALUES (539);
INSERT INTO cliente VALUES (540);
INSERT INTO cliente VALUES (541);
INSERT INTO cliente VALUES (542);
INSERT INTO cliente VALUES (543);
INSERT INTO cliente VALUES (544);
INSERT INTO cliente VALUES (545);
INSERT INTO cliente VALUES (546);
INSERT INTO cliente VALUES (547);
INSERT INTO cliente VALUES (548);
INSERT INTO cliente VALUES (549);
INSERT INTO cliente VALUES (550);
INSERT INTO cliente VALUES (551);
INSERT INTO cliente VALUES (552);
INSERT INTO cliente VALUES (553);
INSERT INTO cliente VALUES (554);
INSERT INTO cliente VALUES (555);
INSERT INTO cliente VALUES (556);
INSERT INTO cliente VALUES (557);
INSERT INTO cliente VALUES (558);
INSERT INTO cliente VALUES (559);
INSERT INTO cliente VALUES (560);
INSERT INTO cliente VALUES (561);
INSERT INTO cliente VALUES (562);
INSERT INTO cliente VALUES (563);
INSERT INTO cliente VALUES (564);
INSERT INTO cliente VALUES (565);
INSERT INTO cliente VALUES (566);
INSERT INTO cliente VALUES (567);
INSERT INTO cliente VALUES (568);
INSERT INTO cliente VALUES (569);
INSERT INTO cliente VALUES (570);
INSERT INTO cliente VALUES (571);
INSERT INTO cliente VALUES (572);
INSERT INTO cliente VALUES (573);
INSERT INTO cliente VALUES (574);
INSERT INTO cliente VALUES (575);
INSERT INTO cliente VALUES (576);
INSERT INTO cliente VALUES (577);
INSERT INTO cliente VALUES (578);
INSERT INTO cliente VALUES (579);
INSERT INTO cliente VALUES (580);
INSERT INTO cliente VALUES (581);
INSERT INTO cliente VALUES (582);
INSERT INTO cliente VALUES (583);
INSERT INTO cliente VALUES (584);
INSERT INTO cliente VALUES (585);
INSERT INTO cliente VALUES (586);
INSERT INTO cliente VALUES (587);
INSERT INTO cliente VALUES (588);
INSERT INTO cliente VALUES (589);
INSERT INTO cliente VALUES (590);
INSERT INTO cliente VALUES (591);
INSERT INTO cliente VALUES (592);
INSERT INTO cliente VALUES (593);
INSERT INTO cliente VALUES (594);
INSERT INTO cliente VALUES (595);
INSERT INTO cliente VALUES (596);
INSERT INTO cliente VALUES (597);
INSERT INTO cliente VALUES (598);
INSERT INTO cliente VALUES (599);
INSERT INTO cliente VALUES (600);
INSERT INTO cliente VALUES (601);
INSERT INTO cliente VALUES (602);
INSERT INTO cliente VALUES (603);
INSERT INTO cliente VALUES (604);
INSERT INTO cliente VALUES (605);
INSERT INTO cliente VALUES (606);
INSERT INTO cliente VALUES (607);
INSERT INTO cliente VALUES (608);
INSERT INTO cliente VALUES (609);
INSERT INTO cliente VALUES (610);
INSERT INTO cliente VALUES (611);
INSERT INTO cliente VALUES (612);
INSERT INTO cliente VALUES (613);
INSERT INTO cliente VALUES (614);
INSERT INTO cliente VALUES (615);
INSERT INTO cliente VALUES (616);
INSERT INTO cliente VALUES (617);
INSERT INTO cliente VALUES (618);
INSERT INTO cliente VALUES (619);
INSERT INTO cliente VALUES (620);
INSERT INTO cliente VALUES (621);
INSERT INTO cliente VALUES (622);
INSERT INTO cliente VALUES (623);
INSERT INTO cliente VALUES (624);
INSERT INTO cliente VALUES (625);
INSERT INTO cliente VALUES (626);
INSERT INTO cliente VALUES (627);
INSERT INTO cliente VALUES (628);
INSERT INTO cliente VALUES (629);
INSERT INTO cliente VALUES (630);
INSERT INTO cliente VALUES (631);
INSERT INTO cliente VALUES (632);
INSERT INTO cliente VALUES (633);
INSERT INTO cliente VALUES (634);
INSERT INTO cliente VALUES (635);
INSERT INTO cliente VALUES (636);
INSERT INTO cliente VALUES (637);
INSERT INTO cliente VALUES (638);
INSERT INTO cliente VALUES (639);
INSERT INTO cliente VALUES (640);
INSERT INTO cliente VALUES (641);
INSERT INTO cliente VALUES (642);
INSERT INTO cliente VALUES (643);
INSERT INTO cliente VALUES (644);
INSERT INTO cliente VALUES (645);
INSERT INTO cliente VALUES (646);
INSERT INTO cliente VALUES (647);
INSERT INTO cliente VALUES (648);
INSERT INTO cliente VALUES (649);
INSERT INTO cliente VALUES (650);
INSERT INTO cliente VALUES (651);
INSERT INTO cliente VALUES (652);
INSERT INTO cliente VALUES (653);
INSERT INTO cliente VALUES (654);
INSERT INTO cliente VALUES (655);
INSERT INTO cliente VALUES (656);
INSERT INTO cliente VALUES (657);
INSERT INTO cliente VALUES (658);
INSERT INTO cliente VALUES (659);
INSERT INTO cliente VALUES (660);
INSERT INTO cliente VALUES (661);
INSERT INTO cliente VALUES (662);
INSERT INTO cliente VALUES (663);
INSERT INTO cliente VALUES (664);
INSERT INTO cliente VALUES (665);
INSERT INTO cliente VALUES (666);
INSERT INTO cliente VALUES (667);
INSERT INTO cliente VALUES (668);
INSERT INTO cliente VALUES (669);
INSERT INTO cliente VALUES (670);
INSERT INTO cliente VALUES (671);
INSERT INTO cliente VALUES (672);
INSERT INTO cliente VALUES (673);
INSERT INTO cliente VALUES (674);
INSERT INTO cliente VALUES (675);
INSERT INTO cliente VALUES (676);
INSERT INTO cliente VALUES (677);
INSERT INTO cliente VALUES (678);
INSERT INTO cliente VALUES (679);
INSERT INTO cliente VALUES (680);
INSERT INTO cliente VALUES (681);
INSERT INTO cliente VALUES (682);
INSERT INTO cliente VALUES (683);
INSERT INTO cliente VALUES (684);
INSERT INTO cliente VALUES (685);
INSERT INTO cliente VALUES (686);
INSERT INTO cliente VALUES (687);
INSERT INTO cliente VALUES (688);
INSERT INTO cliente VALUES (689);
INSERT INTO cliente VALUES (690);
INSERT INTO cliente VALUES (691);
INSERT INTO cliente VALUES (692);
INSERT INTO cliente VALUES (693);
INSERT INTO cliente VALUES (694);
INSERT INTO cliente VALUES (695);
INSERT INTO cliente VALUES (696);
INSERT INTO cliente VALUES (697);
INSERT INTO cliente VALUES (698);
INSERT INTO cliente VALUES (699);
INSERT INTO cliente VALUES (700);
INSERT INTO cliente VALUES (701);
INSERT INTO cliente VALUES (702);
INSERT INTO cliente VALUES (703);
INSERT INTO cliente VALUES (704);
INSERT INTO cliente VALUES (705);
INSERT INTO cliente VALUES (706);
INSERT INTO cliente VALUES (707);
INSERT INTO cliente VALUES (708);
INSERT INTO cliente VALUES (709);
INSERT INTO cliente VALUES (710);
INSERT INTO cliente VALUES (711);
INSERT INTO cliente VALUES (712);
INSERT INTO cliente VALUES (713);
INSERT INTO cliente VALUES (714);
INSERT INTO cliente VALUES (715);
INSERT INTO cliente VALUES (716);
INSERT INTO cliente VALUES (717);
INSERT INTO cliente VALUES (718);
INSERT INTO cliente VALUES (719);
INSERT INTO cliente VALUES (720);
INSERT INTO cliente VALUES (721);
INSERT INTO cliente VALUES (722);
INSERT INTO cliente VALUES (723);
INSERT INTO cliente VALUES (724);
INSERT INTO cliente VALUES (725);
INSERT INTO cliente VALUES (726);
INSERT INTO cliente VALUES (727);
INSERT INTO cliente VALUES (728);
INSERT INTO cliente VALUES (729);
INSERT INTO cliente VALUES (730);
INSERT INTO cliente VALUES (731);
INSERT INTO cliente VALUES (732);
INSERT INTO cliente VALUES (733);
INSERT INTO cliente VALUES (734);
INSERT INTO cliente VALUES (735);
INSERT INTO cliente VALUES (736);
INSERT INTO cliente VALUES (737);
INSERT INTO cliente VALUES (738);
INSERT INTO cliente VALUES (739);
INSERT INTO cliente VALUES (740);
INSERT INTO cliente VALUES (741);
INSERT INTO cliente VALUES (742);
INSERT INTO cliente VALUES (743);
INSERT INTO cliente VALUES (744);
INSERT INTO cliente VALUES (745);
INSERT INTO cliente VALUES (746);
INSERT INTO cliente VALUES (747);
INSERT INTO cliente VALUES (748);
INSERT INTO cliente VALUES (749);
INSERT INTO cliente VALUES (750);
INSERT INTO cliente VALUES (751);
INSERT INTO cliente VALUES (752);
INSERT INTO cliente VALUES (753);
INSERT INTO cliente VALUES (754);
INSERT INTO cliente VALUES (755);
INSERT INTO cliente VALUES (756);
INSERT INTO cliente VALUES (757);
INSERT INTO cliente VALUES (758);
INSERT INTO cliente VALUES (759);
INSERT INTO cliente VALUES (760);
INSERT INTO cliente VALUES (761);
INSERT INTO cliente VALUES (762);
INSERT INTO cliente VALUES (763);
INSERT INTO cliente VALUES (764);
INSERT INTO cliente VALUES (765);
INSERT INTO cliente VALUES (766);
INSERT INTO cliente VALUES (767);
INSERT INTO cliente VALUES (768);
INSERT INTO cliente VALUES (769);
INSERT INTO cliente VALUES (770);
INSERT INTO cliente VALUES (771);
INSERT INTO cliente VALUES (772);
INSERT INTO cliente VALUES (773);
INSERT INTO cliente VALUES (774);
INSERT INTO cliente VALUES (775);
INSERT INTO cliente VALUES (776);
INSERT INTO cliente VALUES (777);
INSERT INTO cliente VALUES (778);
INSERT INTO cliente VALUES (779);
INSERT INTO cliente VALUES (780);
INSERT INTO cliente VALUES (781);
INSERT INTO cliente VALUES (782);
INSERT INTO cliente VALUES (783);
INSERT INTO cliente VALUES (784);
INSERT INTO cliente VALUES (785);
INSERT INTO cliente VALUES (786);
INSERT INTO cliente VALUES (787);
INSERT INTO cliente VALUES (788);
INSERT INTO cliente VALUES (789);
INSERT INTO cliente VALUES (790);
INSERT INTO cliente VALUES (791);
INSERT INTO cliente VALUES (792);
INSERT INTO cliente VALUES (793);
INSERT INTO cliente VALUES (794);
INSERT INTO cliente VALUES (795);
INSERT INTO cliente VALUES (796);
INSERT INTO cliente VALUES (797);
INSERT INTO cliente VALUES (798);
INSERT INTO cliente VALUES (799);
INSERT INTO cliente VALUES (800);
INSERT INTO cliente VALUES (801);
INSERT INTO cliente VALUES (802);
INSERT INTO cliente VALUES (803);
INSERT INTO cliente VALUES (804);
INSERT INTO cliente VALUES (805);
INSERT INTO cliente VALUES (806);
INSERT INTO cliente VALUES (807);
INSERT INTO cliente VALUES (808);
INSERT INTO cliente VALUES (809);
INSERT INTO cliente VALUES (810);
INSERT INTO cliente VALUES (811);
INSERT INTO cliente VALUES (812);
INSERT INTO cliente VALUES (813);
INSERT INTO cliente VALUES (814);
INSERT INTO cliente VALUES (815);
INSERT INTO cliente VALUES (816);
INSERT INTO cliente VALUES (817);
INSERT INTO cliente VALUES (818);
INSERT INTO cliente VALUES (819);
INSERT INTO cliente VALUES (820);
INSERT INTO cliente VALUES (821);
INSERT INTO cliente VALUES (822);
INSERT INTO cliente VALUES (823);
INSERT INTO cliente VALUES (824);
INSERT INTO cliente VALUES (825);
INSERT INTO cliente VALUES (826);
INSERT INTO cliente VALUES (827);
INSERT INTO cliente VALUES (828);
INSERT INTO cliente VALUES (829);
INSERT INTO cliente VALUES (830);
INSERT INTO cliente VALUES (831);
INSERT INTO cliente VALUES (832);
INSERT INTO cliente VALUES (833);
INSERT INTO cliente VALUES (834);
INSERT INTO cliente VALUES (835);
INSERT INTO cliente VALUES (836);
INSERT INTO cliente VALUES (837);
INSERT INTO cliente VALUES (838);
INSERT INTO cliente VALUES (839);
INSERT INTO cliente VALUES (840);
INSERT INTO cliente VALUES (841);
INSERT INTO cliente VALUES (842);
INSERT INTO cliente VALUES (843);
INSERT INTO cliente VALUES (844);
INSERT INTO cliente VALUES (845);
INSERT INTO cliente VALUES (846);
INSERT INTO cliente VALUES (847);
INSERT INTO cliente VALUES (848);
INSERT INTO cliente VALUES (849);
INSERT INTO cliente VALUES (850);
INSERT INTO cliente VALUES (851);
INSERT INTO cliente VALUES (852);
INSERT INTO cliente VALUES (853);
INSERT INTO cliente VALUES (854);
INSERT INTO cliente VALUES (855);
INSERT INTO cliente VALUES (856);
INSERT INTO cliente VALUES (857);
INSERT INTO cliente VALUES (858);
INSERT INTO cliente VALUES (859);
INSERT INTO cliente VALUES (860);
INSERT INTO cliente VALUES (861);
INSERT INTO cliente VALUES (862);
INSERT INTO cliente VALUES (863);
INSERT INTO cliente VALUES (864);
INSERT INTO cliente VALUES (865);
INSERT INTO cliente VALUES (866);
INSERT INTO cliente VALUES (867);
INSERT INTO cliente VALUES (868);
INSERT INTO cliente VALUES (869);
INSERT INTO cliente VALUES (870);
INSERT INTO cliente VALUES (871);
INSERT INTO cliente VALUES (872);
INSERT INTO cliente VALUES (873);
INSERT INTO cliente VALUES (874);
INSERT INTO cliente VALUES (875);
INSERT INTO cliente VALUES (876);
INSERT INTO cliente VALUES (877);
INSERT INTO cliente VALUES (878);
INSERT INTO cliente VALUES (879);
INSERT INTO cliente VALUES (880);
INSERT INTO cliente VALUES (881);
INSERT INTO cliente VALUES (882);
INSERT INTO cliente VALUES (883);
INSERT INTO cliente VALUES (884);
INSERT INTO cliente VALUES (885);
INSERT INTO cliente VALUES (886);
INSERT INTO cliente VALUES (887);
INSERT INTO cliente VALUES (888);
INSERT INTO cliente VALUES (889);
INSERT INTO cliente VALUES (890);
INSERT INTO cliente VALUES (891);
INSERT INTO cliente VALUES (892);
INSERT INTO cliente VALUES (893);
INSERT INTO cliente VALUES (894);
INSERT INTO cliente VALUES (895);
INSERT INTO cliente VALUES (896);
INSERT INTO cliente VALUES (897);
INSERT INTO cliente VALUES (898);
INSERT INTO cliente VALUES (899);
INSERT INTO cliente VALUES (900);
INSERT INTO cliente VALUES (901);
INSERT INTO cliente VALUES (902);
INSERT INTO cliente VALUES (903);
INSERT INTO cliente VALUES (904);
INSERT INTO cliente VALUES (905);
INSERT INTO cliente VALUES (906);
INSERT INTO cliente VALUES (907);
INSERT INTO cliente VALUES (908);
INSERT INTO cliente VALUES (909);
INSERT INTO cliente VALUES (910);
INSERT INTO cliente VALUES (911);
INSERT INTO cliente VALUES (912);
INSERT INTO cliente VALUES (913);
INSERT INTO cliente VALUES (914);
INSERT INTO cliente VALUES (915);
INSERT INTO cliente VALUES (916);
INSERT INTO cliente VALUES (917);
INSERT INTO cliente VALUES (918);
INSERT INTO cliente VALUES (919);
INSERT INTO cliente VALUES (920);
INSERT INTO cliente VALUES (921);
INSERT INTO cliente VALUES (922);
INSERT INTO cliente VALUES (923);
INSERT INTO cliente VALUES (924);
INSERT INTO cliente VALUES (925);
INSERT INTO cliente VALUES (926);
INSERT INTO cliente VALUES (927);
INSERT INTO cliente VALUES (928);
INSERT INTO cliente VALUES (929);
INSERT INTO cliente VALUES (930);
INSERT INTO cliente VALUES (931);
INSERT INTO cliente VALUES (932);
INSERT INTO cliente VALUES (933);
INSERT INTO cliente VALUES (934);
INSERT INTO cliente VALUES (935);
INSERT INTO cliente VALUES (936);
INSERT INTO cliente VALUES (937);
INSERT INTO cliente VALUES (938);
INSERT INTO cliente VALUES (939);
INSERT INTO cliente VALUES (940);
INSERT INTO cliente VALUES (941);
INSERT INTO cliente VALUES (942);
INSERT INTO cliente VALUES (943);
INSERT INTO cliente VALUES (944);
INSERT INTO cliente VALUES (945);
INSERT INTO cliente VALUES (946);
INSERT INTO cliente VALUES (947);
INSERT INTO cliente VALUES (948);
INSERT INTO cliente VALUES (949);
INSERT INTO cliente VALUES (950);
INSERT INTO cliente VALUES (951);
INSERT INTO cliente VALUES (952);
INSERT INTO cliente VALUES (953);
INSERT INTO cliente VALUES (954);
INSERT INTO cliente VALUES (955);
INSERT INTO cliente VALUES (956);
INSERT INTO cliente VALUES (957);
INSERT INTO cliente VALUES (958);
INSERT INTO cliente VALUES (959);
INSERT INTO cliente VALUES (960);
INSERT INTO cliente VALUES (961);
INSERT INTO cliente VALUES (962);
INSERT INTO cliente VALUES (963);
INSERT INTO cliente VALUES (964);
INSERT INTO cliente VALUES (965);
INSERT INTO cliente VALUES (966);
INSERT INTO cliente VALUES (967);
INSERT INTO cliente VALUES (968);
INSERT INTO cliente VALUES (969);
INSERT INTO cliente VALUES (970);
INSERT INTO cliente VALUES (971);
INSERT INTO cliente VALUES (972);
INSERT INTO cliente VALUES (973);
INSERT INTO cliente VALUES (974);
INSERT INTO cliente VALUES (975);
INSERT INTO cliente VALUES (976);
INSERT INTO cliente VALUES (977);
INSERT INTO cliente VALUES (978);
INSERT INTO cliente VALUES (979);
INSERT INTO cliente VALUES (980);
INSERT INTO cliente VALUES (981);
INSERT INTO cliente VALUES (982);
INSERT INTO cliente VALUES (983);
INSERT INTO cliente VALUES (984);
INSERT INTO cliente VALUES (985);
INSERT INTO cliente VALUES (986);
INSERT INTO cliente VALUES (987);
INSERT INTO cliente VALUES (988);
INSERT INTO cliente VALUES (989);
INSERT INTO cliente VALUES (990);
INSERT INTO cliente VALUES (991);
INSERT INTO cliente VALUES (992);
INSERT INTO cliente VALUES (993);
INSERT INTO cliente VALUES (994);
INSERT INTO cliente VALUES (995);
INSERT INTO cliente VALUES (996);
INSERT INTO cliente VALUES (997);
INSERT INTO cliente VALUES (998);
INSERT INTO cliente VALUES (999);
INSERT INTO cliente VALUES (1000);


--
-- TOC entry 2198 (class 0 OID 16681)
-- Dependencies: 185
-- Data for Name: filial; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO filial VALUES (1, 'OAKLAND', '857 Londonderry Trail', 'oakland@manufacturing.ma.com');
INSERT INTO filial VALUES (2, 'THOUSAND OAKS', '411 Shoshone Alley', 'thousand_oaks@manufacturing.ma.com');
INSERT INTO filial VALUES (3, 'LAKEWOOD', '49 Hauk Park', 'lakewood@manufacturing.ma.com');


--
-- TOC entry 2201 (class 0 OID 16695)
-- Dependencies: 188
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produto VALUES (1, 'LG Blu-ray Disc Player Streaming Services (BPM25)', 59.99);
INSERT INTO produto VALUES (2, 'Samsung Blu-ray Disc Player (BD-JM51/ZA)', 59.92);
INSERT INTO produto VALUES (3, 'Samsung Blu-ray Disc Player WiFi (BD-JM57/ZA)', 79.87);
INSERT INTO produto VALUES (4, 'LG Blu-ray Disc Player Streaming Services, Built-in Wi-Fi (BPM35)', 72.94);
INSERT INTO produto VALUES (5, 'PlayStation 3 500GB Console (PS3)', 149.00);
INSERT INTO produto VALUES (6, 'PlayStation 4 Limited Edition Uncharted 4 Console Bundle (PS4)', 359.00);
INSERT INTO produto VALUES (8, 'MSI - 970 GAMING - MSI 970 GAMING Desktop Motherboard - AMD 970 Chipset - Socket AM3+ - ATX - 1 x Processor Support - 32', 96.88);
INSERT INTO produto VALUES (9, 'GIGABYTE AMD Socket AM3 Motherboard', 63.37);
INSERT INTO produto VALUES (10, 'Gigabyte Ultra Durable GA-Z97-HD3 Desktop Motherboard - Intel Z97 Express Chipset - Socket H3 LGA-1150 - ATX - 1 x Processor Support - 32 GB DDR3 SDRAM Maximum RAM - 3 GHz (O.C.) Memory', 199.89);
INSERT INTO produto VALUES (11, 'MSI H97 PC MATE LGA 1150 Intel H97 Express Chipset ATX Motherboard', 299.89);
INSERT INTO produto VALUES (12, 'Asus Z10PA-U8 (ASMB8-IKVM) Xeon E5-1600/E5-2600V3 LGA2011-3 Socket R3 C612 DDR3 ATX Motherboard', 348.67);
INSERT INTO produto VALUES (13, 'Intel Core i7-4790S Processor', 342.99);
INSERT INTO produto VALUES (14, 'Intel Core i5-4460 Processor', 178.95);
INSERT INTO produto VALUES (15, 'Intel Core i5-4590 Processor', 199.99);
INSERT INTO produto VALUES (16, 'Intel Core i7-5960X Processor', 1010.95);
INSERT INTO produto VALUES (18, 'Kingston 16GB 1866MHz DDR3 Non-ECC CL10 DIMM (Kit of 2) HyperX FURY Blue Series Memory Module', 84.86);
INSERT INTO produto VALUES (19, 'Patriot Memory Signature 4GB DDR3 1333MHz PC3-10600 DIMM Memory Module, PSD34G13332', 22.00);
INSERT INTO produto VALUES (20, 'NETGEAR N300 WiFi Router (WNR2000)', 34.97);
INSERT INTO produto VALUES (21, 'NETGEAR N750 Dual Band Gigabit WiFi Router (WNDR4300)', 72.85);
INSERT INTO produto VALUES (22, 'TP-LINK Archer C7 AC1750 Wireless Dual Band Gigabit Router', 109.78);
INSERT INTO produto VALUES (23, 'TP-LINK Archer C8 AC1750 Wireless Dual-Band Gigabit Router', 129.99);
INSERT INTO produto VALUES (24, 'TP-LINK AC750 Dual Band Wireless Gigabit Router, Mediatek Realtek, 433Mbps at 5GHz 300Mbps at 2.4GHz, Archer C2', 59.56);
INSERT INTO produto VALUES (25, 'Western Digital Red 8TB NAS Hard Disk Drive 5400 RPM Class SATA 6 Gb/s 128MB Cache 3.5 Inch - WD80EFZX', 351.59);
INSERT INTO produto VALUES (26, 'Seagate Technology ST2000DM001 Seagate Barracuda ST2000DM001 2 TB 3.5" Internal Hard Drive - SATA - 7200 - 64 MB Buffer', 78.07);
INSERT INTO produto VALUES (27, 'Sceptre 24" LED Full HD 1080p Monitor (E248W-1920 Black)', 99.99);
INSERT INTO produto VALUES (28, 'Samsung 27" LED Monitor (S27E650D Black)', 274.07);
INSERT INTO produto VALUES (29, 'LG 34" UltraWide Curved LED Monitor (34UC88 Black)', 838.19);
INSERT INTO produto VALUES (30, 'LG 24" Gaming Monitor (24GM77-B Black)', 298.79);
INSERT INTO produto VALUES (31, 'LG 24" Smart Energy Monitor (24MC37DB Black)', 116.61);
INSERT INTO produto VALUES (32, 'Logitech Keyboard K120', 9.99);
INSERT INTO produto VALUES (33, 'Cobra IM-KBCOBV8 110-Key Wired USB LED-Backlit Gaming Keyboard, Black', 24.50);
INSERT INTO produto VALUES (34, 'Logitech Wireless Combo MK270', 19.95);
INSERT INTO produto VALUES (17, 'Kingston 32GB 2666MHz DDR4 Non-ECC CL15 DIMM (Kit of 4) HyperX FURY Black Series Memory Module', 199.99);
INSERT INTO produto VALUES (35, 'Canon PIXMA MG2520 Photo All-in-One Wired Inkjet Printer', 24.00);
INSERT INTO produto VALUES (36, 'HP Deskjet 2132 All-in-One Printer/Copier/Scanner', 39.98);
INSERT INTO produto VALUES (37, 'HP Officejet 3830 All-in-One Printer/Copier/Scanner/Fax Machine', 79.99);
INSERT INTO produto VALUES (38, 'HP Envy 5642 All-in-One Printer/Copier/Scanner', 88.00);
INSERT INTO produto VALUES (7, 'GIGABYTE GA-B85M-DS3H LGA1150/Intel B85/DDR3/SATA3&USB3.0/A&GbE/MicroATX Motherboard', 77.00);


--
-- TOC entry 2197 (class 0 OID 16678)
-- Dependencies: 184
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estoque VALUES (1, 1, 5);
INSERT INTO estoque VALUES (2, 1, 5);
INSERT INTO estoque VALUES (3, 1, 250);
INSERT INTO estoque VALUES (1, 2, 25);
INSERT INTO estoque VALUES (2, 2, 45);
INSERT INTO estoque VALUES (3, 2, 0);
INSERT INTO estoque VALUES (1, 3, 45);
INSERT INTO estoque VALUES (2, 3, 150);
INSERT INTO estoque VALUES (3, 3, 100);
INSERT INTO estoque VALUES (1, 4, 35);
INSERT INTO estoque VALUES (2, 4, 35);
INSERT INTO estoque VALUES (3, 4, 0);
INSERT INTO estoque VALUES (1, 5, 160);
INSERT INTO estoque VALUES (2, 5, 25);
INSERT INTO estoque VALUES (3, 5, 25);
INSERT INTO estoque VALUES (1, 6, 35);
INSERT INTO estoque VALUES (2, 6, 160);
INSERT INTO estoque VALUES (3, 6, 30);
INSERT INTO estoque VALUES (1, 7, 40);
INSERT INTO estoque VALUES (2, 7, 20);
INSERT INTO estoque VALUES (3, 7, 25);
INSERT INTO estoque VALUES (1, 8, 150);
INSERT INTO estoque VALUES (2, 8, 100);
INSERT INTO estoque VALUES (3, 8, 30);
INSERT INTO estoque VALUES (1, 9, 100);
INSERT INTO estoque VALUES (2, 9, 0);
INSERT INTO estoque VALUES (3, 9, 0);
INSERT INTO estoque VALUES (1, 10, 90);
INSERT INTO estoque VALUES (2, 10, 0);
INSERT INTO estoque VALUES (3, 10, 25);
INSERT INTO estoque VALUES (1, 11, 0);
INSERT INTO estoque VALUES (2, 11, 20);
INSERT INTO estoque VALUES (3, 11, 250);
INSERT INTO estoque VALUES (1, 12, 35);
INSERT INTO estoque VALUES (2, 12, 5);
INSERT INTO estoque VALUES (3, 12, 20);
INSERT INTO estoque VALUES (1, 13, 35);
INSERT INTO estoque VALUES (2, 13, 0);
INSERT INTO estoque VALUES (3, 13, 160);
INSERT INTO estoque VALUES (1, 14, 20);
INSERT INTO estoque VALUES (2, 14, 90);
INSERT INTO estoque VALUES (3, 14, 150);
INSERT INTO estoque VALUES (1, 15, 150);
INSERT INTO estoque VALUES (2, 15, 160);
INSERT INTO estoque VALUES (3, 15, 0);
INSERT INTO estoque VALUES (1, 16, 30);
INSERT INTO estoque VALUES (2, 16, 20);
INSERT INTO estoque VALUES (3, 16, 100);
INSERT INTO estoque VALUES (1, 17, 160);
INSERT INTO estoque VALUES (2, 17, 0);
INSERT INTO estoque VALUES (3, 17, 0);
INSERT INTO estoque VALUES (1, 18, 90);
INSERT INTO estoque VALUES (2, 18, 0);
INSERT INTO estoque VALUES (3, 18, 0);
INSERT INTO estoque VALUES (1, 19, 30);
INSERT INTO estoque VALUES (2, 19, 305);
INSERT INTO estoque VALUES (3, 19, 0);
INSERT INTO estoque VALUES (1, 20, 0);
INSERT INTO estoque VALUES (2, 20, 0);
INSERT INTO estoque VALUES (3, 20, 100);
INSERT INTO estoque VALUES (1, 21, 305);
INSERT INTO estoque VALUES (2, 21, 0);
INSERT INTO estoque VALUES (3, 21, 20);
INSERT INTO estoque VALUES (1, 22, 40);
INSERT INTO estoque VALUES (2, 22, 35);
INSERT INTO estoque VALUES (3, 22, 45);
INSERT INTO estoque VALUES (1, 23, 0);
INSERT INTO estoque VALUES (2, 23, 20);
INSERT INTO estoque VALUES (3, 23, 0);
INSERT INTO estoque VALUES (1, 24, 40);
INSERT INTO estoque VALUES (2, 24, 305);
INSERT INTO estoque VALUES (3, 24, 0);
INSERT INTO estoque VALUES (1, 25, 305);
INSERT INTO estoque VALUES (2, 25, 250);
INSERT INTO estoque VALUES (3, 25, 20);
INSERT INTO estoque VALUES (1, 26, 0);
INSERT INTO estoque VALUES (2, 26, 305);
INSERT INTO estoque VALUES (3, 26, 0);
INSERT INTO estoque VALUES (1, 27, 35);
INSERT INTO estoque VALUES (2, 27, 75);
INSERT INTO estoque VALUES (3, 27, 0);
INSERT INTO estoque VALUES (1, 28, 20);
INSERT INTO estoque VALUES (2, 28, 90);
INSERT INTO estoque VALUES (3, 28, 40);
INSERT INTO estoque VALUES (1, 29, 20);
INSERT INTO estoque VALUES (2, 29, 45);
INSERT INTO estoque VALUES (3, 29, 160);
INSERT INTO estoque VALUES (1, 30, 305);
INSERT INTO estoque VALUES (2, 30, 80);
INSERT INTO estoque VALUES (3, 30, 150);
INSERT INTO estoque VALUES (1, 31, 90);
INSERT INTO estoque VALUES (2, 31, 75);
INSERT INTO estoque VALUES (3, 31, 0);
INSERT INTO estoque VALUES (1, 32, 35);
INSERT INTO estoque VALUES (2, 32, 35);
INSERT INTO estoque VALUES (3, 32, 0);
INSERT INTO estoque VALUES (1, 33, 5);
INSERT INTO estoque VALUES (2, 33, 0);
INSERT INTO estoque VALUES (3, 33, 5);
INSERT INTO estoque VALUES (1, 34, 20);
INSERT INTO estoque VALUES (2, 34, 305);
INSERT INTO estoque VALUES (3, 34, 90);
INSERT INTO estoque VALUES (1, 35, 150);
INSERT INTO estoque VALUES (2, 35, 30);
INSERT INTO estoque VALUES (3, 35, 30);
INSERT INTO estoque VALUES (1, 36, 20);
INSERT INTO estoque VALUES (2, 36, 45);
INSERT INTO estoque VALUES (3, 36, 100);
INSERT INTO estoque VALUES (1, 37, 40);
INSERT INTO estoque VALUES (2, 37, 160);
INSERT INTO estoque VALUES (3, 37, 305);
INSERT INTO estoque VALUES (1, 38, 150);
INSERT INTO estoque VALUES (2, 38, 150);
INSERT INTO estoque VALUES (3, 38, 160);


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 186
-- Name: filial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filial_id_seq', 3, true);


--
-- TOC entry 2200 (class 0 OID 16689)
-- Dependencies: 187
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO funcionario VALUES (2, 7458.1);
INSERT INTO funcionario VALUES (3, 4780.6);
INSERT INTO funcionario VALUES (4, 1502.32);
INSERT INTO funcionario VALUES (5, 1542.86);
INSERT INTO funcionario VALUES (6, 4580.3);
INSERT INTO funcionario VALUES (7, 7458.1);
INSERT INTO funcionario VALUES (11, 7458.1);
INSERT INTO funcionario VALUES (13, 4580.3);
INSERT INTO funcionario VALUES (15, 1502.32);
INSERT INTO funcionario VALUES (18, 9608.66);
INSERT INTO funcionario VALUES (19, 1502.32);
INSERT INTO funcionario VALUES (20, 2536.45);
INSERT INTO funcionario VALUES (22, 4780.6);
INSERT INTO funcionario VALUES (23, 2010.32);
INSERT INTO funcionario VALUES (30, 1502.32);
INSERT INTO funcionario VALUES (31, 1502.32);
INSERT INTO funcionario VALUES (33, 2010.32);
INSERT INTO funcionario VALUES (34, 3690.9);
INSERT INTO funcionario VALUES (35, 2010.32);
INSERT INTO funcionario VALUES (36, 7458.1);
INSERT INTO funcionario VALUES (37, 3690.9);
INSERT INTO funcionario VALUES (38, 2010.32);
INSERT INTO funcionario VALUES (39, 1542.86);
INSERT INTO funcionario VALUES (41, 1542.86);
INSERT INTO funcionario VALUES (46, 9608.66);
INSERT INTO funcionario VALUES (49, 4780.6);
INSERT INTO funcionario VALUES (50, 9608.66);
INSERT INTO funcionario VALUES (54, 2536.45);
INSERT INTO funcionario VALUES (55, 2355.65);
INSERT INTO funcionario VALUES (61, 9608.66);
INSERT INTO funcionario VALUES (62, 2355.65);
INSERT INTO funcionario VALUES (63, 2355.65);
INSERT INTO funcionario VALUES (64, 2536.45);
INSERT INTO funcionario VALUES (65, 9608.66);
INSERT INTO funcionario VALUES (66, 2355.65);
INSERT INTO funcionario VALUES (69, 9608.66);
INSERT INTO funcionario VALUES (70, 9608.66);
INSERT INTO funcionario VALUES (71, 2536.45);
INSERT INTO funcionario VALUES (72, 9608.66);
INSERT INTO funcionario VALUES (73, 2010.32);
INSERT INTO funcionario VALUES (75, 9608.66);
INSERT INTO funcionario VALUES (77, 4780.6);
INSERT INTO funcionario VALUES (78, 9608.66);
INSERT INTO funcionario VALUES (79, 3690.9);
INSERT INTO funcionario VALUES (81, 7458.1);
INSERT INTO funcionario VALUES (82, 4580.3);
INSERT INTO funcionario VALUES (83, 2355.65);
INSERT INTO funcionario VALUES (89, 2010.32);
INSERT INTO funcionario VALUES (90, 2355.65);
INSERT INTO funcionario VALUES (91, 9608.66);
INSERT INTO funcionario VALUES (92, 2536.45);
INSERT INTO funcionario VALUES (93, 2010.32);
INSERT INTO funcionario VALUES (97, 7458.1);
INSERT INTO funcionario VALUES (98, 1502.32);
INSERT INTO funcionario VALUES (102, 3690.9);
INSERT INTO funcionario VALUES (103, 4780.6);
INSERT INTO funcionario VALUES (105, 7458.1);
INSERT INTO funcionario VALUES (107, 4580.3);
INSERT INTO funcionario VALUES (108, 1502.32);
INSERT INTO funcionario VALUES (110, 2536.45);
INSERT INTO funcionario VALUES (111, 7458.1);
INSERT INTO funcionario VALUES (112, 1502.32);
INSERT INTO funcionario VALUES (113, 1502.32);
INSERT INTO funcionario VALUES (114, 9608.66);
INSERT INTO funcionario VALUES (117, 4580.3);
INSERT INTO funcionario VALUES (119, 4780.6);
INSERT INTO funcionario VALUES (121, 4780.6);
INSERT INTO funcionario VALUES (125, 2355.65);
INSERT INTO funcionario VALUES (126, 2355.65);
INSERT INTO funcionario VALUES (135, 1502.32);
INSERT INTO funcionario VALUES (137, 3690.9);
INSERT INTO funcionario VALUES (138, 1502.32);
INSERT INTO funcionario VALUES (140, 2355.65);
INSERT INTO funcionario VALUES (141, 4580.3);
INSERT INTO funcionario VALUES (142, 4780.6);
INSERT INTO funcionario VALUES (145, 1502.32);
INSERT INTO funcionario VALUES (148, 9608.66);
INSERT INTO funcionario VALUES (149, 2536.45);
INSERT INTO funcionario VALUES (154, 9608.66);
INSERT INTO funcionario VALUES (155, 1542.86);
INSERT INTO funcionario VALUES (159, 4580.3);
INSERT INTO funcionario VALUES (162, 1542.86);
INSERT INTO funcionario VALUES (165, 2536.45);
INSERT INTO funcionario VALUES (166, 9608.66);
INSERT INTO funcionario VALUES (167, 7458.1);
INSERT INTO funcionario VALUES (168, 7458.1);
INSERT INTO funcionario VALUES (169, 2536.45);
INSERT INTO funcionario VALUES (171, 2536.45);
INSERT INTO funcionario VALUES (173, 1542.86);
INSERT INTO funcionario VALUES (176, 1502.32);
INSERT INTO funcionario VALUES (177, 4780.6);
INSERT INTO funcionario VALUES (178, 1542.86);
INSERT INTO funcionario VALUES (181, 2536.45);
INSERT INTO funcionario VALUES (187, 7458.1);
INSERT INTO funcionario VALUES (197, 2010.32);
INSERT INTO funcionario VALUES (198, 1502.32);
INSERT INTO funcionario VALUES (201, 4780.6);
INSERT INTO funcionario VALUES (204, 4580.3);
INSERT INTO funcionario VALUES (205, 2010.32);
INSERT INTO funcionario VALUES (207, 2010.32);
INSERT INTO funcionario VALUES (208, 4780.6);
INSERT INTO funcionario VALUES (212, 4580.3);
INSERT INTO funcionario VALUES (214, 4580.3);
INSERT INTO funcionario VALUES (215, 2536.45);
INSERT INTO funcionario VALUES (216, 1502.32);
INSERT INTO funcionario VALUES (217, 1502.32);
INSERT INTO funcionario VALUES (218, 2010.32);
INSERT INTO funcionario VALUES (221, 3690.9);
INSERT INTO funcionario VALUES (223, 4780.6);
INSERT INTO funcionario VALUES (225, 9608.66);
INSERT INTO funcionario VALUES (226, 2536.45);
INSERT INTO funcionario VALUES (227, 1542.86);
INSERT INTO funcionario VALUES (229, 2536.45);
INSERT INTO funcionario VALUES (232, 9608.66);
INSERT INTO funcionario VALUES (235, 4580.3);
INSERT INTO funcionario VALUES (237, 4580.3);
INSERT INTO funcionario VALUES (241, 2536.45);
INSERT INTO funcionario VALUES (243, 2536.45);
INSERT INTO funcionario VALUES (244, 2536.45);
INSERT INTO funcionario VALUES (245, 2355.65);
INSERT INTO funcionario VALUES (246, 2010.32);
INSERT INTO funcionario VALUES (247, 4580.3);
INSERT INTO funcionario VALUES (248, 2010.32);
INSERT INTO funcionario VALUES (250, 2010.32);
INSERT INTO funcionario VALUES (251, 9608.66);
INSERT INTO funcionario VALUES (257, 3690.9);
INSERT INTO funcionario VALUES (258, 1542.86);
INSERT INTO funcionario VALUES (259, 4580.3);
INSERT INTO funcionario VALUES (260, 1502.32);
INSERT INTO funcionario VALUES (261, 2536.45);
INSERT INTO funcionario VALUES (263, 2010.32);
INSERT INTO funcionario VALUES (264, 3690.9);
INSERT INTO funcionario VALUES (268, 7458.1);
INSERT INTO funcionario VALUES (269, 1542.86);
INSERT INTO funcionario VALUES (272, 1542.86);
INSERT INTO funcionario VALUES (273, 3690.9);
INSERT INTO funcionario VALUES (274, 4780.6);
INSERT INTO funcionario VALUES (278, 1502.32);
INSERT INTO funcionario VALUES (280, 9608.66);
INSERT INTO funcionario VALUES (281, 2355.65);
INSERT INTO funcionario VALUES (282, 4780.6);
INSERT INTO funcionario VALUES (283, 9608.66);
INSERT INTO funcionario VALUES (284, 2355.65);
INSERT INTO funcionario VALUES (286, 2536.45);
INSERT INTO funcionario VALUES (287, 9608.66);
INSERT INTO funcionario VALUES (288, 1542.86);
INSERT INTO funcionario VALUES (289, 4780.6);
INSERT INTO funcionario VALUES (290, 2355.65);
INSERT INTO funcionario VALUES (291, 7458.1);
INSERT INTO funcionario VALUES (293, 1502.32);
INSERT INTO funcionario VALUES (294, 2355.65);
INSERT INTO funcionario VALUES (295, 2010.32);
INSERT INTO funcionario VALUES (297, 2010.32);
INSERT INTO funcionario VALUES (298, 1502.32);
INSERT INTO funcionario VALUES (300, 3690.9);
INSERT INTO funcionario VALUES (302, 2355.65);
INSERT INTO funcionario VALUES (304, 3690.9);
INSERT INTO funcionario VALUES (307, 2355.65);
INSERT INTO funcionario VALUES (308, 2010.32);
INSERT INTO funcionario VALUES (310, 4580.3);
INSERT INTO funcionario VALUES (311, 4580.3);
INSERT INTO funcionario VALUES (312, 1502.32);
INSERT INTO funcionario VALUES (316, 1502.32);
INSERT INTO funcionario VALUES (318, 2010.32);
INSERT INTO funcionario VALUES (319, 4780.6);
INSERT INTO funcionario VALUES (320, 7458.1);
INSERT INTO funcionario VALUES (321, 7458.1);
INSERT INTO funcionario VALUES (323, 2355.65);
INSERT INTO funcionario VALUES (324, 1502.32);
INSERT INTO funcionario VALUES (329, 1502.32);
INSERT INTO funcionario VALUES (331, 1542.86);
INSERT INTO funcionario VALUES (332, 2010.32);
INSERT INTO funcionario VALUES (333, 4580.3);
INSERT INTO funcionario VALUES (334, 2355.65);
INSERT INTO funcionario VALUES (336, 2536.45);
INSERT INTO funcionario VALUES (337, 2536.45);
INSERT INTO funcionario VALUES (339, 2010.32);
INSERT INTO funcionario VALUES (340, 4580.3);
INSERT INTO funcionario VALUES (342, 9608.66);
INSERT INTO funcionario VALUES (344, 4580.3);
INSERT INTO funcionario VALUES (345, 7458.1);
INSERT INTO funcionario VALUES (347, 4580.3);
INSERT INTO funcionario VALUES (350, 9608.66);
INSERT INTO funcionario VALUES (352, 3690.9);
INSERT INTO funcionario VALUES (357, 4780.6);
INSERT INTO funcionario VALUES (358, 7458.1);
INSERT INTO funcionario VALUES (359, 4780.6);
INSERT INTO funcionario VALUES (360, 1502.32);
INSERT INTO funcionario VALUES (362, 4580.3);
INSERT INTO funcionario VALUES (363, 7458.1);
INSERT INTO funcionario VALUES (365, 2010.32);
INSERT INTO funcionario VALUES (366, 9608.66);
INSERT INTO funcionario VALUES (368, 2010.32);
INSERT INTO funcionario VALUES (370, 9608.66);
INSERT INTO funcionario VALUES (372, 2355.65);
INSERT INTO funcionario VALUES (373, 4780.6);
INSERT INTO funcionario VALUES (374, 2536.45);
INSERT INTO funcionario VALUES (376, 2355.65);
INSERT INTO funcionario VALUES (380, 2536.45);
INSERT INTO funcionario VALUES (382, 3690.9);
INSERT INTO funcionario VALUES (383, 4780.6);
INSERT INTO funcionario VALUES (384, 4580.3);
INSERT INTO funcionario VALUES (389, 1542.86);
INSERT INTO funcionario VALUES (390, 2010.32);
INSERT INTO funcionario VALUES (391, 9608.66);
INSERT INTO funcionario VALUES (392, 2010.32);
INSERT INTO funcionario VALUES (393, 7458.1);
INSERT INTO funcionario VALUES (394, 4780.6);
INSERT INTO funcionario VALUES (395, 2536.45);
INSERT INTO funcionario VALUES (396, 2355.65);
INSERT INTO funcionario VALUES (397, 9608.66);
INSERT INTO funcionario VALUES (398, 7458.1);
INSERT INTO funcionario VALUES (399, 2536.45);
INSERT INTO funcionario VALUES (401, 3690.9);
INSERT INTO funcionario VALUES (402, 2536.45);
INSERT INTO funcionario VALUES (405, 2010.32);
INSERT INTO funcionario VALUES (407, 2536.45);
INSERT INTO funcionario VALUES (408, 2355.65);
INSERT INTO funcionario VALUES (409, 4580.3);
INSERT INTO funcionario VALUES (411, 2536.45);
INSERT INTO funcionario VALUES (415, 3690.9);
INSERT INTO funcionario VALUES (416, 2010.32);
INSERT INTO funcionario VALUES (417, 1502.32);
INSERT INTO funcionario VALUES (420, 3690.9);
INSERT INTO funcionario VALUES (423, 1502.32);
INSERT INTO funcionario VALUES (424, 2536.45);
INSERT INTO funcionario VALUES (427, 2355.65);
INSERT INTO funcionario VALUES (429, 4580.3);
INSERT INTO funcionario VALUES (434, 1542.86);
INSERT INTO funcionario VALUES (435, 1502.32);
INSERT INTO funcionario VALUES (436, 2355.65);
INSERT INTO funcionario VALUES (437, 2536.45);
INSERT INTO funcionario VALUES (439, 2010.32);
INSERT INTO funcionario VALUES (442, 7458.1);
INSERT INTO funcionario VALUES (444, 9608.66);
INSERT INTO funcionario VALUES (449, 7458.1);
INSERT INTO funcionario VALUES (453, 9608.66);
INSERT INTO funcionario VALUES (454, 4780.6);
INSERT INTO funcionario VALUES (455, 4580.3);
INSERT INTO funcionario VALUES (457, 4580.3);
INSERT INTO funcionario VALUES (458, 2355.65);
INSERT INTO funcionario VALUES (462, 1542.86);
INSERT INTO funcionario VALUES (466, 3690.9);
INSERT INTO funcionario VALUES (467, 2355.65);
INSERT INTO funcionario VALUES (468, 9608.66);
INSERT INTO funcionario VALUES (469, 4580.3);
INSERT INTO funcionario VALUES (473, 3690.9);
INSERT INTO funcionario VALUES (474, 7458.1);
INSERT INTO funcionario VALUES (476, 4780.6);
INSERT INTO funcionario VALUES (477, 4780.6);
INSERT INTO funcionario VALUES (479, 2355.65);
INSERT INTO funcionario VALUES (480, 9608.66);
INSERT INTO funcionario VALUES (482, 3690.9);
INSERT INTO funcionario VALUES (485, 2536.45);
INSERT INTO funcionario VALUES (486, 4580.3);
INSERT INTO funcionario VALUES (487, 2536.45);
INSERT INTO funcionario VALUES (488, 2010.32);
INSERT INTO funcionario VALUES (489, 4580.3);
INSERT INTO funcionario VALUES (490, 4780.6);
INSERT INTO funcionario VALUES (491, 4580.3);
INSERT INTO funcionario VALUES (492, 7458.1);
INSERT INTO funcionario VALUES (495, 7458.1);
INSERT INTO funcionario VALUES (496, 4580.3);
INSERT INTO funcionario VALUES (501, 2536.45);
INSERT INTO funcionario VALUES (502, 2010.32);
INSERT INTO funcionario VALUES (503, 3690.9);
INSERT INTO funcionario VALUES (505, 2355.65);
INSERT INTO funcionario VALUES (506, 7458.1);
INSERT INTO funcionario VALUES (508, 4780.6);
INSERT INTO funcionario VALUES (510, 4780.6);
INSERT INTO funcionario VALUES (511, 1542.86);
INSERT INTO funcionario VALUES (512, 4580.3);
INSERT INTO funcionario VALUES (514, 4580.3);
INSERT INTO funcionario VALUES (516, 2010.32);
INSERT INTO funcionario VALUES (519, 1542.86);
INSERT INTO funcionario VALUES (520, 2010.32);
INSERT INTO funcionario VALUES (522, 2355.65);
INSERT INTO funcionario VALUES (524, 4780.6);
INSERT INTO funcionario VALUES (525, 3690.9);
INSERT INTO funcionario VALUES (526, 4580.3);
INSERT INTO funcionario VALUES (527, 4780.6);
INSERT INTO funcionario VALUES (528, 2536.45);
INSERT INTO funcionario VALUES (529, 4780.6);
INSERT INTO funcionario VALUES (530, 9608.66);
INSERT INTO funcionario VALUES (531, 3690.9);
INSERT INTO funcionario VALUES (532, 3690.9);
INSERT INTO funcionario VALUES (533, 3690.9);
INSERT INTO funcionario VALUES (534, 2010.32);
INSERT INTO funcionario VALUES (539, 9608.66);
INSERT INTO funcionario VALUES (540, 3690.9);
INSERT INTO funcionario VALUES (541, 3690.9);
INSERT INTO funcionario VALUES (543, 3690.9);
INSERT INTO funcionario VALUES (547, 1502.32);
INSERT INTO funcionario VALUES (548, 4780.6);
INSERT INTO funcionario VALUES (550, 7458.1);
INSERT INTO funcionario VALUES (552, 4780.6);
INSERT INTO funcionario VALUES (554, 2010.32);
INSERT INTO funcionario VALUES (558, 1542.86);
INSERT INTO funcionario VALUES (559, 1502.32);
INSERT INTO funcionario VALUES (560, 1542.86);
INSERT INTO funcionario VALUES (562, 9608.66);
INSERT INTO funcionario VALUES (563, 2010.32);
INSERT INTO funcionario VALUES (565, 2010.32);
INSERT INTO funcionario VALUES (566, 4580.3);
INSERT INTO funcionario VALUES (570, 7458.1);
INSERT INTO funcionario VALUES (571, 2355.65);
INSERT INTO funcionario VALUES (573, 4780.6);
INSERT INTO funcionario VALUES (575, 2355.65);
INSERT INTO funcionario VALUES (576, 2355.65);
INSERT INTO funcionario VALUES (577, 2355.65);
INSERT INTO funcionario VALUES (578, 2355.65);
INSERT INTO funcionario VALUES (579, 1502.32);
INSERT INTO funcionario VALUES (581, 4580.3);
INSERT INTO funcionario VALUES (583, 9608.66);
INSERT INTO funcionario VALUES (585, 7458.1);
INSERT INTO funcionario VALUES (587, 4780.6);
INSERT INTO funcionario VALUES (590, 2536.45);
INSERT INTO funcionario VALUES (591, 7458.1);
INSERT INTO funcionario VALUES (592, 4580.3);
INSERT INTO funcionario VALUES (593, 3690.9);
INSERT INTO funcionario VALUES (595, 1542.86);
INSERT INTO funcionario VALUES (599, 3690.9);
INSERT INTO funcionario VALUES (601, 1502.32);
INSERT INTO funcionario VALUES (602, 4780.6);
INSERT INTO funcionario VALUES (606, 4580.3);
INSERT INTO funcionario VALUES (609, 3690.9);
INSERT INTO funcionario VALUES (610, 1502.32);
INSERT INTO funcionario VALUES (611, 1542.86);
INSERT INTO funcionario VALUES (612, 2536.45);
INSERT INTO funcionario VALUES (613, 1542.86);
INSERT INTO funcionario VALUES (615, 1502.32);
INSERT INTO funcionario VALUES (617, 2010.32);
INSERT INTO funcionario VALUES (620, 7458.1);
INSERT INTO funcionario VALUES (621, 9608.66);
INSERT INTO funcionario VALUES (622, 2010.32);
INSERT INTO funcionario VALUES (624, 2355.65);
INSERT INTO funcionario VALUES (625, 7458.1);
INSERT INTO funcionario VALUES (628, 2536.45);
INSERT INTO funcionario VALUES (630, 3690.9);
INSERT INTO funcionario VALUES (631, 9608.66);
INSERT INTO funcionario VALUES (632, 2355.65);
INSERT INTO funcionario VALUES (634, 4780.6);
INSERT INTO funcionario VALUES (636, 4780.6);
INSERT INTO funcionario VALUES (637, 4580.3);
INSERT INTO funcionario VALUES (638, 3690.9);
INSERT INTO funcionario VALUES (639, 2010.32);
INSERT INTO funcionario VALUES (644, 2355.65);
INSERT INTO funcionario VALUES (645, 4780.6);
INSERT INTO funcionario VALUES (646, 7458.1);
INSERT INTO funcionario VALUES (651, 1502.32);
INSERT INTO funcionario VALUES (652, 7458.1);
INSERT INTO funcionario VALUES (654, 7458.1);
INSERT INTO funcionario VALUES (656, 9608.66);
INSERT INTO funcionario VALUES (658, 3690.9);
INSERT INTO funcionario VALUES (660, 2010.32);
INSERT INTO funcionario VALUES (661, 9608.66);
INSERT INTO funcionario VALUES (662, 4780.6);
INSERT INTO funcionario VALUES (663, 2010.32);
INSERT INTO funcionario VALUES (664, 4580.3);
INSERT INTO funcionario VALUES (665, 7458.1);
INSERT INTO funcionario VALUES (666, 7458.1);
INSERT INTO funcionario VALUES (667, 2010.32);
INSERT INTO funcionario VALUES (668, 2355.65);
INSERT INTO funcionario VALUES (672, 4580.3);
INSERT INTO funcionario VALUES (674, 7458.1);
INSERT INTO funcionario VALUES (675, 2536.45);
INSERT INTO funcionario VALUES (676, 1502.32);
INSERT INTO funcionario VALUES (677, 2536.45);
INSERT INTO funcionario VALUES (679, 1542.86);
INSERT INTO funcionario VALUES (680, 4780.6);
INSERT INTO funcionario VALUES (682, 9608.66);
INSERT INTO funcionario VALUES (683, 1502.32);
INSERT INTO funcionario VALUES (684, 4580.3);
INSERT INTO funcionario VALUES (685, 4780.6);
INSERT INTO funcionario VALUES (687, 4780.6);
INSERT INTO funcionario VALUES (688, 2536.45);
INSERT INTO funcionario VALUES (691, 2355.65);
INSERT INTO funcionario VALUES (693, 9608.66);
INSERT INTO funcionario VALUES (697, 1542.86);
INSERT INTO funcionario VALUES (699, 4780.6);
INSERT INTO funcionario VALUES (701, 1542.86);
INSERT INTO funcionario VALUES (703, 3690.9);
INSERT INTO funcionario VALUES (707, 9608.66);
INSERT INTO funcionario VALUES (708, 9608.66);
INSERT INTO funcionario VALUES (709, 3690.9);
INSERT INTO funcionario VALUES (714, 4580.3);
INSERT INTO funcionario VALUES (718, 4580.3);
INSERT INTO funcionario VALUES (719, 1502.32);
INSERT INTO funcionario VALUES (720, 1502.32);
INSERT INTO funcionario VALUES (721, 4580.3);
INSERT INTO funcionario VALUES (725, 3690.9);
INSERT INTO funcionario VALUES (727, 3690.9);
INSERT INTO funcionario VALUES (729, 2355.65);
INSERT INTO funcionario VALUES (730, 3690.9);
INSERT INTO funcionario VALUES (731, 2355.65);
INSERT INTO funcionario VALUES (733, 2355.65);
INSERT INTO funcionario VALUES (734, 7458.1);
INSERT INTO funcionario VALUES (735, 9608.66);
INSERT INTO funcionario VALUES (736, 4580.3);
INSERT INTO funcionario VALUES (737, 2010.32);
INSERT INTO funcionario VALUES (739, 7458.1);
INSERT INTO funcionario VALUES (741, 1502.32);
INSERT INTO funcionario VALUES (742, 1542.86);
INSERT INTO funcionario VALUES (743, 7458.1);
INSERT INTO funcionario VALUES (744, 3690.9);
INSERT INTO funcionario VALUES (745, 9608.66);
INSERT INTO funcionario VALUES (751, 2010.32);
INSERT INTO funcionario VALUES (752, 4580.3);
INSERT INTO funcionario VALUES (755, 1502.32);
INSERT INTO funcionario VALUES (760, 3690.9);
INSERT INTO funcionario VALUES (763, 2355.65);
INSERT INTO funcionario VALUES (767, 1542.86);
INSERT INTO funcionario VALUES (768, 4780.6);
INSERT INTO funcionario VALUES (769, 2355.65);
INSERT INTO funcionario VALUES (770, 2355.65);
INSERT INTO funcionario VALUES (771, 9608.66);
INSERT INTO funcionario VALUES (774, 2355.65);
INSERT INTO funcionario VALUES (777, 1542.86);
INSERT INTO funcionario VALUES (779, 9608.66);
INSERT INTO funcionario VALUES (780, 4780.6);
INSERT INTO funcionario VALUES (781, 1502.32);
INSERT INTO funcionario VALUES (782, 4580.3);
INSERT INTO funcionario VALUES (785, 4580.3);
INSERT INTO funcionario VALUES (786, 1502.32);
INSERT INTO funcionario VALUES (788, 7458.1);
INSERT INTO funcionario VALUES (789, 1502.32);
INSERT INTO funcionario VALUES (791, 2536.45);
INSERT INTO funcionario VALUES (795, 3690.9);
INSERT INTO funcionario VALUES (800, 2536.45);
INSERT INTO funcionario VALUES (801, 4780.6);
INSERT INTO funcionario VALUES (804, 4780.6);
INSERT INTO funcionario VALUES (807, 3690.9);
INSERT INTO funcionario VALUES (810, 9608.66);
INSERT INTO funcionario VALUES (811, 7458.1);
INSERT INTO funcionario VALUES (812, 2355.65);
INSERT INTO funcionario VALUES (813, 3690.9);
INSERT INTO funcionario VALUES (819, 7458.1);
INSERT INTO funcionario VALUES (820, 2355.65);
INSERT INTO funcionario VALUES (826, 2536.45);
INSERT INTO funcionario VALUES (827, 1542.86);
INSERT INTO funcionario VALUES (828, 9608.66);
INSERT INTO funcionario VALUES (829, 4580.3);
INSERT INTO funcionario VALUES (831, 9608.66);
INSERT INTO funcionario VALUES (835, 2536.45);
INSERT INTO funcionario VALUES (838, 3690.9);
INSERT INTO funcionario VALUES (842, 4780.6);
INSERT INTO funcionario VALUES (843, 9608.66);
INSERT INTO funcionario VALUES (847, 2536.45);
INSERT INTO funcionario VALUES (849, 2536.45);
INSERT INTO funcionario VALUES (852, 1542.86);
INSERT INTO funcionario VALUES (855, 4780.6);
INSERT INTO funcionario VALUES (865, 1542.86);
INSERT INTO funcionario VALUES (866, 2536.45);
INSERT INTO funcionario VALUES (867, 3690.9);
INSERT INTO funcionario VALUES (868, 9608.66);
INSERT INTO funcionario VALUES (870, 2536.45);
INSERT INTO funcionario VALUES (871, 2010.32);
INSERT INTO funcionario VALUES (874, 1542.86);
INSERT INTO funcionario VALUES (879, 4580.3);
INSERT INTO funcionario VALUES (880, 1502.32);
INSERT INTO funcionario VALUES (881, 9608.66);
INSERT INTO funcionario VALUES (884, 4580.3);
INSERT INTO funcionario VALUES (885, 2536.45);
INSERT INTO funcionario VALUES (887, 2536.45);
INSERT INTO funcionario VALUES (889, 9608.66);
INSERT INTO funcionario VALUES (893, 4580.3);
INSERT INTO funcionario VALUES (894, 2536.45);
INSERT INTO funcionario VALUES (895, 2010.32);
INSERT INTO funcionario VALUES (897, 2536.45);
INSERT INTO funcionario VALUES (905, 2010.32);
INSERT INTO funcionario VALUES (909, 2010.32);
INSERT INTO funcionario VALUES (910, 3690.9);
INSERT INTO funcionario VALUES (911, 4780.6);
INSERT INTO funcionario VALUES (912, 2355.65);
INSERT INTO funcionario VALUES (915, 9608.66);
INSERT INTO funcionario VALUES (916, 1542.86);
INSERT INTO funcionario VALUES (921, 4780.6);
INSERT INTO funcionario VALUES (922, 4580.3);
INSERT INTO funcionario VALUES (923, 7458.1);
INSERT INTO funcionario VALUES (928, 2010.32);
INSERT INTO funcionario VALUES (929, 7458.1);
INSERT INTO funcionario VALUES (930, 2536.45);
INSERT INTO funcionario VALUES (934, 1542.86);
INSERT INTO funcionario VALUES (941, 1542.86);
INSERT INTO funcionario VALUES (942, 3690.9);
INSERT INTO funcionario VALUES (946, 7458.1);
INSERT INTO funcionario VALUES (950, 3690.9);
INSERT INTO funcionario VALUES (954, 2355.65);
INSERT INTO funcionario VALUES (956, 4780.6);
INSERT INTO funcionario VALUES (957, 7458.1);
INSERT INTO funcionario VALUES (959, 1542.86);
INSERT INTO funcionario VALUES (960, 1542.86);
INSERT INTO funcionario VALUES (962, 9608.66);
INSERT INTO funcionario VALUES (964, 4580.3);
INSERT INTO funcionario VALUES (966, 2536.45);
INSERT INTO funcionario VALUES (969, 9608.66);
INSERT INTO funcionario VALUES (970, 2536.45);
INSERT INTO funcionario VALUES (972, 1542.86);
INSERT INTO funcionario VALUES (978, 1502.32);
INSERT INTO funcionario VALUES (982, 2010.32);
INSERT INTO funcionario VALUES (984, 4780.6);
INSERT INTO funcionario VALUES (986, 4580.3);
INSERT INTO funcionario VALUES (987, 7458.1);
INSERT INTO funcionario VALUES (992, 2010.32);
INSERT INTO funcionario VALUES (993, 2010.32);
INSERT INTO funcionario VALUES (994, 2536.45);
INSERT INTO funcionario VALUES (995, 2355.65);
INSERT INTO funcionario VALUES (996, 2355.65);


--
-- TOC entry 2202 (class 0 OID 16701)
-- Dependencies: 189
-- Data for Name: produto_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produto_categoria VALUES (13, 23);
INSERT INTO produto_categoria VALUES (14, 23);
INSERT INTO produto_categoria VALUES (15, 23);
INSERT INTO produto_categoria VALUES (16, 23);
INSERT INTO produto_categoria VALUES (1, 19);
INSERT INTO produto_categoria VALUES (2, 19);
INSERT INTO produto_categoria VALUES (3, 19);
INSERT INTO produto_categoria VALUES (4, 19);
INSERT INTO produto_categoria VALUES (7, 25);
INSERT INTO produto_categoria VALUES (8, 25);
INSERT INTO produto_categoria VALUES (9, 25);
INSERT INTO produto_categoria VALUES (10, 25);
INSERT INTO produto_categoria VALUES (11, 25);
INSERT INTO produto_categoria VALUES (12, 25);
INSERT INTO produto_categoria VALUES (5, 20);
INSERT INTO produto_categoria VALUES (6, 20);
INSERT INTO produto_categoria VALUES (20, 16);
INSERT INTO produto_categoria VALUES (21, 16);
INSERT INTO produto_categoria VALUES (22, 16);
INSERT INTO produto_categoria VALUES (23, 16);
INSERT INTO produto_categoria VALUES (24, 16);
INSERT INTO produto_categoria VALUES (25, 11);
INSERT INTO produto_categoria VALUES (26, 11);
INSERT INTO produto_categoria VALUES (27, 17);
INSERT INTO produto_categoria VALUES (28, 17);
INSERT INTO produto_categoria VALUES (29, 17);
INSERT INTO produto_categoria VALUES (30, 17);
INSERT INTO produto_categoria VALUES (31, 17);
INSERT INTO produto_categoria VALUES (32, 10);
INSERT INTO produto_categoria VALUES (33, 10);
INSERT INTO produto_categoria VALUES (34, 10);
INSERT INTO produto_categoria VALUES (17, 26);
INSERT INTO produto_categoria VALUES (18, 26);
INSERT INTO produto_categoria VALUES (19, 26);
INSERT INTO produto_categoria VALUES (17, 27);
INSERT INTO produto_categoria VALUES (18, 27);
INSERT INTO produto_categoria VALUES (19, 27);
INSERT INTO produto_categoria VALUES (35, 15);
INSERT INTO produto_categoria VALUES (36, 15);
INSERT INTO produto_categoria VALUES (37, 15);
INSERT INTO produto_categoria VALUES (38, 15);


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 190
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_id_seq', 38, true);


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 192
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 1000, true);


--
-- TOC entry 2206 (class 0 OID 16714)
-- Dependencies: 193
-- Data for Name: usuario_telefone; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario_telefone VALUES (2, 11, 487745382);
INSERT INTO usuario_telefone VALUES (3, 56, 5714625403);
INSERT INTO usuario_telefone VALUES (3, 91, 4900904480);
INSERT INTO usuario_telefone VALUES (5, 85, 3169854822);
INSERT INTO usuario_telefone VALUES (5, 85, 4046884710);
INSERT INTO usuario_telefone VALUES (6, 81, 1761517081);
INSERT INTO usuario_telefone VALUES (8, 90, 2814563812);
INSERT INTO usuario_telefone VALUES (8, 11, 7955707157);
INSERT INTO usuario_telefone VALUES (9, 81, 8348600870);
INSERT INTO usuario_telefone VALUES (9, 56, 8396252131);
INSERT INTO usuario_telefone VALUES (9, 81, 4284125777);
INSERT INTO usuario_telefone VALUES (12, 56, 7505229378);
INSERT INTO usuario_telefone VALUES (12, 11, 8588112384);
INSERT INTO usuario_telefone VALUES (12, 56, 1919181871);
INSERT INTO usuario_telefone VALUES (14, 91, 8491058559);
INSERT INTO usuario_telefone VALUES (14, 85, 2136522389);
INSERT INTO usuario_telefone VALUES (14, 85, 1181761583);
INSERT INTO usuario_telefone VALUES (15, 11, 6587636658);
INSERT INTO usuario_telefone VALUES (15, 86, 1628573132);
INSERT INTO usuario_telefone VALUES (16, 11, 9689031731);
INSERT INTO usuario_telefone VALUES (16, 91, 145467352);
INSERT INTO usuario_telefone VALUES (17, 56, 6736058724);
INSERT INTO usuario_telefone VALUES (17, 90, 7503778791);
INSERT INTO usuario_telefone VALUES (18, 85, 5658172600);
INSERT INTO usuario_telefone VALUES (18, 11, 849399970);
INSERT INTO usuario_telefone VALUES (19, 85, 658601899);
INSERT INTO usuario_telefone VALUES (21, 11, 5165157936);
INSERT INTO usuario_telefone VALUES (23, 81, 6036286418);
INSERT INTO usuario_telefone VALUES (23, 90, 5365360222);
INSERT INTO usuario_telefone VALUES (23, 85, 9065689975);
INSERT INTO usuario_telefone VALUES (24, 91, 3406554999);
INSERT INTO usuario_telefone VALUES (24, 11, 1875160041);
INSERT INTO usuario_telefone VALUES (26, 85, 8906872301);
INSERT INTO usuario_telefone VALUES (26, 86, 7172431506);
INSERT INTO usuario_telefone VALUES (29, 86, 2551647238);
INSERT INTO usuario_telefone VALUES (29, 11, 7265266796);
INSERT INTO usuario_telefone VALUES (29, 11, 1696614144);
INSERT INTO usuario_telefone VALUES (30, 11, 2518306301);
INSERT INTO usuario_telefone VALUES (30, 91, 1382206432);
INSERT INTO usuario_telefone VALUES (31, 81, 4559509019);
INSERT INTO usuario_telefone VALUES (31, 81, 4329783104);
INSERT INTO usuario_telefone VALUES (32, 81, 9351991525);
INSERT INTO usuario_telefone VALUES (32, 85, 4246435481);
INSERT INTO usuario_telefone VALUES (33, 11, 958284185);
INSERT INTO usuario_telefone VALUES (33, 90, 9661617119);
INSERT INTO usuario_telefone VALUES (34, 91, 7942690463);
INSERT INTO usuario_telefone VALUES (34, 81, 2027400952);
INSERT INTO usuario_telefone VALUES (36, 91, 1614119912);
INSERT INTO usuario_telefone VALUES (37, 11, 7323379903);
INSERT INTO usuario_telefone VALUES (38, 90, 1134807794);
INSERT INTO usuario_telefone VALUES (38, 86, 4619341013);
INSERT INTO usuario_telefone VALUES (38, 86, 9613196597);
INSERT INTO usuario_telefone VALUES (39, 11, 8562414339);
INSERT INTO usuario_telefone VALUES (41, 86, 8021735646);
INSERT INTO usuario_telefone VALUES (41, 11, 3049521168);
INSERT INTO usuario_telefone VALUES (41, 86, 6979722341);
INSERT INTO usuario_telefone VALUES (43, 90, 6763587093);
INSERT INTO usuario_telefone VALUES (43, 86, 8061884855);
INSERT INTO usuario_telefone VALUES (43, 11, 1401334012);
INSERT INTO usuario_telefone VALUES (44, 11, 973998917);
INSERT INTO usuario_telefone VALUES (44, 11, 6836921888);
INSERT INTO usuario_telefone VALUES (44, 81, 3825649182);
INSERT INTO usuario_telefone VALUES (45, 90, 4694972233);
INSERT INTO usuario_telefone VALUES (45, 86, 1350459924);
INSERT INTO usuario_telefone VALUES (46, 85, 6584455450);
INSERT INTO usuario_telefone VALUES (47, 90, 2705314840);
INSERT INTO usuario_telefone VALUES (48, 90, 2499127347);
INSERT INTO usuario_telefone VALUES (49, 11, 3037719707);
INSERT INTO usuario_telefone VALUES (49, 86, 5027910224);
INSERT INTO usuario_telefone VALUES (49, 90, 5654451829);
INSERT INTO usuario_telefone VALUES (52, 81, 2042120854);
INSERT INTO usuario_telefone VALUES (52, 85, 5108868183);
INSERT INTO usuario_telefone VALUES (52, 91, 4161352930);
INSERT INTO usuario_telefone VALUES (54, 90, 1220231976);
INSERT INTO usuario_telefone VALUES (56, 91, 2346267278);
INSERT INTO usuario_telefone VALUES (56, 91, 2007835117);
INSERT INTO usuario_telefone VALUES (56, 81, 8690736882);
INSERT INTO usuario_telefone VALUES (57, 56, 7946716878);
INSERT INTO usuario_telefone VALUES (57, 56, 7188920493);
INSERT INTO usuario_telefone VALUES (57, 86, 9321880239);
INSERT INTO usuario_telefone VALUES (60, 90, 9967485278);
INSERT INTO usuario_telefone VALUES (62, 81, 6869953128);
INSERT INTO usuario_telefone VALUES (62, 11, 384569339);
INSERT INTO usuario_telefone VALUES (63, 90, 3322017004);
INSERT INTO usuario_telefone VALUES (67, 85, 4710553470);
INSERT INTO usuario_telefone VALUES (67, 81, 9552160572);
INSERT INTO usuario_telefone VALUES (67, 11, 9840139097);
INSERT INTO usuario_telefone VALUES (68, 85, 2001660031);
INSERT INTO usuario_telefone VALUES (68, 11, 1917600163);
INSERT INTO usuario_telefone VALUES (68, 86, 3472882202);
INSERT INTO usuario_telefone VALUES (69, 91, 7256920253);
INSERT INTO usuario_telefone VALUES (71, 56, 3694840786);
INSERT INTO usuario_telefone VALUES (71, 90, 3938454436);
INSERT INTO usuario_telefone VALUES (72, 11, 3795299401);
INSERT INTO usuario_telefone VALUES (72, 11, 7619073701);
INSERT INTO usuario_telefone VALUES (74, 11, 9060036308);
INSERT INTO usuario_telefone VALUES (74, 81, 4339622900);
INSERT INTO usuario_telefone VALUES (76, 85, 3430756826);
INSERT INTO usuario_telefone VALUES (76, 85, 8796758496);
INSERT INTO usuario_telefone VALUES (76, 85, 8446735117);
INSERT INTO usuario_telefone VALUES (77, 11, 2440615298);
INSERT INTO usuario_telefone VALUES (77, 90, 9798565648);
INSERT INTO usuario_telefone VALUES (78, 85, 2960188223);
INSERT INTO usuario_telefone VALUES (79, 85, 5956988076);
INSERT INTO usuario_telefone VALUES (80, 56, 73956220);
INSERT INTO usuario_telefone VALUES (81, 91, 7756914701);
INSERT INTO usuario_telefone VALUES (81, 90, 7468636978);
INSERT INTO usuario_telefone VALUES (81, 86, 768947140);
INSERT INTO usuario_telefone VALUES (82, 81, 3494563266);
INSERT INTO usuario_telefone VALUES (82, 81, 1277911211);
INSERT INTO usuario_telefone VALUES (83, 56, 9844484384);
INSERT INTO usuario_telefone VALUES (86, 11, 7539779791);
INSERT INTO usuario_telefone VALUES (86, 85, 3811267522);
INSERT INTO usuario_telefone VALUES (86, 85, 976140301);
INSERT INTO usuario_telefone VALUES (87, 91, 8161588656);
INSERT INTO usuario_telefone VALUES (87, 11, 3661471672);
INSERT INTO usuario_telefone VALUES (87, 85, 1469479546);
INSERT INTO usuario_telefone VALUES (89, 56, 2859069378);
INSERT INTO usuario_telefone VALUES (91, 85, 7123603719);
INSERT INTO usuario_telefone VALUES (91, 81, 9521512098);
INSERT INTO usuario_telefone VALUES (92, 11, 5344470357);
INSERT INTO usuario_telefone VALUES (92, 56, 7023557483);
INSERT INTO usuario_telefone VALUES (92, 86, 3052248540);
INSERT INTO usuario_telefone VALUES (94, 86, 8789249007);
INSERT INTO usuario_telefone VALUES (96, 81, 8192362670);
INSERT INTO usuario_telefone VALUES (96, 85, 6835487821);
INSERT INTO usuario_telefone VALUES (97, 81, 7784798464);
INSERT INTO usuario_telefone VALUES (98, 85, 6220031764);
INSERT INTO usuario_telefone VALUES (98, 81, 9627718977);
INSERT INTO usuario_telefone VALUES (99, 86, 9535518188);
INSERT INTO usuario_telefone VALUES (100, 90, 413497477);
INSERT INTO usuario_telefone VALUES (100, 86, 2799218807);
INSERT INTO usuario_telefone VALUES (101, 86, 664640224);
INSERT INTO usuario_telefone VALUES (101, 91, 5099806828);
INSERT INTO usuario_telefone VALUES (101, 86, 1443767698);
INSERT INTO usuario_telefone VALUES (103, 91, 56985555);
INSERT INTO usuario_telefone VALUES (103, 91, 2950763767);
INSERT INTO usuario_telefone VALUES (104, 85, 6056988);
INSERT INTO usuario_telefone VALUES (104, 91, 5951007299);
INSERT INTO usuario_telefone VALUES (104, 11, 3593520612);
INSERT INTO usuario_telefone VALUES (106, 86, 7856062457);
INSERT INTO usuario_telefone VALUES (106, 81, 1966956502);
INSERT INTO usuario_telefone VALUES (109, 91, 2735952290);
INSERT INTO usuario_telefone VALUES (110, 90, 6362931126);
INSERT INTO usuario_telefone VALUES (112, 56, 2127561616);
INSERT INTO usuario_telefone VALUES (114, 86, 2057656318);
INSERT INTO usuario_telefone VALUES (114, 81, 5492360377);
INSERT INTO usuario_telefone VALUES (115, 90, 7653440390);
INSERT INTO usuario_telefone VALUES (116, 91, 141857685);
INSERT INTO usuario_telefone VALUES (116, 85, 2960911366);
INSERT INTO usuario_telefone VALUES (117, 85, 3112449943);
INSERT INTO usuario_telefone VALUES (117, 11, 6703909001);
INSERT INTO usuario_telefone VALUES (117, 85, 8001754689);
INSERT INTO usuario_telefone VALUES (118, 90, 748427223);
INSERT INTO usuario_telefone VALUES (118, 85, 1169611491);
INSERT INTO usuario_telefone VALUES (120, 91, 7752099622);
INSERT INTO usuario_telefone VALUES (121, 90, 1214020997);
INSERT INTO usuario_telefone VALUES (121, 86, 5734091588);
INSERT INTO usuario_telefone VALUES (122, 90, 8397347998);
INSERT INTO usuario_telefone VALUES (122, 86, 8994797447);
INSERT INTO usuario_telefone VALUES (123, 91, 9928711487);
INSERT INTO usuario_telefone VALUES (124, 90, 3286193640);
INSERT INTO usuario_telefone VALUES (124, 86, 459521892);
INSERT INTO usuario_telefone VALUES (125, 85, 2102580117);
INSERT INTO usuario_telefone VALUES (126, 81, 6205031480);
INSERT INTO usuario_telefone VALUES (126, 90, 393639925);
INSERT INTO usuario_telefone VALUES (126, 86, 8109638919);
INSERT INTO usuario_telefone VALUES (129, 81, 1553868169);
INSERT INTO usuario_telefone VALUES (129, 85, 9079620695);
INSERT INTO usuario_telefone VALUES (129, 91, 4977345781);
INSERT INTO usuario_telefone VALUES (130, 11, 7023176654);
INSERT INTO usuario_telefone VALUES (131, 11, 410556843);
INSERT INTO usuario_telefone VALUES (133, 90, 5289143145);
INSERT INTO usuario_telefone VALUES (134, 91, 9489873555);
INSERT INTO usuario_telefone VALUES (135, 90, 4729775401);
INSERT INTO usuario_telefone VALUES (137, 91, 5408524945);
INSERT INTO usuario_telefone VALUES (138, 81, 7598482018);
INSERT INTO usuario_telefone VALUES (138, 81, 2669504500);
INSERT INTO usuario_telefone VALUES (138, 81, 3401374063);
INSERT INTO usuario_telefone VALUES (139, 86, 9483879541);
INSERT INTO usuario_telefone VALUES (140, 90, 5686897295);
INSERT INTO usuario_telefone VALUES (140, 81, 6149289326);
INSERT INTO usuario_telefone VALUES (140, 90, 2366850572);
INSERT INTO usuario_telefone VALUES (141, 90, 517789433);
INSERT INTO usuario_telefone VALUES (141, 90, 8718861254);
INSERT INTO usuario_telefone VALUES (142, 86, 4956024457);
INSERT INTO usuario_telefone VALUES (144, 85, 2639941566);
INSERT INTO usuario_telefone VALUES (144, 56, 8252809086);
INSERT INTO usuario_telefone VALUES (145, 86, 3078147482);
INSERT INTO usuario_telefone VALUES (145, 90, 8245643524);
INSERT INTO usuario_telefone VALUES (146, 85, 2081409611);
INSERT INTO usuario_telefone VALUES (148, 81, 328803344);
INSERT INTO usuario_telefone VALUES (149, 85, 7206570590);
INSERT INTO usuario_telefone VALUES (149, 90, 6225876530);
INSERT INTO usuario_telefone VALUES (150, 91, 4424988086);
INSERT INTO usuario_telefone VALUES (151, 90, 3352779968);
INSERT INTO usuario_telefone VALUES (152, 91, 4026815938);
INSERT INTO usuario_telefone VALUES (152, 90, 4500695174);
INSERT INTO usuario_telefone VALUES (152, 90, 2499297944);
INSERT INTO usuario_telefone VALUES (153, 56, 7889157248);
INSERT INTO usuario_telefone VALUES (156, 81, 3664479863);
INSERT INTO usuario_telefone VALUES (157, 81, 2218033319);
INSERT INTO usuario_telefone VALUES (157, 91, 3177897808);
INSERT INTO usuario_telefone VALUES (158, 91, 5854305230);
INSERT INTO usuario_telefone VALUES (158, 11, 3859498250);
INSERT INTO usuario_telefone VALUES (158, 85, 486677009);
INSERT INTO usuario_telefone VALUES (159, 90, 6693837888);
INSERT INTO usuario_telefone VALUES (159, 86, 7038336347);
INSERT INTO usuario_telefone VALUES (160, 85, 801388751);
INSERT INTO usuario_telefone VALUES (160, 11, 1322262032);
INSERT INTO usuario_telefone VALUES (161, 90, 2086549150);
INSERT INTO usuario_telefone VALUES (162, 85, 7329037852);
INSERT INTO usuario_telefone VALUES (162, 85, 8538668477);
INSERT INTO usuario_telefone VALUES (164, 56, 4826803854);
INSERT INTO usuario_telefone VALUES (166, 86, 7855760206);
INSERT INTO usuario_telefone VALUES (167, 86, 6213262192);
INSERT INTO usuario_telefone VALUES (167, 91, 7782630495);
INSERT INTO usuario_telefone VALUES (170, 90, 760123400);
INSERT INTO usuario_telefone VALUES (171, 86, 5587657166);
INSERT INTO usuario_telefone VALUES (172, 85, 6543410763);
INSERT INTO usuario_telefone VALUES (173, 81, 6916365148);
INSERT INTO usuario_telefone VALUES (173, 11, 8010899397);
INSERT INTO usuario_telefone VALUES (174, 11, 7339778088);
INSERT INTO usuario_telefone VALUES (174, 81, 7285520369);
INSERT INTO usuario_telefone VALUES (174, 85, 6286138216);
INSERT INTO usuario_telefone VALUES (175, 91, 9085417516);
INSERT INTO usuario_telefone VALUES (177, 56, 6665913089);
INSERT INTO usuario_telefone VALUES (177, 56, 5057164292);
INSERT INTO usuario_telefone VALUES (177, 85, 76978163);
INSERT INTO usuario_telefone VALUES (178, 81, 972264652);
INSERT INTO usuario_telefone VALUES (179, 90, 516784929);
INSERT INTO usuario_telefone VALUES (179, 85, 288580868);
INSERT INTO usuario_telefone VALUES (179, 90, 5737733318);
INSERT INTO usuario_telefone VALUES (180, 11, 6775563800);
INSERT INTO usuario_telefone VALUES (180, 11, 7849610780);
INSERT INTO usuario_telefone VALUES (180, 56, 1973127090);
INSERT INTO usuario_telefone VALUES (181, 11, 9552433531);
INSERT INTO usuario_telefone VALUES (184, 81, 9629744943);
INSERT INTO usuario_telefone VALUES (185, 56, 7563793434);
INSERT INTO usuario_telefone VALUES (187, 85, 4860514670);
INSERT INTO usuario_telefone VALUES (187, 11, 5724664831);
INSERT INTO usuario_telefone VALUES (188, 85, 6835112365);
INSERT INTO usuario_telefone VALUES (188, 85, 58558547);
INSERT INTO usuario_telefone VALUES (190, 86, 5159803345);
INSERT INTO usuario_telefone VALUES (191, 56, 520611084);
INSERT INTO usuario_telefone VALUES (193, 91, 2987422524);
INSERT INTO usuario_telefone VALUES (194, 85, 1303152498);
INSERT INTO usuario_telefone VALUES (194, 85, 5176799779);
INSERT INTO usuario_telefone VALUES (194, 11, 7331510695);
INSERT INTO usuario_telefone VALUES (195, 91, 5715520663);
INSERT INTO usuario_telefone VALUES (195, 90, 5444766448);
INSERT INTO usuario_telefone VALUES (195, 86, 1549489559);
INSERT INTO usuario_telefone VALUES (196, 56, 2282202342);
INSERT INTO usuario_telefone VALUES (196, 90, 772784157);
INSERT INTO usuario_telefone VALUES (197, 81, 704580260);
INSERT INTO usuario_telefone VALUES (198, 81, 9292522749);
INSERT INTO usuario_telefone VALUES (199, 90, 2514251380);
INSERT INTO usuario_telefone VALUES (199, 85, 6971674671);
INSERT INTO usuario_telefone VALUES (199, 91, 1665243748);
INSERT INTO usuario_telefone VALUES (200, 90, 8675371210);
INSERT INTO usuario_telefone VALUES (200, 90, 9281179914);
INSERT INTO usuario_telefone VALUES (200, 56, 6154299739);
INSERT INTO usuario_telefone VALUES (201, 85, 5589838746);
INSERT INTO usuario_telefone VALUES (201, 56, 6305402310);
INSERT INTO usuario_telefone VALUES (201, 81, 1796620271);
INSERT INTO usuario_telefone VALUES (202, 56, 4718365006);
INSERT INTO usuario_telefone VALUES (202, 86, 611879434);
INSERT INTO usuario_telefone VALUES (202, 56, 3080368673);
INSERT INTO usuario_telefone VALUES (203, 91, 3856712221);
INSERT INTO usuario_telefone VALUES (203, 85, 5792850904);
INSERT INTO usuario_telefone VALUES (205, 85, 821688635);
INSERT INTO usuario_telefone VALUES (205, 91, 7733184351);
INSERT INTO usuario_telefone VALUES (205, 90, 4106915455);
INSERT INTO usuario_telefone VALUES (206, 11, 1766249931);
INSERT INTO usuario_telefone VALUES (206, 11, 9560467812);
INSERT INTO usuario_telefone VALUES (206, 86, 1448071092);
INSERT INTO usuario_telefone VALUES (207, 85, 7639411513);
INSERT INTO usuario_telefone VALUES (207, 11, 3423910044);
INSERT INTO usuario_telefone VALUES (208, 86, 2681762958);
INSERT INTO usuario_telefone VALUES (208, 81, 2673849931);
INSERT INTO usuario_telefone VALUES (209, 90, 7275153406);
INSERT INTO usuario_telefone VALUES (209, 90, 9562989829);
INSERT INTO usuario_telefone VALUES (210, 85, 6913155132);
INSERT INTO usuario_telefone VALUES (210, 56, 8643434290);
INSERT INTO usuario_telefone VALUES (212, 90, 4268780516);
INSERT INTO usuario_telefone VALUES (212, 85, 5178356348);
INSERT INTO usuario_telefone VALUES (212, 85, 8972204432);
INSERT INTO usuario_telefone VALUES (213, 85, 872576120);
INSERT INTO usuario_telefone VALUES (213, 56, 5834878780);
INSERT INTO usuario_telefone VALUES (214, 81, 6281846411);
INSERT INTO usuario_telefone VALUES (214, 85, 779099027);
INSERT INTO usuario_telefone VALUES (214, 56, 5575811498);
INSERT INTO usuario_telefone VALUES (217, 85, 9654551657);
INSERT INTO usuario_telefone VALUES (217, 85, 6534185331);
INSERT INTO usuario_telefone VALUES (217, 85, 5464437373);
INSERT INTO usuario_telefone VALUES (219, 90, 7482342770);
INSERT INTO usuario_telefone VALUES (219, 11, 8569345306);
INSERT INTO usuario_telefone VALUES (219, 85, 9646062864);
INSERT INTO usuario_telefone VALUES (220, 85, 2544830695);
INSERT INTO usuario_telefone VALUES (220, 86, 3611205005);
INSERT INTO usuario_telefone VALUES (222, 56, 3854642556);
INSERT INTO usuario_telefone VALUES (223, 81, 4063124755);
INSERT INTO usuario_telefone VALUES (224, 86, 2126868910);
INSERT INTO usuario_telefone VALUES (224, 91, 6347098779);
INSERT INTO usuario_telefone VALUES (224, 56, 2082112377);
INSERT INTO usuario_telefone VALUES (225, 56, 919751711);
INSERT INTO usuario_telefone VALUES (225, 11, 1876664744);
INSERT INTO usuario_telefone VALUES (225, 85, 8162402607);
INSERT INTO usuario_telefone VALUES (226, 86, 8123729907);
INSERT INTO usuario_telefone VALUES (226, 11, 1612666580);
INSERT INTO usuario_telefone VALUES (226, 56, 1086367144);
INSERT INTO usuario_telefone VALUES (227, 56, 5153180346);
INSERT INTO usuario_telefone VALUES (227, 81, 5670560214);
INSERT INTO usuario_telefone VALUES (227, 81, 6603856765);
INSERT INTO usuario_telefone VALUES (228, 85, 7191025873);
INSERT INTO usuario_telefone VALUES (229, 90, 7728944870);
INSERT INTO usuario_telefone VALUES (229, 56, 7829746890);
INSERT INTO usuario_telefone VALUES (229, 90, 1644344733);
INSERT INTO usuario_telefone VALUES (233, 91, 3382361979);
INSERT INTO usuario_telefone VALUES (233, 86, 3824830966);
INSERT INTO usuario_telefone VALUES (233, 86, 5065764610);
INSERT INTO usuario_telefone VALUES (235, 85, 4330194873);
INSERT INTO usuario_telefone VALUES (235, 90, 5606752934);
INSERT INTO usuario_telefone VALUES (236, 11, 3775970407);
INSERT INTO usuario_telefone VALUES (237, 86, 5282675376);
INSERT INTO usuario_telefone VALUES (237, 85, 3570566846);
INSERT INTO usuario_telefone VALUES (237, 85, 1449283103);
INSERT INTO usuario_telefone VALUES (238, 90, 4181055589);
INSERT INTO usuario_telefone VALUES (238, 85, 6297494480);
INSERT INTO usuario_telefone VALUES (239, 11, 292503528);
INSERT INTO usuario_telefone VALUES (240, 81, 8610016931);
INSERT INTO usuario_telefone VALUES (241, 56, 1211406651);
INSERT INTO usuario_telefone VALUES (241, 91, 4783336372);
INSERT INTO usuario_telefone VALUES (241, 91, 838786981);
INSERT INTO usuario_telefone VALUES (242, 81, 5341847099);
INSERT INTO usuario_telefone VALUES (243, 90, 4552402113);
INSERT INTO usuario_telefone VALUES (243, 11, 8415945464);
INSERT INTO usuario_telefone VALUES (244, 81, 3598399893);
INSERT INTO usuario_telefone VALUES (244, 81, 5399982076);
INSERT INTO usuario_telefone VALUES (245, 81, 5961130242);
INSERT INTO usuario_telefone VALUES (246, 85, 3379883487);
INSERT INTO usuario_telefone VALUES (248, 56, 9828103441);
INSERT INTO usuario_telefone VALUES (248, 90, 894948337);
INSERT INTO usuario_telefone VALUES (248, 81, 6330383207);
INSERT INTO usuario_telefone VALUES (249, 85, 485164074);
INSERT INTO usuario_telefone VALUES (249, 90, 456401410);
INSERT INTO usuario_telefone VALUES (249, 90, 7700693021);
INSERT INTO usuario_telefone VALUES (252, 56, 6546637946);
INSERT INTO usuario_telefone VALUES (253, 85, 68904329);
INSERT INTO usuario_telefone VALUES (253, 56, 3945407608);
INSERT INTO usuario_telefone VALUES (253, 81, 2338968371);
INSERT INTO usuario_telefone VALUES (255, 85, 4934055527);
INSERT INTO usuario_telefone VALUES (259, 90, 2844486491);
INSERT INTO usuario_telefone VALUES (261, 81, 4692313759);
INSERT INTO usuario_telefone VALUES (261, 85, 5823980599);
INSERT INTO usuario_telefone VALUES (262, 85, 8475988738);
INSERT INTO usuario_telefone VALUES (262, 90, 6810080986);
INSERT INTO usuario_telefone VALUES (263, 11, 9321435882);
INSERT INTO usuario_telefone VALUES (263, 85, 4456371212);
INSERT INTO usuario_telefone VALUES (264, 85, 8098075615);
INSERT INTO usuario_telefone VALUES (264, 56, 1429648376);
INSERT INTO usuario_telefone VALUES (264, 81, 4336624839);
INSERT INTO usuario_telefone VALUES (265, 90, 1988900796);
INSERT INTO usuario_telefone VALUES (266, 85, 5508916543);
INSERT INTO usuario_telefone VALUES (267, 90, 9901560901);
INSERT INTO usuario_telefone VALUES (267, 81, 2543596014);
INSERT INTO usuario_telefone VALUES (268, 86, 1157266688);
INSERT INTO usuario_telefone VALUES (270, 90, 2467933986);
INSERT INTO usuario_telefone VALUES (270, 56, 1722373584);
INSERT INTO usuario_telefone VALUES (270, 85, 7092843690);
INSERT INTO usuario_telefone VALUES (271, 90, 3363981666);
INSERT INTO usuario_telefone VALUES (271, 11, 8551454632);
INSERT INTO usuario_telefone VALUES (271, 86, 2618404591);
INSERT INTO usuario_telefone VALUES (274, 81, 8634855168);
INSERT INTO usuario_telefone VALUES (274, 91, 5295526449);
INSERT INTO usuario_telefone VALUES (274, 85, 7302518864);
INSERT INTO usuario_telefone VALUES (275, 11, 4760945385);
INSERT INTO usuario_telefone VALUES (277, 91, 294429723);
INSERT INTO usuario_telefone VALUES (280, 90, 4141379975);
INSERT INTO usuario_telefone VALUES (281, 11, 8188225721);
INSERT INTO usuario_telefone VALUES (281, 91, 1493884774);
INSERT INTO usuario_telefone VALUES (281, 90, 9040418188);
INSERT INTO usuario_telefone VALUES (282, 85, 302303286);
INSERT INTO usuario_telefone VALUES (282, 85, 1776256697);
INSERT INTO usuario_telefone VALUES (282, 81, 2270942445);
INSERT INTO usuario_telefone VALUES (283, 85, 8713126934);
INSERT INTO usuario_telefone VALUES (283, 85, 1845200555);
INSERT INTO usuario_telefone VALUES (283, 81, 3933568073);
INSERT INTO usuario_telefone VALUES (284, 81, 6434436955);
INSERT INTO usuario_telefone VALUES (285, 56, 6655223284);
INSERT INTO usuario_telefone VALUES (285, 85, 495926806);
INSERT INTO usuario_telefone VALUES (286, 11, 5958009538);
INSERT INTO usuario_telefone VALUES (286, 90, 4016005204);
INSERT INTO usuario_telefone VALUES (286, 85, 4357390082);
INSERT INTO usuario_telefone VALUES (287, 56, 3360412628);
INSERT INTO usuario_telefone VALUES (287, 90, 9022036547);
INSERT INTO usuario_telefone VALUES (287, 11, 5823391594);
INSERT INTO usuario_telefone VALUES (288, 85, 5702489448);
INSERT INTO usuario_telefone VALUES (288, 56, 1301162865);
INSERT INTO usuario_telefone VALUES (289, 85, 5601437188);
INSERT INTO usuario_telefone VALUES (289, 86, 5804634157);
INSERT INTO usuario_telefone VALUES (289, 91, 7137349434);
INSERT INTO usuario_telefone VALUES (290, 81, 2540264901);
INSERT INTO usuario_telefone VALUES (292, 56, 5055002879);
INSERT INTO usuario_telefone VALUES (293, 91, 4183573858);
INSERT INTO usuario_telefone VALUES (293, 91, 3787905848);
INSERT INTO usuario_telefone VALUES (293, 91, 4939606624);
INSERT INTO usuario_telefone VALUES (296, 91, 5623770845);
INSERT INTO usuario_telefone VALUES (296, 56, 8290508845);
INSERT INTO usuario_telefone VALUES (296, 56, 1159429524);
INSERT INTO usuario_telefone VALUES (297, 85, 5103019984);
INSERT INTO usuario_telefone VALUES (297, 85, 9634631110);
INSERT INTO usuario_telefone VALUES (298, 91, 6594870632);
INSERT INTO usuario_telefone VALUES (300, 11, 4693161428);
INSERT INTO usuario_telefone VALUES (301, 11, 8935291952);
INSERT INTO usuario_telefone VALUES (301, 90, 630952989);
INSERT INTO usuario_telefone VALUES (301, 81, 3437123904);
INSERT INTO usuario_telefone VALUES (302, 11, 7559644946);
INSERT INTO usuario_telefone VALUES (302, 85, 6308084153);
INSERT INTO usuario_telefone VALUES (302, 85, 8806941139);
INSERT INTO usuario_telefone VALUES (303, 81, 2787618883);
INSERT INTO usuario_telefone VALUES (303, 11, 5900020386);
INSERT INTO usuario_telefone VALUES (303, 11, 930303712);
INSERT INTO usuario_telefone VALUES (304, 91, 6591253583);
INSERT INTO usuario_telefone VALUES (305, 56, 2430535914);
INSERT INTO usuario_telefone VALUES (305, 56, 224093950);
INSERT INTO usuario_telefone VALUES (306, 86, 7284114167);
INSERT INTO usuario_telefone VALUES (306, 56, 3544497682);
INSERT INTO usuario_telefone VALUES (307, 85, 6585650118);
INSERT INTO usuario_telefone VALUES (308, 56, 6842023663);
INSERT INTO usuario_telefone VALUES (309, 56, 3235063970);
INSERT INTO usuario_telefone VALUES (310, 11, 5545787307);
INSERT INTO usuario_telefone VALUES (310, 56, 3542427233);
INSERT INTO usuario_telefone VALUES (311, 86, 5070498493);
INSERT INTO usuario_telefone VALUES (311, 85, 5185868439);
INSERT INTO usuario_telefone VALUES (312, 81, 7289356767);
INSERT INTO usuario_telefone VALUES (312, 90, 5658399524);
INSERT INTO usuario_telefone VALUES (312, 90, 6198825979);
INSERT INTO usuario_telefone VALUES (313, 86, 391843494);
INSERT INTO usuario_telefone VALUES (315, 11, 9325590685);
INSERT INTO usuario_telefone VALUES (315, 56, 1713850047);
INSERT INTO usuario_telefone VALUES (316, 85, 795002301);
INSERT INTO usuario_telefone VALUES (317, 11, 1310677475);
INSERT INTO usuario_telefone VALUES (317, 91, 3185337578);
INSERT INTO usuario_telefone VALUES (319, 85, 6565277542);
INSERT INTO usuario_telefone VALUES (319, 85, 3747486289);
INSERT INTO usuario_telefone VALUES (319, 81, 7814564048);
INSERT INTO usuario_telefone VALUES (320, 56, 1653177128);
INSERT INTO usuario_telefone VALUES (321, 81, 131604308);
INSERT INTO usuario_telefone VALUES (322, 91, 1684883296);
INSERT INTO usuario_telefone VALUES (322, 86, 8078867944);
INSERT INTO usuario_telefone VALUES (323, 86, 6221482596);
INSERT INTO usuario_telefone VALUES (323, 91, 7458073599);
INSERT INTO usuario_telefone VALUES (324, 85, 1360719086);
INSERT INTO usuario_telefone VALUES (324, 86, 990493788);
INSERT INTO usuario_telefone VALUES (326, 90, 1248981118);
INSERT INTO usuario_telefone VALUES (326, 56, 8947548468);
INSERT INTO usuario_telefone VALUES (326, 85, 5580215982);
INSERT INTO usuario_telefone VALUES (328, 86, 952252771);
INSERT INTO usuario_telefone VALUES (328, 85, 2251563932);
INSERT INTO usuario_telefone VALUES (329, 11, 7004564914);
INSERT INTO usuario_telefone VALUES (329, 86, 2470585394);
INSERT INTO usuario_telefone VALUES (329, 56, 4086749734);
INSERT INTO usuario_telefone VALUES (330, 85, 1313179608);
INSERT INTO usuario_telefone VALUES (330, 90, 9481547420);
INSERT INTO usuario_telefone VALUES (331, 90, 7620949216);
INSERT INTO usuario_telefone VALUES (331, 81, 7613920678);
INSERT INTO usuario_telefone VALUES (331, 81, 933498892);
INSERT INTO usuario_telefone VALUES (332, 81, 8476621425);
INSERT INTO usuario_telefone VALUES (332, 85, 9480443064);
INSERT INTO usuario_telefone VALUES (332, 11, 1295698811);
INSERT INTO usuario_telefone VALUES (335, 86, 1864677188);
INSERT INTO usuario_telefone VALUES (335, 85, 1499710412);
INSERT INTO usuario_telefone VALUES (336, 85, 4014146794);
INSERT INTO usuario_telefone VALUES (336, 91, 72388383);
INSERT INTO usuario_telefone VALUES (337, 90, 3116880872);
INSERT INTO usuario_telefone VALUES (339, 56, 4604105017);
INSERT INTO usuario_telefone VALUES (339, 85, 9586617801);
INSERT INTO usuario_telefone VALUES (340, 91, 5085900326);
INSERT INTO usuario_telefone VALUES (340, 85, 7667036581);
INSERT INTO usuario_telefone VALUES (341, 85, 3531102548);
INSERT INTO usuario_telefone VALUES (342, 85, 7691826200);
INSERT INTO usuario_telefone VALUES (342, 11, 3919351720);
INSERT INTO usuario_telefone VALUES (342, 86, 7643959748);
INSERT INTO usuario_telefone VALUES (343, 91, 2423916660);
INSERT INTO usuario_telefone VALUES (344, 85, 9291237078);
INSERT INTO usuario_telefone VALUES (344, 81, 3176031431);
INSERT INTO usuario_telefone VALUES (346, 56, 5092364023);
INSERT INTO usuario_telefone VALUES (346, 81, 9288492313);
INSERT INTO usuario_telefone VALUES (346, 91, 7311813621);
INSERT INTO usuario_telefone VALUES (347, 85, 5716158133);
INSERT INTO usuario_telefone VALUES (348, 90, 1601586403);
INSERT INTO usuario_telefone VALUES (348, 85, 4742068909);
INSERT INTO usuario_telefone VALUES (350, 86, 9813017667);
INSERT INTO usuario_telefone VALUES (351, 85, 5054200482);
INSERT INTO usuario_telefone VALUES (351, 90, 1954261749);
INSERT INTO usuario_telefone VALUES (351, 11, 3377027980);
INSERT INTO usuario_telefone VALUES (352, 85, 3566952929);
INSERT INTO usuario_telefone VALUES (352, 85, 458738230);
INSERT INTO usuario_telefone VALUES (352, 56, 2775665818);
INSERT INTO usuario_telefone VALUES (353, 90, 639244806);
INSERT INTO usuario_telefone VALUES (353, 56, 6751826296);
INSERT INTO usuario_telefone VALUES (354, 56, 5901149804);
INSERT INTO usuario_telefone VALUES (354, 85, 2585409646);
INSERT INTO usuario_telefone VALUES (355, 11, 4276371539);
INSERT INTO usuario_telefone VALUES (355, 85, 7795623288);
INSERT INTO usuario_telefone VALUES (355, 85, 2815124464);
INSERT INTO usuario_telefone VALUES (357, 81, 2995671646);
INSERT INTO usuario_telefone VALUES (358, 91, 4289132776);
INSERT INTO usuario_telefone VALUES (358, 85, 84032330);
INSERT INTO usuario_telefone VALUES (360, 91, 2409346754);
INSERT INTO usuario_telefone VALUES (360, 86, 915252100);
INSERT INTO usuario_telefone VALUES (360, 91, 9475036844);
INSERT INTO usuario_telefone VALUES (361, 81, 1325607529);
INSERT INTO usuario_telefone VALUES (362, 91, 6994134614);
INSERT INTO usuario_telefone VALUES (363, 86, 2427918625);
INSERT INTO usuario_telefone VALUES (363, 85, 7806906728);
INSERT INTO usuario_telefone VALUES (363, 11, 8992306757);
INSERT INTO usuario_telefone VALUES (365, 86, 3980852704);
INSERT INTO usuario_telefone VALUES (366, 85, 3758212266);
INSERT INTO usuario_telefone VALUES (367, 85, 2223162349);
INSERT INTO usuario_telefone VALUES (367, 81, 4954198283);
INSERT INTO usuario_telefone VALUES (367, 56, 3185407991);
INSERT INTO usuario_telefone VALUES (368, 85, 1877541350);
INSERT INTO usuario_telefone VALUES (368, 85, 333829325);
INSERT INTO usuario_telefone VALUES (369, 90, 7371835467);
INSERT INTO usuario_telefone VALUES (369, 86, 4633841629);
INSERT INTO usuario_telefone VALUES (372, 81, 3907963279);
INSERT INTO usuario_telefone VALUES (372, 90, 8938017230);
INSERT INTO usuario_telefone VALUES (373, 56, 1548191579);
INSERT INTO usuario_telefone VALUES (374, 85, 9769447718);
INSERT INTO usuario_telefone VALUES (376, 81, 8324532745);
INSERT INTO usuario_telefone VALUES (376, 90, 3241930390);
INSERT INTO usuario_telefone VALUES (376, 56, 9098382052);
INSERT INTO usuario_telefone VALUES (377, 85, 49071988);
INSERT INTO usuario_telefone VALUES (377, 11, 4058555109);
INSERT INTO usuario_telefone VALUES (378, 86, 4275335321);
INSERT INTO usuario_telefone VALUES (378, 91, 2071256893);
INSERT INTO usuario_telefone VALUES (378, 86, 8228762763);
INSERT INTO usuario_telefone VALUES (379, 86, 9735058993);
INSERT INTO usuario_telefone VALUES (379, 56, 8055886483);
INSERT INTO usuario_telefone VALUES (379, 81, 911286196);
INSERT INTO usuario_telefone VALUES (382, 85, 1409256389);
INSERT INTO usuario_telefone VALUES (384, 90, 783944106);
INSERT INTO usuario_telefone VALUES (384, 85, 6197729852);
INSERT INTO usuario_telefone VALUES (386, 11, 1689156634);
INSERT INTO usuario_telefone VALUES (386, 85, 8369989461);
INSERT INTO usuario_telefone VALUES (387, 85, 9633571901);
INSERT INTO usuario_telefone VALUES (388, 81, 3780030632);
INSERT INTO usuario_telefone VALUES (388, 85, 5682794078);
INSERT INTO usuario_telefone VALUES (388, 91, 2551426686);
INSERT INTO usuario_telefone VALUES (390, 90, 2087915250);
INSERT INTO usuario_telefone VALUES (391, 91, 5450402417);
INSERT INTO usuario_telefone VALUES (391, 85, 2723979448);
INSERT INTO usuario_telefone VALUES (391, 91, 5305516202);
INSERT INTO usuario_telefone VALUES (392, 85, 7678472303);
INSERT INTO usuario_telefone VALUES (392, 86, 8984459799);
INSERT INTO usuario_telefone VALUES (392, 86, 7865291934);
INSERT INTO usuario_telefone VALUES (394, 86, 3128830347);
INSERT INTO usuario_telefone VALUES (395, 86, 6510041651);
INSERT INTO usuario_telefone VALUES (397, 81, 4896989495);
INSERT INTO usuario_telefone VALUES (397, 86, 5585647288);
INSERT INTO usuario_telefone VALUES (397, 11, 8240365533);
INSERT INTO usuario_telefone VALUES (398, 56, 1332686804);
INSERT INTO usuario_telefone VALUES (398, 86, 4710040487);
INSERT INTO usuario_telefone VALUES (399, 11, 5448262658);
INSERT INTO usuario_telefone VALUES (399, 90, 1153706362);
INSERT INTO usuario_telefone VALUES (399, 91, 5923796603);
INSERT INTO usuario_telefone VALUES (400, 56, 2873797240);
INSERT INTO usuario_telefone VALUES (400, 91, 4817991910);
INSERT INTO usuario_telefone VALUES (401, 56, 1376115036);
INSERT INTO usuario_telefone VALUES (401, 91, 8067764150);
INSERT INTO usuario_telefone VALUES (401, 86, 6386005087);
INSERT INTO usuario_telefone VALUES (402, 81, 8552884256);
INSERT INTO usuario_telefone VALUES (402, 85, 3976172946);
INSERT INTO usuario_telefone VALUES (403, 91, 3620100919);
INSERT INTO usuario_telefone VALUES (403, 85, 7408555668);
INSERT INTO usuario_telefone VALUES (403, 81, 774947817);
INSERT INTO usuario_telefone VALUES (404, 85, 9921221270);
INSERT INTO usuario_telefone VALUES (405, 86, 830656929);
INSERT INTO usuario_telefone VALUES (406, 85, 3366828416);
INSERT INTO usuario_telefone VALUES (408, 86, 8204785443);
INSERT INTO usuario_telefone VALUES (408, 86, 7218548709);
INSERT INTO usuario_telefone VALUES (408, 11, 577020659);
INSERT INTO usuario_telefone VALUES (409, 85, 2805339036);
INSERT INTO usuario_telefone VALUES (410, 56, 8868360593);
INSERT INTO usuario_telefone VALUES (412, 86, 9518351601);
INSERT INTO usuario_telefone VALUES (412, 56, 4982318255);
INSERT INTO usuario_telefone VALUES (412, 85, 1007100078);
INSERT INTO usuario_telefone VALUES (413, 81, 8616089304);
INSERT INTO usuario_telefone VALUES (413, 86, 6853429878);
INSERT INTO usuario_telefone VALUES (413, 85, 5847294050);
INSERT INTO usuario_telefone VALUES (415, 85, 6019208816);
INSERT INTO usuario_telefone VALUES (416, 85, 8405492880);
INSERT INTO usuario_telefone VALUES (416, 85, 2437309533);
INSERT INTO usuario_telefone VALUES (416, 91, 984909204);
INSERT INTO usuario_telefone VALUES (418, 85, 8274420807);
INSERT INTO usuario_telefone VALUES (418, 85, 3114261376);
INSERT INTO usuario_telefone VALUES (419, 81, 9682123890);
INSERT INTO usuario_telefone VALUES (419, 86, 9653612207);
INSERT INTO usuario_telefone VALUES (420, 91, 4818015600);
INSERT INTO usuario_telefone VALUES (420, 90, 8694507897);
INSERT INTO usuario_telefone VALUES (421, 91, 407538448);
INSERT INTO usuario_telefone VALUES (421, 91, 2671472559);
INSERT INTO usuario_telefone VALUES (422, 90, 7728424148);
INSERT INTO usuario_telefone VALUES (423, 90, 1818549066);
INSERT INTO usuario_telefone VALUES (424, 90, 7141993255);
INSERT INTO usuario_telefone VALUES (425, 85, 4162946063);
INSERT INTO usuario_telefone VALUES (425, 90, 1557532898);
INSERT INTO usuario_telefone VALUES (425, 91, 3876963013);
INSERT INTO usuario_telefone VALUES (426, 56, 7922955214);
INSERT INTO usuario_telefone VALUES (427, 91, 1693668726);
INSERT INTO usuario_telefone VALUES (428, 85, 2962368804);
INSERT INTO usuario_telefone VALUES (428, 11, 7908384589);
INSERT INTO usuario_telefone VALUES (429, 91, 5831656761);
INSERT INTO usuario_telefone VALUES (430, 86, 9695302358);
INSERT INTO usuario_telefone VALUES (430, 56, 3747073337);
INSERT INTO usuario_telefone VALUES (430, 90, 337677706);
INSERT INTO usuario_telefone VALUES (431, 56, 4747541061);
INSERT INTO usuario_telefone VALUES (431, 86, 5608093706);
INSERT INTO usuario_telefone VALUES (433, 81, 538912988);
INSERT INTO usuario_telefone VALUES (433, 56, 6223154334);
INSERT INTO usuario_telefone VALUES (434, 86, 384780517);
INSERT INTO usuario_telefone VALUES (435, 11, 9352649902);
INSERT INTO usuario_telefone VALUES (436, 85, 1288519706);
INSERT INTO usuario_telefone VALUES (436, 85, 5905204809);
INSERT INTO usuario_telefone VALUES (437, 86, 3168305269);
INSERT INTO usuario_telefone VALUES (437, 90, 1859141314);
INSERT INTO usuario_telefone VALUES (438, 85, 1143863703);
INSERT INTO usuario_telefone VALUES (438, 91, 997880985);
INSERT INTO usuario_telefone VALUES (438, 56, 2199510191);
INSERT INTO usuario_telefone VALUES (439, 11, 2868819058);
INSERT INTO usuario_telefone VALUES (440, 56, 6530585842);
INSERT INTO usuario_telefone VALUES (440, 90, 3465426383);
INSERT INTO usuario_telefone VALUES (441, 56, 2022779895);
INSERT INTO usuario_telefone VALUES (442, 11, 3110058717);
INSERT INTO usuario_telefone VALUES (442, 11, 6735050552);
INSERT INTO usuario_telefone VALUES (442, 90, 2644647158);
INSERT INTO usuario_telefone VALUES (444, 56, 142800376);
INSERT INTO usuario_telefone VALUES (444, 85, 2221234306);
INSERT INTO usuario_telefone VALUES (445, 11, 7637730485);
INSERT INTO usuario_telefone VALUES (445, 90, 3503913306);
INSERT INTO usuario_telefone VALUES (445, 90, 2138661457);
INSERT INTO usuario_telefone VALUES (448, 11, 7842530574);
INSERT INTO usuario_telefone VALUES (448, 11, 2127366704);
INSERT INTO usuario_telefone VALUES (448, 81, 8253630289);
INSERT INTO usuario_telefone VALUES (449, 85, 3110608839);
INSERT INTO usuario_telefone VALUES (449, 90, 571204088);
INSERT INTO usuario_telefone VALUES (449, 81, 9296019094);
INSERT INTO usuario_telefone VALUES (450, 86, 8317732038);
INSERT INTO usuario_telefone VALUES (451, 91, 7619940063);
INSERT INTO usuario_telefone VALUES (453, 56, 7442442393);
INSERT INTO usuario_telefone VALUES (453, 90, 1014820024);
INSERT INTO usuario_telefone VALUES (453, 90, 5862085582);
INSERT INTO usuario_telefone VALUES (455, 81, 948642481);
INSERT INTO usuario_telefone VALUES (456, 85, 7770312901);
INSERT INTO usuario_telefone VALUES (456, 81, 6799083550);
INSERT INTO usuario_telefone VALUES (458, 81, 9621972141);
INSERT INTO usuario_telefone VALUES (458, 86, 724991296);
INSERT INTO usuario_telefone VALUES (458, 90, 2810660530);
INSERT INTO usuario_telefone VALUES (459, 91, 4513765009);
INSERT INTO usuario_telefone VALUES (459, 56, 8333672262);
INSERT INTO usuario_telefone VALUES (459, 85, 4958479657);
INSERT INTO usuario_telefone VALUES (460, 85, 4144203673);
INSERT INTO usuario_telefone VALUES (460, 81, 1253055017);
INSERT INTO usuario_telefone VALUES (461, 91, 9735738700);
INSERT INTO usuario_telefone VALUES (462, 81, 79836257);
INSERT INTO usuario_telefone VALUES (462, 81, 7958330204);
INSERT INTO usuario_telefone VALUES (462, 85, 5721579077);
INSERT INTO usuario_telefone VALUES (463, 81, 848062575);
INSERT INTO usuario_telefone VALUES (463, 81, 1498814856);
INSERT INTO usuario_telefone VALUES (464, 81, 6176780029);
INSERT INTO usuario_telefone VALUES (465, 91, 2838298460);
INSERT INTO usuario_telefone VALUES (467, 56, 9794929269);
INSERT INTO usuario_telefone VALUES (467, 85, 7412554548);
INSERT INTO usuario_telefone VALUES (467, 81, 1006750577);
INSERT INTO usuario_telefone VALUES (468, 81, 7464292600);
INSERT INTO usuario_telefone VALUES (468, 85, 7614647865);
INSERT INTO usuario_telefone VALUES (470, 81, 12059472);
INSERT INTO usuario_telefone VALUES (471, 91, 2214513060);
INSERT INTO usuario_telefone VALUES (471, 86, 9654044672);
INSERT INTO usuario_telefone VALUES (472, 56, 1683299476);
INSERT INTO usuario_telefone VALUES (474, 11, 589510689);
INSERT INTO usuario_telefone VALUES (474, 90, 484943611);
INSERT INTO usuario_telefone VALUES (474, 85, 2385966570);
INSERT INTO usuario_telefone VALUES (475, 11, 9998070777);
INSERT INTO usuario_telefone VALUES (475, 86, 7007328812);
INSERT INTO usuario_telefone VALUES (477, 91, 7493021141);
INSERT INTO usuario_telefone VALUES (478, 81, 2156032424);
INSERT INTO usuario_telefone VALUES (479, 90, 6510106296);
INSERT INTO usuario_telefone VALUES (480, 90, 219041540);
INSERT INTO usuario_telefone VALUES (480, 85, 6598529248);
INSERT INTO usuario_telefone VALUES (480, 81, 9040236143);
INSERT INTO usuario_telefone VALUES (482, 11, 8049512207);
INSERT INTO usuario_telefone VALUES (482, 86, 3249971445);
INSERT INTO usuario_telefone VALUES (482, 90, 4990641149);
INSERT INTO usuario_telefone VALUES (483, 85, 7837569606);
INSERT INTO usuario_telefone VALUES (485, 90, 6467112295);
INSERT INTO usuario_telefone VALUES (485, 91, 3648634743);
INSERT INTO usuario_telefone VALUES (485, 85, 6043791935);
INSERT INTO usuario_telefone VALUES (487, 81, 6114317357);
INSERT INTO usuario_telefone VALUES (487, 85, 9304536813);
INSERT INTO usuario_telefone VALUES (487, 86, 1139065458);
INSERT INTO usuario_telefone VALUES (488, 56, 3732816749);
INSERT INTO usuario_telefone VALUES (489, 56, 4687125837);
INSERT INTO usuario_telefone VALUES (489, 90, 4546358085);
INSERT INTO usuario_telefone VALUES (493, 85, 9477155805);
INSERT INTO usuario_telefone VALUES (494, 11, 450448275);
INSERT INTO usuario_telefone VALUES (496, 85, 2691488005);
INSERT INTO usuario_telefone VALUES (496, 56, 1520929534);
INSERT INTO usuario_telefone VALUES (496, 56, 8964373218);
INSERT INTO usuario_telefone VALUES (497, 81, 6433280400);
INSERT INTO usuario_telefone VALUES (497, 11, 949046833);
INSERT INTO usuario_telefone VALUES (497, 85, 8420065824);
INSERT INTO usuario_telefone VALUES (498, 85, 2345231224);
INSERT INTO usuario_telefone VALUES (498, 90, 1140351251);
INSERT INTO usuario_telefone VALUES (499, 85, 7384429964);
INSERT INTO usuario_telefone VALUES (499, 91, 1416406337);
INSERT INTO usuario_telefone VALUES (501, 11, 4300248241);
INSERT INTO usuario_telefone VALUES (502, 56, 1065103770);
INSERT INTO usuario_telefone VALUES (503, 85, 5797600496);
INSERT INTO usuario_telefone VALUES (503, 85, 4511656349);
INSERT INTO usuario_telefone VALUES (504, 90, 2040596977);
INSERT INTO usuario_telefone VALUES (504, 85, 8956868233);
INSERT INTO usuario_telefone VALUES (504, 91, 8986321778);
INSERT INTO usuario_telefone VALUES (505, 81, 1347831386);
INSERT INTO usuario_telefone VALUES (505, 56, 1452371748);
INSERT INTO usuario_telefone VALUES (505, 56, 1551219228);
INSERT INTO usuario_telefone VALUES (506, 91, 6221429857);
INSERT INTO usuario_telefone VALUES (506, 56, 1362219177);
INSERT INTO usuario_telefone VALUES (507, 11, 9544411478);
INSERT INTO usuario_telefone VALUES (507, 85, 3396256688);
INSERT INTO usuario_telefone VALUES (507, 91, 9338491734);
INSERT INTO usuario_telefone VALUES (510, 91, 3654739745);
INSERT INTO usuario_telefone VALUES (511, 85, 4454967726);
INSERT INTO usuario_telefone VALUES (511, 86, 8456037677);
INSERT INTO usuario_telefone VALUES (512, 81, 4921603566);
INSERT INTO usuario_telefone VALUES (512, 85, 3871936258);
INSERT INTO usuario_telefone VALUES (513, 90, 3213880935);
INSERT INTO usuario_telefone VALUES (513, 56, 3839969434);
INSERT INTO usuario_telefone VALUES (514, 56, 4148785032);
INSERT INTO usuario_telefone VALUES (514, 56, 4011620089);
INSERT INTO usuario_telefone VALUES (514, 11, 8839514870);
INSERT INTO usuario_telefone VALUES (515, 81, 2474677180);
INSERT INTO usuario_telefone VALUES (515, 11, 5614481344);
INSERT INTO usuario_telefone VALUES (516, 11, 5148224388);
INSERT INTO usuario_telefone VALUES (516, 85, 6499824027);
INSERT INTO usuario_telefone VALUES (516, 85, 7242034252);
INSERT INTO usuario_telefone VALUES (517, 86, 5262252435);
INSERT INTO usuario_telefone VALUES (517, 91, 8839736285);
INSERT INTO usuario_telefone VALUES (517, 11, 2312145097);
INSERT INTO usuario_telefone VALUES (519, 81, 5124008894);
INSERT INTO usuario_telefone VALUES (519, 81, 854979137);
INSERT INTO usuario_telefone VALUES (519, 85, 4069833335);
INSERT INTO usuario_telefone VALUES (520, 81, 546878038);
INSERT INTO usuario_telefone VALUES (520, 85, 2251131136);
INSERT INTO usuario_telefone VALUES (524, 85, 1775300113);
INSERT INTO usuario_telefone VALUES (524, 86, 4656903970);
INSERT INTO usuario_telefone VALUES (524, 90, 6021639373);
INSERT INTO usuario_telefone VALUES (525, 91, 3920209355);
INSERT INTO usuario_telefone VALUES (525, 90, 1727748267);
INSERT INTO usuario_telefone VALUES (528, 85, 6297422025);
INSERT INTO usuario_telefone VALUES (528, 81, 5089319692);
INSERT INTO usuario_telefone VALUES (528, 91, 7481381934);
INSERT INTO usuario_telefone VALUES (529, 81, 1818375663);
INSERT INTO usuario_telefone VALUES (529, 56, 3220050321);
INSERT INTO usuario_telefone VALUES (530, 11, 3013827295);
INSERT INTO usuario_telefone VALUES (530, 85, 6398082673);
INSERT INTO usuario_telefone VALUES (531, 86, 5869499963);
INSERT INTO usuario_telefone VALUES (532, 91, 6378053143);
INSERT INTO usuario_telefone VALUES (532, 81, 8774702045);
INSERT INTO usuario_telefone VALUES (534, 56, 4026975703);
INSERT INTO usuario_telefone VALUES (534, 11, 8605019065);
INSERT INTO usuario_telefone VALUES (535, 90, 2065598759);
INSERT INTO usuario_telefone VALUES (535, 85, 7987331133);
INSERT INTO usuario_telefone VALUES (536, 81, 3869895435);
INSERT INTO usuario_telefone VALUES (536, 90, 1617359387);
INSERT INTO usuario_telefone VALUES (536, 90, 3913775662);
INSERT INTO usuario_telefone VALUES (537, 85, 9530324876);
INSERT INTO usuario_telefone VALUES (537, 11, 5667447219);
INSERT INTO usuario_telefone VALUES (537, 85, 9064125351);
INSERT INTO usuario_telefone VALUES (538, 86, 1979209880);
INSERT INTO usuario_telefone VALUES (539, 11, 3801034620);
INSERT INTO usuario_telefone VALUES (539, 11, 2094584454);
INSERT INTO usuario_telefone VALUES (540, 11, 9935557348);
INSERT INTO usuario_telefone VALUES (541, 85, 1416475871);
INSERT INTO usuario_telefone VALUES (543, 85, 8632965737);
INSERT INTO usuario_telefone VALUES (543, 86, 5574627909);
INSERT INTO usuario_telefone VALUES (547, 11, 8429999086);
INSERT INTO usuario_telefone VALUES (548, 81, 7329278667);
INSERT INTO usuario_telefone VALUES (548, 81, 5561555109);
INSERT INTO usuario_telefone VALUES (550, 85, 5422744381);
INSERT INTO usuario_telefone VALUES (551, 56, 2504257854);
INSERT INTO usuario_telefone VALUES (551, 86, 4868681271);
INSERT INTO usuario_telefone VALUES (551, 90, 8425387665);
INSERT INTO usuario_telefone VALUES (553, 91, 460464520);
INSERT INTO usuario_telefone VALUES (553, 91, 4392493259);
INSERT INTO usuario_telefone VALUES (554, 85, 1520067955);
INSERT INTO usuario_telefone VALUES (555, 11, 581334918);
INSERT INTO usuario_telefone VALUES (556, 81, 9728319885);
INSERT INTO usuario_telefone VALUES (557, 90, 9420962803);
INSERT INTO usuario_telefone VALUES (557, 81, 5087279365);
INSERT INTO usuario_telefone VALUES (558, 86, 3284342951);
INSERT INTO usuario_telefone VALUES (558, 56, 1682605866);
INSERT INTO usuario_telefone VALUES (558, 56, 4666675024);
INSERT INTO usuario_telefone VALUES (560, 85, 3423880400);
INSERT INTO usuario_telefone VALUES (561, 85, 3065279161);
INSERT INTO usuario_telefone VALUES (561, 85, 8300549599);
INSERT INTO usuario_telefone VALUES (561, 86, 1912573911);
INSERT INTO usuario_telefone VALUES (564, 86, 7684449173);
INSERT INTO usuario_telefone VALUES (564, 85, 2548920564);
INSERT INTO usuario_telefone VALUES (565, 56, 4006128713);
INSERT INTO usuario_telefone VALUES (565, 86, 6295833776);
INSERT INTO usuario_telefone VALUES (566, 11, 2901384089);
INSERT INTO usuario_telefone VALUES (566, 91, 1295545574);
INSERT INTO usuario_telefone VALUES (566, 91, 5577591729);
INSERT INTO usuario_telefone VALUES (567, 86, 9183290769);
INSERT INTO usuario_telefone VALUES (567, 81, 7633897907);
INSERT INTO usuario_telefone VALUES (568, 56, 1984842609);
INSERT INTO usuario_telefone VALUES (568, 81, 8198003643);
INSERT INTO usuario_telefone VALUES (568, 11, 699715524);
INSERT INTO usuario_telefone VALUES (570, 85, 2638268117);
INSERT INTO usuario_telefone VALUES (570, 91, 1820404780);
INSERT INTO usuario_telefone VALUES (571, 91, 1929074503);
INSERT INTO usuario_telefone VALUES (571, 81, 2442294856);
INSERT INTO usuario_telefone VALUES (571, 56, 2665169275);
INSERT INTO usuario_telefone VALUES (572, 90, 5053882704);
INSERT INTO usuario_telefone VALUES (572, 85, 2235074072);
INSERT INTO usuario_telefone VALUES (572, 81, 3017309386);
INSERT INTO usuario_telefone VALUES (573, 11, 3294220610);
INSERT INTO usuario_telefone VALUES (574, 90, 7908357451);
INSERT INTO usuario_telefone VALUES (575, 85, 2400051176);
INSERT INTO usuario_telefone VALUES (576, 91, 7864373864);
INSERT INTO usuario_telefone VALUES (576, 11, 2339194577);
INSERT INTO usuario_telefone VALUES (577, 85, 6943273702);
INSERT INTO usuario_telefone VALUES (577, 85, 5373600809);
INSERT INTO usuario_telefone VALUES (578, 91, 8568988198);
INSERT INTO usuario_telefone VALUES (578, 81, 8622947035);
INSERT INTO usuario_telefone VALUES (579, 91, 8244791252);
INSERT INTO usuario_telefone VALUES (579, 85, 7025129877);
INSERT INTO usuario_telefone VALUES (579, 85, 8613327659);
INSERT INTO usuario_telefone VALUES (580, 90, 4713121323);
INSERT INTO usuario_telefone VALUES (580, 11, 5753544733);
INSERT INTO usuario_telefone VALUES (580, 56, 6124617985);
INSERT INTO usuario_telefone VALUES (581, 86, 7614106599);
INSERT INTO usuario_telefone VALUES (581, 56, 2987796473);
INSERT INTO usuario_telefone VALUES (581, 85, 2273009053);
INSERT INTO usuario_telefone VALUES (582, 11, 4237454462);
INSERT INTO usuario_telefone VALUES (583, 91, 3586237630);
INSERT INTO usuario_telefone VALUES (583, 86, 9005930092);
INSERT INTO usuario_telefone VALUES (584, 56, 7345915227);
INSERT INTO usuario_telefone VALUES (584, 85, 5986107398);
INSERT INTO usuario_telefone VALUES (585, 85, 7979382600);
INSERT INTO usuario_telefone VALUES (585, 85, 3514149684);
INSERT INTO usuario_telefone VALUES (585, 11, 3592013223);
INSERT INTO usuario_telefone VALUES (586, 11, 9988517481);
INSERT INTO usuario_telefone VALUES (586, 11, 8708288335);
INSERT INTO usuario_telefone VALUES (586, 81, 2285545053);
INSERT INTO usuario_telefone VALUES (587, 86, 301086105);
INSERT INTO usuario_telefone VALUES (588, 86, 2232349345);
INSERT INTO usuario_telefone VALUES (588, 86, 2696189764);
INSERT INTO usuario_telefone VALUES (590, 86, 1045970896);
INSERT INTO usuario_telefone VALUES (590, 90, 5745613351);
INSERT INTO usuario_telefone VALUES (590, 11, 6443746968);
INSERT INTO usuario_telefone VALUES (591, 85, 8417828921);
INSERT INTO usuario_telefone VALUES (592, 91, 6106498001);
INSERT INTO usuario_telefone VALUES (592, 86, 7540977403);
INSERT INTO usuario_telefone VALUES (592, 91, 4650730969);
INSERT INTO usuario_telefone VALUES (594, 81, 7600908269);
INSERT INTO usuario_telefone VALUES (595, 85, 3820537386);
INSERT INTO usuario_telefone VALUES (597, 81, 7913691833);
INSERT INTO usuario_telefone VALUES (597, 91, 2638017242);
INSERT INTO usuario_telefone VALUES (598, 85, 5071536029);
INSERT INTO usuario_telefone VALUES (598, 56, 2771076275);
INSERT INTO usuario_telefone VALUES (599, 91, 3819216144);
INSERT INTO usuario_telefone VALUES (599, 11, 7626530860);
INSERT INTO usuario_telefone VALUES (599, 85, 4446550076);
INSERT INTO usuario_telefone VALUES (602, 11, 9494538224);
INSERT INTO usuario_telefone VALUES (603, 85, 2297586272);
INSERT INTO usuario_telefone VALUES (603, 86, 6272070727);
INSERT INTO usuario_telefone VALUES (604, 11, 6922566644);
INSERT INTO usuario_telefone VALUES (604, 56, 9256877230);
INSERT INTO usuario_telefone VALUES (606, 81, 1239621172);
INSERT INTO usuario_telefone VALUES (609, 91, 8581985937);
INSERT INTO usuario_telefone VALUES (609, 56, 1911494581);
INSERT INTO usuario_telefone VALUES (609, 11, 5567889252);
INSERT INTO usuario_telefone VALUES (610, 81, 3711408294);
INSERT INTO usuario_telefone VALUES (610, 56, 2382425626);
INSERT INTO usuario_telefone VALUES (612, 56, 4923076424);
INSERT INTO usuario_telefone VALUES (613, 86, 258950508);
INSERT INTO usuario_telefone VALUES (613, 91, 5724053947);
INSERT INTO usuario_telefone VALUES (613, 91, 62963756);
INSERT INTO usuario_telefone VALUES (614, 90, 6612442021);
INSERT INTO usuario_telefone VALUES (614, 81, 1258048588);
INSERT INTO usuario_telefone VALUES (614, 86, 8871104183);
INSERT INTO usuario_telefone VALUES (615, 56, 7665463752);
INSERT INTO usuario_telefone VALUES (615, 85, 1680124627);
INSERT INTO usuario_telefone VALUES (615, 11, 5619382996);
INSERT INTO usuario_telefone VALUES (616, 85, 5445538823);
INSERT INTO usuario_telefone VALUES (616, 11, 1084321800);
INSERT INTO usuario_telefone VALUES (616, 85, 2397405825);
INSERT INTO usuario_telefone VALUES (617, 91, 3147187223);
INSERT INTO usuario_telefone VALUES (618, 81, 328416563);
INSERT INTO usuario_telefone VALUES (618, 56, 2996526166);
INSERT INTO usuario_telefone VALUES (618, 56, 4696764352);
INSERT INTO usuario_telefone VALUES (620, 85, 1730248438);
INSERT INTO usuario_telefone VALUES (620, 81, 3672056643);
INSERT INTO usuario_telefone VALUES (620, 85, 8471205035);
INSERT INTO usuario_telefone VALUES (621, 56, 1050952347);
INSERT INTO usuario_telefone VALUES (621, 86, 3871821585);
INSERT INTO usuario_telefone VALUES (622, 85, 7570668468);
INSERT INTO usuario_telefone VALUES (624, 91, 110715450);
INSERT INTO usuario_telefone VALUES (624, 81, 871110245);
INSERT INTO usuario_telefone VALUES (624, 85, 8775844448);
INSERT INTO usuario_telefone VALUES (625, 86, 2631276253);
INSERT INTO usuario_telefone VALUES (626, 90, 7111480969);
INSERT INTO usuario_telefone VALUES (626, 85, 2071309841);
INSERT INTO usuario_telefone VALUES (626, 86, 272350582);
INSERT INTO usuario_telefone VALUES (628, 56, 1180375381);
INSERT INTO usuario_telefone VALUES (628, 81, 6493302041);
INSERT INTO usuario_telefone VALUES (629, 85, 5770592332);
INSERT INTO usuario_telefone VALUES (629, 90, 8987275278);
INSERT INTO usuario_telefone VALUES (630, 90, 5537469580);
INSERT INTO usuario_telefone VALUES (631, 90, 4030246410);
INSERT INTO usuario_telefone VALUES (631, 11, 6531935201);
INSERT INTO usuario_telefone VALUES (633, 11, 5780387878);
INSERT INTO usuario_telefone VALUES (633, 85, 1369144071);
INSERT INTO usuario_telefone VALUES (634, 86, 7323991988);
INSERT INTO usuario_telefone VALUES (634, 81, 784654886);
INSERT INTO usuario_telefone VALUES (635, 11, 6666866622);
INSERT INTO usuario_telefone VALUES (635, 81, 7270831487);
INSERT INTO usuario_telefone VALUES (635, 56, 8161774711);
INSERT INTO usuario_telefone VALUES (637, 81, 445368215);
INSERT INTO usuario_telefone VALUES (638, 85, 9528337117);
INSERT INTO usuario_telefone VALUES (638, 86, 2853512946);
INSERT INTO usuario_telefone VALUES (639, 91, 2645616687);
INSERT INTO usuario_telefone VALUES (640, 81, 9306322274);
INSERT INTO usuario_telefone VALUES (640, 91, 5402491347);
INSERT INTO usuario_telefone VALUES (640, 86, 1705520081);
INSERT INTO usuario_telefone VALUES (641, 85, 2319519984);
INSERT INTO usuario_telefone VALUES (641, 11, 6152429419);
INSERT INTO usuario_telefone VALUES (642, 81, 5232956516);
INSERT INTO usuario_telefone VALUES (642, 11, 4663085232);
INSERT INTO usuario_telefone VALUES (644, 85, 8636124647);
INSERT INTO usuario_telefone VALUES (644, 56, 8572396023);
INSERT INTO usuario_telefone VALUES (646, 90, 270139015);
INSERT INTO usuario_telefone VALUES (646, 81, 9597753053);
INSERT INTO usuario_telefone VALUES (646, 81, 7002703685);
INSERT INTO usuario_telefone VALUES (648, 11, 3390292457);
INSERT INTO usuario_telefone VALUES (650, 91, 4401837819);
INSERT INTO usuario_telefone VALUES (650, 85, 6341717674);
INSERT INTO usuario_telefone VALUES (650, 56, 9114368501);
INSERT INTO usuario_telefone VALUES (652, 85, 7996138209);
INSERT INTO usuario_telefone VALUES (653, 91, 2910526840);
INSERT INTO usuario_telefone VALUES (654, 81, 200108112);
INSERT INTO usuario_telefone VALUES (654, 85, 8262143926);
INSERT INTO usuario_telefone VALUES (655, 85, 7688720698);
INSERT INTO usuario_telefone VALUES (655, 56, 6578747125);
INSERT INTO usuario_telefone VALUES (655, 81, 69418293);
INSERT INTO usuario_telefone VALUES (656, 85, 3942380145);
INSERT INTO usuario_telefone VALUES (657, 85, 604415048);
INSERT INTO usuario_telefone VALUES (657, 85, 9664285829);
INSERT INTO usuario_telefone VALUES (660, 85, 3610178973);
INSERT INTO usuario_telefone VALUES (660, 11, 9657168058);
INSERT INTO usuario_telefone VALUES (662, 90, 1944309608);
INSERT INTO usuario_telefone VALUES (662, 90, 1196201787);
INSERT INTO usuario_telefone VALUES (664, 11, 3400498991);
INSERT INTO usuario_telefone VALUES (665, 81, 6171020552);
INSERT INTO usuario_telefone VALUES (666, 11, 9317040260);
INSERT INTO usuario_telefone VALUES (667, 90, 5476533385);
INSERT INTO usuario_telefone VALUES (667, 85, 2158139313);
INSERT INTO usuario_telefone VALUES (668, 86, 3681167854);
INSERT INTO usuario_telefone VALUES (668, 56, 7159489010);
INSERT INTO usuario_telefone VALUES (668, 11, 7474843276);
INSERT INTO usuario_telefone VALUES (672, 90, 4053992136);
INSERT INTO usuario_telefone VALUES (672, 91, 6353383970);
INSERT INTO usuario_telefone VALUES (673, 86, 7757493428);
INSERT INTO usuario_telefone VALUES (673, 81, 303481641);
INSERT INTO usuario_telefone VALUES (674, 11, 2183745495);
INSERT INTO usuario_telefone VALUES (677, 56, 5127781735);
INSERT INTO usuario_telefone VALUES (677, 85, 3156488914);
INSERT INTO usuario_telefone VALUES (677, 86, 368786830);
INSERT INTO usuario_telefone VALUES (678, 56, 7332627502);
INSERT INTO usuario_telefone VALUES (679, 11, 2025547442);
INSERT INTO usuario_telefone VALUES (679, 11, 2474604575);
INSERT INTO usuario_telefone VALUES (680, 91, 8562194199);
INSERT INTO usuario_telefone VALUES (680, 56, 3574425305);
INSERT INTO usuario_telefone VALUES (681, 86, 8700653269);
INSERT INTO usuario_telefone VALUES (682, 56, 6972064712);
INSERT INTO usuario_telefone VALUES (682, 81, 772318331);
INSERT INTO usuario_telefone VALUES (683, 56, 2056683020);
INSERT INTO usuario_telefone VALUES (683, 91, 7676990725);
INSERT INTO usuario_telefone VALUES (684, 86, 5833830180);
INSERT INTO usuario_telefone VALUES (686, 11, 5159841486);
INSERT INTO usuario_telefone VALUES (686, 81, 5623210264);
INSERT INTO usuario_telefone VALUES (686, 11, 4776373195);
INSERT INTO usuario_telefone VALUES (687, 91, 9110597416);
INSERT INTO usuario_telefone VALUES (687, 85, 7852109241);
INSERT INTO usuario_telefone VALUES (687, 85, 6329957934);
INSERT INTO usuario_telefone VALUES (689, 91, 7936924724);
INSERT INTO usuario_telefone VALUES (690, 86, 3159277801);
INSERT INTO usuario_telefone VALUES (690, 11, 8115400973);
INSERT INTO usuario_telefone VALUES (692, 90, 943262349);
INSERT INTO usuario_telefone VALUES (693, 86, 549001617);
INSERT INTO usuario_telefone VALUES (694, 86, 1463629926);
INSERT INTO usuario_telefone VALUES (694, 90, 3411660903);
INSERT INTO usuario_telefone VALUES (694, 86, 8452022773);
INSERT INTO usuario_telefone VALUES (695, 85, 2294778296);
INSERT INTO usuario_telefone VALUES (695, 85, 5039573708);
INSERT INTO usuario_telefone VALUES (695, 90, 879210602);
INSERT INTO usuario_telefone VALUES (697, 56, 693706006);
INSERT INTO usuario_telefone VALUES (698, 91, 2546656472);
INSERT INTO usuario_telefone VALUES (700, 90, 5665593585);
INSERT INTO usuario_telefone VALUES (701, 86, 7780026920);
INSERT INTO usuario_telefone VALUES (701, 81, 7827433427);
INSERT INTO usuario_telefone VALUES (701, 91, 1270214463);
INSERT INTO usuario_telefone VALUES (703, 85, 4503902768);
INSERT INTO usuario_telefone VALUES (703, 85, 4043162375);
INSERT INTO usuario_telefone VALUES (704, 56, 887390586);
INSERT INTO usuario_telefone VALUES (704, 85, 2662267272);
INSERT INTO usuario_telefone VALUES (704, 85, 1928759685);
INSERT INTO usuario_telefone VALUES (705, 85, 3898704001);
INSERT INTO usuario_telefone VALUES (707, 85, 8798159322);
INSERT INTO usuario_telefone VALUES (708, 11, 6762771041);
INSERT INTO usuario_telefone VALUES (708, 85, 9613117784);
INSERT INTO usuario_telefone VALUES (709, 86, 9766205707);
INSERT INTO usuario_telefone VALUES (709, 90, 8175757034);
INSERT INTO usuario_telefone VALUES (709, 11, 5568319104);
INSERT INTO usuario_telefone VALUES (710, 56, 500977283);
INSERT INTO usuario_telefone VALUES (711, 85, 1297228469);
INSERT INTO usuario_telefone VALUES (711, 86, 3975561203);
INSERT INTO usuario_telefone VALUES (711, 91, 366439275);
INSERT INTO usuario_telefone VALUES (712, 11, 3292921995);
INSERT INTO usuario_telefone VALUES (712, 11, 9140306068);
INSERT INTO usuario_telefone VALUES (712, 85, 3418604647);
INSERT INTO usuario_telefone VALUES (713, 91, 6255890112);
INSERT INTO usuario_telefone VALUES (714, 91, 2082637274);
INSERT INTO usuario_telefone VALUES (714, 11, 1051945911);
INSERT INTO usuario_telefone VALUES (714, 85, 7397751961);
INSERT INTO usuario_telefone VALUES (716, 86, 7826057180);
INSERT INTO usuario_telefone VALUES (716, 85, 234730291);
INSERT INTO usuario_telefone VALUES (717, 86, 2537114020);
INSERT INTO usuario_telefone VALUES (718, 90, 7054321855);
INSERT INTO usuario_telefone VALUES (718, 85, 8125472015);
INSERT INTO usuario_telefone VALUES (718, 86, 3160982769);
INSERT INTO usuario_telefone VALUES (721, 91, 148697992);
INSERT INTO usuario_telefone VALUES (721, 56, 5864543555);
INSERT INTO usuario_telefone VALUES (723, 85, 6028005116);
INSERT INTO usuario_telefone VALUES (724, 91, 808827315);
INSERT INTO usuario_telefone VALUES (724, 85, 5810347850);
INSERT INTO usuario_telefone VALUES (724, 86, 9974615467);
INSERT INTO usuario_telefone VALUES (727, 81, 5441054770);
INSERT INTO usuario_telefone VALUES (727, 90, 8939752715);
INSERT INTO usuario_telefone VALUES (728, 85, 514956134);
INSERT INTO usuario_telefone VALUES (728, 85, 2223148093);
INSERT INTO usuario_telefone VALUES (730, 56, 9204182010);
INSERT INTO usuario_telefone VALUES (730, 90, 2315904001);
INSERT INTO usuario_telefone VALUES (731, 85, 8283371190);
INSERT INTO usuario_telefone VALUES (731, 85, 9740157251);
INSERT INTO usuario_telefone VALUES (731, 86, 2709931285);
INSERT INTO usuario_telefone VALUES (732, 86, 8236623723);
INSERT INTO usuario_telefone VALUES (733, 90, 3994462586);
INSERT INTO usuario_telefone VALUES (733, 86, 6928055301);
INSERT INTO usuario_telefone VALUES (734, 86, 9020452375);
INSERT INTO usuario_telefone VALUES (734, 86, 9576176711);
INSERT INTO usuario_telefone VALUES (734, 85, 4501101328);
INSERT INTO usuario_telefone VALUES (735, 81, 7268027331);
INSERT INTO usuario_telefone VALUES (736, 85, 168812880);
INSERT INTO usuario_telefone VALUES (736, 81, 7717514939);
INSERT INTO usuario_telefone VALUES (736, 81, 990335598);
INSERT INTO usuario_telefone VALUES (737, 81, 7203720771);
INSERT INTO usuario_telefone VALUES (738, 90, 9015195468);
INSERT INTO usuario_telefone VALUES (739, 81, 5105693781);
INSERT INTO usuario_telefone VALUES (740, 56, 6814738361);
INSERT INTO usuario_telefone VALUES (740, 11, 7782689888);
INSERT INTO usuario_telefone VALUES (743, 91, 4444359512);
INSERT INTO usuario_telefone VALUES (743, 90, 1452070984);
INSERT INTO usuario_telefone VALUES (743, 85, 6996765543);
INSERT INTO usuario_telefone VALUES (744, 11, 215388322);
INSERT INTO usuario_telefone VALUES (744, 81, 6250027237);
INSERT INTO usuario_telefone VALUES (745, 86, 7870444410);
INSERT INTO usuario_telefone VALUES (745, 85, 2097244183);
INSERT INTO usuario_telefone VALUES (746, 85, 1937487572);
INSERT INTO usuario_telefone VALUES (746, 90, 8289978353);
INSERT INTO usuario_telefone VALUES (746, 85, 2648311486);
INSERT INTO usuario_telefone VALUES (747, 90, 6969663541);
INSERT INTO usuario_telefone VALUES (747, 91, 3883135999);
INSERT INTO usuario_telefone VALUES (747, 11, 5451220292);
INSERT INTO usuario_telefone VALUES (748, 81, 9499975555);
INSERT INTO usuario_telefone VALUES (749, 85, 3344641374);
INSERT INTO usuario_telefone VALUES (750, 85, 6245876992);
INSERT INTO usuario_telefone VALUES (752, 11, 9097909022);
INSERT INTO usuario_telefone VALUES (752, 56, 1780590437);
INSERT INTO usuario_telefone VALUES (752, 85, 7198808007);
INSERT INTO usuario_telefone VALUES (754, 91, 1524727263);
INSERT INTO usuario_telefone VALUES (754, 85, 1003006304);
INSERT INTO usuario_telefone VALUES (755, 81, 5027962876);
INSERT INTO usuario_telefone VALUES (755, 86, 9552799002);
INSERT INTO usuario_telefone VALUES (755, 85, 3203151852);
INSERT INTO usuario_telefone VALUES (756, 91, 464215580);
INSERT INTO usuario_telefone VALUES (757, 91, 1556424964);
INSERT INTO usuario_telefone VALUES (758, 90, 2732770962);
INSERT INTO usuario_telefone VALUES (758, 85, 4732317701);
INSERT INTO usuario_telefone VALUES (758, 86, 9621502683);
INSERT INTO usuario_telefone VALUES (759, 81, 8457363692);
INSERT INTO usuario_telefone VALUES (759, 91, 3054454592);
INSERT INTO usuario_telefone VALUES (761, 85, 7586908334);
INSERT INTO usuario_telefone VALUES (761, 86, 3236875467);
INSERT INTO usuario_telefone VALUES (761, 11, 5146147490);
INSERT INTO usuario_telefone VALUES (763, 85, 1786649726);
INSERT INTO usuario_telefone VALUES (764, 56, 4616134909);
INSERT INTO usuario_telefone VALUES (765, 91, 7884749967);
INSERT INTO usuario_telefone VALUES (765, 81, 7751205185);
INSERT INTO usuario_telefone VALUES (766, 11, 4010542750);
INSERT INTO usuario_telefone VALUES (766, 91, 4197540459);
INSERT INTO usuario_telefone VALUES (766, 81, 1910294111);
INSERT INTO usuario_telefone VALUES (767, 91, 2373051473);
INSERT INTO usuario_telefone VALUES (767, 56, 7981546994);
INSERT INTO usuario_telefone VALUES (769, 86, 4000172419);
INSERT INTO usuario_telefone VALUES (769, 86, 6781433564);
INSERT INTO usuario_telefone VALUES (770, 90, 9940415490);
INSERT INTO usuario_telefone VALUES (770, 85, 544110561);
INSERT INTO usuario_telefone VALUES (771, 90, 9903376129);
INSERT INTO usuario_telefone VALUES (771, 91, 2074807994);
INSERT INTO usuario_telefone VALUES (771, 81, 4225694869);
INSERT INTO usuario_telefone VALUES (773, 85, 5195745665);
INSERT INTO usuario_telefone VALUES (774, 81, 818247321);
INSERT INTO usuario_telefone VALUES (774, 85, 5316677605);
INSERT INTO usuario_telefone VALUES (774, 91, 2928590074);
INSERT INTO usuario_telefone VALUES (776, 90, 4438145585);
INSERT INTO usuario_telefone VALUES (777, 91, 1886409223);
INSERT INTO usuario_telefone VALUES (778, 11, 5675575520);
INSERT INTO usuario_telefone VALUES (780, 85, 6101785902);
INSERT INTO usuario_telefone VALUES (781, 90, 2704074522);
INSERT INTO usuario_telefone VALUES (781, 81, 6689903953);
INSERT INTO usuario_telefone VALUES (781, 91, 8169882281);
INSERT INTO usuario_telefone VALUES (782, 81, 7028721053);
INSERT INTO usuario_telefone VALUES (782, 11, 3960210110);
INSERT INTO usuario_telefone VALUES (782, 86, 1746595771);
INSERT INTO usuario_telefone VALUES (784, 90, 7733011673);
INSERT INTO usuario_telefone VALUES (785, 85, 6189574880);
INSERT INTO usuario_telefone VALUES (785, 11, 2732725307);
INSERT INTO usuario_telefone VALUES (785, 81, 5403270398);
INSERT INTO usuario_telefone VALUES (787, 85, 5365811322);
INSERT INTO usuario_telefone VALUES (787, 90, 7432335398);
INSERT INTO usuario_telefone VALUES (787, 56, 3351888558);
INSERT INTO usuario_telefone VALUES (788, 56, 4727197705);
INSERT INTO usuario_telefone VALUES (788, 86, 7931599978);
INSERT INTO usuario_telefone VALUES (789, 56, 5850249705);
INSERT INTO usuario_telefone VALUES (789, 56, 8243092501);
INSERT INTO usuario_telefone VALUES (789, 81, 7640857681);
INSERT INTO usuario_telefone VALUES (792, 91, 90272946);
INSERT INTO usuario_telefone VALUES (792, 90, 6684971156);
INSERT INTO usuario_telefone VALUES (793, 85, 5599323679);
INSERT INTO usuario_telefone VALUES (794, 56, 8591729485);
INSERT INTO usuario_telefone VALUES (795, 81, 2307599399);
INSERT INTO usuario_telefone VALUES (796, 11, 3455224341);
INSERT INTO usuario_telefone VALUES (797, 85, 1306736596);
INSERT INTO usuario_telefone VALUES (797, 90, 3275851128);
INSERT INTO usuario_telefone VALUES (797, 11, 2317351899);
INSERT INTO usuario_telefone VALUES (799, 85, 6763628596);
INSERT INTO usuario_telefone VALUES (800, 56, 6346971995);
INSERT INTO usuario_telefone VALUES (800, 90, 2501149288);
INSERT INTO usuario_telefone VALUES (800, 90, 6776753763);
INSERT INTO usuario_telefone VALUES (801, 91, 1200102811);
INSERT INTO usuario_telefone VALUES (802, 91, 7876682825);
INSERT INTO usuario_telefone VALUES (802, 85, 7853665468);
INSERT INTO usuario_telefone VALUES (802, 56, 4102535900);
INSERT INTO usuario_telefone VALUES (803, 11, 6063271929);
INSERT INTO usuario_telefone VALUES (804, 56, 7434021332);
INSERT INTO usuario_telefone VALUES (804, 90, 2523216138);
INSERT INTO usuario_telefone VALUES (805, 56, 4279072333);
INSERT INTO usuario_telefone VALUES (807, 11, 8713125070);
INSERT INTO usuario_telefone VALUES (807, 85, 411003350);
INSERT INTO usuario_telefone VALUES (807, 90, 5964745723);
INSERT INTO usuario_telefone VALUES (808, 86, 966450306);
INSERT INTO usuario_telefone VALUES (809, 56, 8370422900);
INSERT INTO usuario_telefone VALUES (809, 86, 2526866708);
INSERT INTO usuario_telefone VALUES (811, 86, 692622517);
INSERT INTO usuario_telefone VALUES (811, 56, 900700209);
INSERT INTO usuario_telefone VALUES (812, 81, 9941006883);
INSERT INTO usuario_telefone VALUES (812, 85, 7492038438);
INSERT INTO usuario_telefone VALUES (812, 86, 8635822922);
INSERT INTO usuario_telefone VALUES (813, 56, 5083675453);
INSERT INTO usuario_telefone VALUES (813, 11, 6738945893);
INSERT INTO usuario_telefone VALUES (814, 81, 8218852058);
INSERT INTO usuario_telefone VALUES (814, 56, 375309235);
INSERT INTO usuario_telefone VALUES (815, 90, 6506048982);
INSERT INTO usuario_telefone VALUES (816, 11, 6521002948);
INSERT INTO usuario_telefone VALUES (816, 90, 5577455635);
INSERT INTO usuario_telefone VALUES (819, 11, 7652965861);
INSERT INTO usuario_telefone VALUES (819, 90, 286353821);
INSERT INTO usuario_telefone VALUES (821, 91, 2531573428);
INSERT INTO usuario_telefone VALUES (821, 11, 6012153627);
INSERT INTO usuario_telefone VALUES (821, 91, 1479887952);
INSERT INTO usuario_telefone VALUES (822, 56, 8367711618);
INSERT INTO usuario_telefone VALUES (824, 91, 7540141839);
INSERT INTO usuario_telefone VALUES (824, 85, 4064882587);
INSERT INTO usuario_telefone VALUES (824, 85, 6458264699);
INSERT INTO usuario_telefone VALUES (825, 91, 688375688);
INSERT INTO usuario_telefone VALUES (826, 56, 909596075);
INSERT INTO usuario_telefone VALUES (826, 56, 3322734006);
INSERT INTO usuario_telefone VALUES (827, 91, 4916928854);
INSERT INTO usuario_telefone VALUES (828, 85, 7217032440);
INSERT INTO usuario_telefone VALUES (828, 90, 5443732930);
INSERT INTO usuario_telefone VALUES (829, 91, 200203636);
INSERT INTO usuario_telefone VALUES (829, 91, 8798437111);
INSERT INTO usuario_telefone VALUES (829, 11, 3027665456);
INSERT INTO usuario_telefone VALUES (830, 86, 582319764);
INSERT INTO usuario_telefone VALUES (830, 91, 1110137743);
INSERT INTO usuario_telefone VALUES (834, 91, 2787646752);
INSERT INTO usuario_telefone VALUES (834, 90, 9020792549);
INSERT INTO usuario_telefone VALUES (836, 11, 2547049790);
INSERT INTO usuario_telefone VALUES (837, 81, 9123100746);
INSERT INTO usuario_telefone VALUES (837, 90, 3248956867);
INSERT INTO usuario_telefone VALUES (837, 86, 9058665101);
INSERT INTO usuario_telefone VALUES (838, 56, 8150087107);
INSERT INTO usuario_telefone VALUES (838, 90, 5997267601);
INSERT INTO usuario_telefone VALUES (839, 90, 3705332415);
INSERT INTO usuario_telefone VALUES (840, 85, 1036157309);
INSERT INTO usuario_telefone VALUES (840, 86, 4559294548);
INSERT INTO usuario_telefone VALUES (841, 91, 1279095070);
INSERT INTO usuario_telefone VALUES (842, 85, 9316985817);
INSERT INTO usuario_telefone VALUES (844, 85, 6543815669);
INSERT INTO usuario_telefone VALUES (844, 90, 8434563806);
INSERT INTO usuario_telefone VALUES (845, 11, 5906203514);
INSERT INTO usuario_telefone VALUES (845, 56, 5246179499);
INSERT INTO usuario_telefone VALUES (846, 85, 2251572950);
INSERT INTO usuario_telefone VALUES (846, 81, 4624934711);
INSERT INTO usuario_telefone VALUES (847, 91, 8301891412);
INSERT INTO usuario_telefone VALUES (847, 90, 9844300043);
INSERT INTO usuario_telefone VALUES (848, 90, 745533662);
INSERT INTO usuario_telefone VALUES (848, 81, 8266478658);
INSERT INTO usuario_telefone VALUES (849, 85, 7695348517);
INSERT INTO usuario_telefone VALUES (851, 91, 5184995575);
INSERT INTO usuario_telefone VALUES (851, 86, 4700818369);
INSERT INTO usuario_telefone VALUES (853, 86, 7423960382);
INSERT INTO usuario_telefone VALUES (853, 90, 1010957062);
INSERT INTO usuario_telefone VALUES (853, 86, 7547482090);
INSERT INTO usuario_telefone VALUES (854, 81, 2783638159);
INSERT INTO usuario_telefone VALUES (855, 85, 3353282994);
INSERT INTO usuario_telefone VALUES (855, 56, 950871790);
INSERT INTO usuario_telefone VALUES (856, 85, 5550597262);
INSERT INTO usuario_telefone VALUES (856, 81, 5439495485);
INSERT INTO usuario_telefone VALUES (856, 85, 9827813413);
INSERT INTO usuario_telefone VALUES (857, 85, 5138234203);
INSERT INTO usuario_telefone VALUES (857, 56, 9277896321);
INSERT INTO usuario_telefone VALUES (858, 85, 5630548295);
INSERT INTO usuario_telefone VALUES (858, 56, 1421307606);
INSERT INTO usuario_telefone VALUES (859, 56, 9879053429);
INSERT INTO usuario_telefone VALUES (859, 11, 1539678880);
INSERT INTO usuario_telefone VALUES (859, 81, 8107387984);
INSERT INTO usuario_telefone VALUES (861, 11, 6798703864);
INSERT INTO usuario_telefone VALUES (861, 11, 5369071279);
INSERT INTO usuario_telefone VALUES (861, 85, 102587057);
INSERT INTO usuario_telefone VALUES (862, 86, 3213312504);
INSERT INTO usuario_telefone VALUES (862, 90, 9875639913);
INSERT INTO usuario_telefone VALUES (863, 91, 1739954824);
INSERT INTO usuario_telefone VALUES (864, 91, 3646088285);
INSERT INTO usuario_telefone VALUES (865, 85, 6908566916);
INSERT INTO usuario_telefone VALUES (867, 11, 8476512032);
INSERT INTO usuario_telefone VALUES (867, 91, 8431607501);
INSERT INTO usuario_telefone VALUES (868, 85, 531590253);
INSERT INTO usuario_telefone VALUES (869, 85, 1331348568);
INSERT INTO usuario_telefone VALUES (869, 56, 9415361186);
INSERT INTO usuario_telefone VALUES (870, 85, 1755965729);
INSERT INTO usuario_telefone VALUES (870, 91, 9528507485);
INSERT INTO usuario_telefone VALUES (870, 85, 63669557);
INSERT INTO usuario_telefone VALUES (871, 90, 8228890022);
INSERT INTO usuario_telefone VALUES (871, 11, 3067995417);
INSERT INTO usuario_telefone VALUES (871, 11, 8061077486);
INSERT INTO usuario_telefone VALUES (872, 91, 2501346801);
INSERT INTO usuario_telefone VALUES (872, 91, 1972692230);
INSERT INTO usuario_telefone VALUES (872, 85, 2847045288);
INSERT INTO usuario_telefone VALUES (873, 81, 9841499057);
INSERT INTO usuario_telefone VALUES (873, 85, 8077672117);
INSERT INTO usuario_telefone VALUES (874, 90, 3491540300);
INSERT INTO usuario_telefone VALUES (877, 86, 343110661);
INSERT INTO usuario_telefone VALUES (879, 85, 7327483292);
INSERT INTO usuario_telefone VALUES (879, 56, 6835583148);
INSERT INTO usuario_telefone VALUES (880, 86, 2869358895);
INSERT INTO usuario_telefone VALUES (880, 11, 6428155457);
INSERT INTO usuario_telefone VALUES (881, 85, 3763799044);
INSERT INTO usuario_telefone VALUES (881, 11, 7233011102);
INSERT INTO usuario_telefone VALUES (882, 90, 5179113116);
INSERT INTO usuario_telefone VALUES (882, 91, 2954205465);
INSERT INTO usuario_telefone VALUES (883, 81, 4712735319);
INSERT INTO usuario_telefone VALUES (884, 11, 1356051254);
INSERT INTO usuario_telefone VALUES (884, 85, 157289425);
INSERT INTO usuario_telefone VALUES (884, 85, 394556007);
INSERT INTO usuario_telefone VALUES (886, 11, 4724985135);
INSERT INTO usuario_telefone VALUES (886, 90, 8664193677);
INSERT INTO usuario_telefone VALUES (886, 85, 476402999);
INSERT INTO usuario_telefone VALUES (888, 86, 5500468080);
INSERT INTO usuario_telefone VALUES (888, 91, 215636747);
INSERT INTO usuario_telefone VALUES (889, 90, 1755911924);
INSERT INTO usuario_telefone VALUES (891, 90, 1161956294);
INSERT INTO usuario_telefone VALUES (892, 90, 4393089209);
INSERT INTO usuario_telefone VALUES (892, 11, 3549035767);
INSERT INTO usuario_telefone VALUES (892, 11, 7659775762);
INSERT INTO usuario_telefone VALUES (894, 81, 742099884);
INSERT INTO usuario_telefone VALUES (894, 86, 2462557391);
INSERT INTO usuario_telefone VALUES (895, 85, 3846345073);
INSERT INTO usuario_telefone VALUES (895, 85, 3059661109);
INSERT INTO usuario_telefone VALUES (897, 90, 722820958);
INSERT INTO usuario_telefone VALUES (897, 56, 3231384079);
INSERT INTO usuario_telefone VALUES (897, 81, 8133715963);
INSERT INTO usuario_telefone VALUES (902, 91, 1099224320);
INSERT INTO usuario_telefone VALUES (902, 56, 4177322801);
INSERT INTO usuario_telefone VALUES (902, 85, 1873502843);
INSERT INTO usuario_telefone VALUES (903, 91, 9367184908);
INSERT INTO usuario_telefone VALUES (903, 85, 6287471220);
INSERT INTO usuario_telefone VALUES (903, 91, 4846989172);
INSERT INTO usuario_telefone VALUES (904, 91, 8557333552);
INSERT INTO usuario_telefone VALUES (904, 81, 4957525);
INSERT INTO usuario_telefone VALUES (905, 85, 4349152383);
INSERT INTO usuario_telefone VALUES (906, 11, 6135089489);
INSERT INTO usuario_telefone VALUES (906, 86, 6644796051);
INSERT INTO usuario_telefone VALUES (907, 81, 8926052239);
INSERT INTO usuario_telefone VALUES (907, 85, 3453733977);
INSERT INTO usuario_telefone VALUES (909, 81, 1453440889);
INSERT INTO usuario_telefone VALUES (909, 91, 3480995687);
INSERT INTO usuario_telefone VALUES (909, 85, 1878396552);
INSERT INTO usuario_telefone VALUES (910, 90, 7085036806);
INSERT INTO usuario_telefone VALUES (910, 56, 8630821383);
INSERT INTO usuario_telefone VALUES (910, 85, 7312204420);
INSERT INTO usuario_telefone VALUES (911, 85, 9425924566);
INSERT INTO usuario_telefone VALUES (911, 86, 5900961883);
INSERT INTO usuario_telefone VALUES (911, 85, 4991736359);
INSERT INTO usuario_telefone VALUES (912, 81, 5311250801);
INSERT INTO usuario_telefone VALUES (912, 56, 2431991751);
INSERT INTO usuario_telefone VALUES (912, 91, 4532335619);
INSERT INTO usuario_telefone VALUES (913, 90, 2063394934);
INSERT INTO usuario_telefone VALUES (913, 91, 6985495045);
INSERT INTO usuario_telefone VALUES (913, 85, 8303620175);
INSERT INTO usuario_telefone VALUES (915, 85, 4840592052);
INSERT INTO usuario_telefone VALUES (915, 81, 7920341922);
INSERT INTO usuario_telefone VALUES (916, 85, 1604001423);
INSERT INTO usuario_telefone VALUES (916, 56, 6818142694);
INSERT INTO usuario_telefone VALUES (916, 85, 7287516822);
INSERT INTO usuario_telefone VALUES (917, 85, 4360850749);
INSERT INTO usuario_telefone VALUES (918, 90, 6198432286);
INSERT INTO usuario_telefone VALUES (919, 85, 9533350955);
INSERT INTO usuario_telefone VALUES (920, 81, 4145003442);
INSERT INTO usuario_telefone VALUES (920, 85, 2772274967);
INSERT INTO usuario_telefone VALUES (920, 91, 4943631153);
INSERT INTO usuario_telefone VALUES (921, 81, 8729739856);
INSERT INTO usuario_telefone VALUES (921, 91, 2239673294);
INSERT INTO usuario_telefone VALUES (922, 81, 4346122049);
INSERT INTO usuario_telefone VALUES (922, 90, 1779341273);
INSERT INTO usuario_telefone VALUES (923, 90, 9931155297);
INSERT INTO usuario_telefone VALUES (923, 85, 5542124871);
INSERT INTO usuario_telefone VALUES (925, 11, 6401605955);
INSERT INTO usuario_telefone VALUES (925, 90, 6887924295);
INSERT INTO usuario_telefone VALUES (926, 56, 8143001847);
INSERT INTO usuario_telefone VALUES (926, 90, 8746113835);
INSERT INTO usuario_telefone VALUES (928, 90, 1936008680);
INSERT INTO usuario_telefone VALUES (928, 11, 5479119184);
INSERT INTO usuario_telefone VALUES (929, 11, 915210505);
INSERT INTO usuario_telefone VALUES (929, 81, 7699607998);
INSERT INTO usuario_telefone VALUES (929, 85, 3740690848);
INSERT INTO usuario_telefone VALUES (930, 85, 4008087184);
INSERT INTO usuario_telefone VALUES (931, 91, 9277411799);
INSERT INTO usuario_telefone VALUES (931, 90, 1806601177);
INSERT INTO usuario_telefone VALUES (932, 91, 2000747156);
INSERT INTO usuario_telefone VALUES (933, 86, 5522711841);
INSERT INTO usuario_telefone VALUES (937, 91, 5340727845);
INSERT INTO usuario_telefone VALUES (937, 81, 2526511370);
INSERT INTO usuario_telefone VALUES (938, 85, 3046659094);
INSERT INTO usuario_telefone VALUES (938, 81, 9248817121);
INSERT INTO usuario_telefone VALUES (938, 11, 9605356760);
INSERT INTO usuario_telefone VALUES (939, 56, 1819473581);
INSERT INTO usuario_telefone VALUES (940, 81, 3354851217);
INSERT INTO usuario_telefone VALUES (940, 91, 4913782381);
INSERT INTO usuario_telefone VALUES (941, 56, 9845934766);
INSERT INTO usuario_telefone VALUES (941, 86, 6181822972);
INSERT INTO usuario_telefone VALUES (941, 85, 5145811852);
INSERT INTO usuario_telefone VALUES (943, 81, 6918345613);
INSERT INTO usuario_telefone VALUES (944, 11, 2096309624);
INSERT INTO usuario_telefone VALUES (944, 56, 7716600644);
INSERT INTO usuario_telefone VALUES (944, 81, 8055700779);
INSERT INTO usuario_telefone VALUES (945, 91, 1383392967);
INSERT INTO usuario_telefone VALUES (945, 90, 1959835889);
INSERT INTO usuario_telefone VALUES (946, 90, 3373463900);
INSERT INTO usuario_telefone VALUES (946, 81, 9622272160);
INSERT INTO usuario_telefone VALUES (947, 11, 962924903);
INSERT INTO usuario_telefone VALUES (947, 90, 9671678758);
INSERT INTO usuario_telefone VALUES (948, 85, 3488947901);
INSERT INTO usuario_telefone VALUES (948, 91, 6356324976);
INSERT INTO usuario_telefone VALUES (949, 91, 2444471834);
INSERT INTO usuario_telefone VALUES (952, 81, 3091862273);
INSERT INTO usuario_telefone VALUES (953, 85, 9096417908);
INSERT INTO usuario_telefone VALUES (953, 90, 3917461694);
INSERT INTO usuario_telefone VALUES (953, 90, 5284407379);
INSERT INTO usuario_telefone VALUES (954, 11, 1196843078);
INSERT INTO usuario_telefone VALUES (954, 91, 643200843);
INSERT INTO usuario_telefone VALUES (954, 56, 7935211499);
INSERT INTO usuario_telefone VALUES (955, 90, 9974361362);
INSERT INTO usuario_telefone VALUES (956, 56, 7563031161);
INSERT INTO usuario_telefone VALUES (956, 85, 4188205093);
INSERT INTO usuario_telefone VALUES (956, 91, 7104351028);
INSERT INTO usuario_telefone VALUES (957, 85, 9929281020);
INSERT INTO usuario_telefone VALUES (957, 86, 1065799276);
INSERT INTO usuario_telefone VALUES (957, 86, 5666815170);
INSERT INTO usuario_telefone VALUES (958, 85, 625292996);
INSERT INTO usuario_telefone VALUES (958, 85, 8176003454);
INSERT INTO usuario_telefone VALUES (960, 56, 9746417585);
INSERT INTO usuario_telefone VALUES (961, 81, 7513757296);
INSERT INTO usuario_telefone VALUES (961, 81, 5047835395);
INSERT INTO usuario_telefone VALUES (961, 90, 9176643015);
INSERT INTO usuario_telefone VALUES (962, 56, 9181996314);
INSERT INTO usuario_telefone VALUES (962, 81, 329552953);
INSERT INTO usuario_telefone VALUES (963, 56, 8285729895);
INSERT INTO usuario_telefone VALUES (963, 85, 4133004152);
INSERT INTO usuario_telefone VALUES (965, 91, 1658041841);
INSERT INTO usuario_telefone VALUES (965, 11, 1699424267);
INSERT INTO usuario_telefone VALUES (965, 11, 4407316521);
INSERT INTO usuario_telefone VALUES (967, 85, 5267200771);
INSERT INTO usuario_telefone VALUES (968, 81, 8352199490);
INSERT INTO usuario_telefone VALUES (968, 86, 1656104054);
INSERT INTO usuario_telefone VALUES (969, 90, 5241983355);
INSERT INTO usuario_telefone VALUES (970, 81, 7585992894);
INSERT INTO usuario_telefone VALUES (971, 81, 4905921918);
INSERT INTO usuario_telefone VALUES (972, 11, 4126484419);
INSERT INTO usuario_telefone VALUES (972, 85, 5526548084);
INSERT INTO usuario_telefone VALUES (973, 91, 8482798899);
INSERT INTO usuario_telefone VALUES (973, 81, 6942190695);
INSERT INTO usuario_telefone VALUES (974, 11, 4939577732);
INSERT INTO usuario_telefone VALUES (975, 91, 314051207);
INSERT INTO usuario_telefone VALUES (975, 81, 3615702752);
INSERT INTO usuario_telefone VALUES (977, 81, 3545970929);
INSERT INTO usuario_telefone VALUES (977, 85, 3280267639);
INSERT INTO usuario_telefone VALUES (977, 11, 5696301499);
INSERT INTO usuario_telefone VALUES (978, 86, 6528123795);
INSERT INTO usuario_telefone VALUES (980, 90, 3590044846);
INSERT INTO usuario_telefone VALUES (980, 81, 6026742819);
INSERT INTO usuario_telefone VALUES (980, 91, 3296568234);
INSERT INTO usuario_telefone VALUES (981, 85, 5335452408);
INSERT INTO usuario_telefone VALUES (981, 86, 9911835074);
INSERT INTO usuario_telefone VALUES (982, 56, 4985574993);
INSERT INTO usuario_telefone VALUES (982, 86, 4805637971);
INSERT INTO usuario_telefone VALUES (982, 86, 1915092959);
INSERT INTO usuario_telefone VALUES (983, 91, 5478885059);
INSERT INTO usuario_telefone VALUES (983, 56, 432574576);
INSERT INTO usuario_telefone VALUES (983, 85, 2597243792);
INSERT INTO usuario_telefone VALUES (984, 91, 1764222924);
INSERT INTO usuario_telefone VALUES (984, 91, 88678706);
INSERT INTO usuario_telefone VALUES (985, 81, 2942866991);
INSERT INTO usuario_telefone VALUES (985, 56, 9458086421);
INSERT INTO usuario_telefone VALUES (985, 11, 262866600);
INSERT INTO usuario_telefone VALUES (987, 86, 9141360057);
INSERT INTO usuario_telefone VALUES (987, 85, 4383675194);
INSERT INTO usuario_telefone VALUES (987, 56, 2317018462);
INSERT INTO usuario_telefone VALUES (988, 81, 9088086318);
INSERT INTO usuario_telefone VALUES (988, 91, 4653786419);
INSERT INTO usuario_telefone VALUES (988, 91, 7453005030);
INSERT INTO usuario_telefone VALUES (989, 56, 6859490958);
INSERT INTO usuario_telefone VALUES (989, 91, 5764525833);
INSERT INTO usuario_telefone VALUES (989, 86, 9388651436);
INSERT INTO usuario_telefone VALUES (990, 86, 7092926873);
INSERT INTO usuario_telefone VALUES (992, 86, 9461951592);
INSERT INTO usuario_telefone VALUES (993, 90, 2968364191);
INSERT INTO usuario_telefone VALUES (993, 90, 9167407156);
INSERT INTO usuario_telefone VALUES (993, 85, 8514550203);
INSERT INTO usuario_telefone VALUES (995, 81, 4043999813);
INSERT INTO usuario_telefone VALUES (995, 91, 3381922678);
INSERT INTO usuario_telefone VALUES (996, 85, 5888388345);
INSERT INTO usuario_telefone VALUES (998, 90, 6541430632);
INSERT INTO usuario_telefone VALUES (998, 90, 7643626825);
INSERT INTO usuario_telefone VALUES (999, 11, 979630984);
INSERT INTO usuario_telefone VALUES (999, 90, 9599790875);
INSERT INTO usuario_telefone VALUES (999, 86, 143539904);
INSERT INTO usuario_telefone VALUES (1000, 11, 415217092);
INSERT INTO usuario_telefone VALUES (1000, 85, 4280909108);
INSERT INTO usuario_telefone VALUES (1000, 85, 5799319685);


--
-- TOC entry 2207 (class 0 OID 16720)
-- Dependencies: 194
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO venda VALUES (1, '2016-10-31 19:50:55.682949', 153, 257, 2);
INSERT INTO venda VALUES (2, '2016-10-31 19:50:55.682949', 495, 247, 2);
INSERT INTO venda VALUES (3, '2016-10-31 19:50:55.682949', 760, 699, 2);
INSERT INTO venda VALUES (4, '2016-10-31 19:50:55.682949', 456, 473, 1);
INSERT INTO venda VALUES (5, '2016-10-31 19:50:55.682949', 831, 376, 1);
INSERT INTO venda VALUES (6, '2016-10-31 19:50:55.682949', 954, 874, 3);
INSERT INTO venda VALUES (7, '2016-10-31 19:50:55.682949', 957, 563, 1);
INSERT INTO venda VALUES (8, '2016-10-31 19:50:55.682949', 759, 733, 3);
INSERT INTO venda VALUES (9, '2016-10-31 19:50:55.682949', 905, 661, 3);
INSERT INTO venda VALUES (10, '2016-10-31 19:50:55.682949', 226, 248, 2);
INSERT INTO venda VALUES (11, '2016-10-31 19:50:55.682949', 448, 300, 2);
INSERT INTO venda VALUES (12, '2016-10-31 19:50:55.682949', 591, 312, 3);
INSERT INTO venda VALUES (13, '2016-10-31 19:50:55.682949', 5, 881, 3);
INSERT INTO venda VALUES (14, '2016-10-31 19:50:55.682949', 279, 897, 3);
INSERT INTO venda VALUES (15, '2016-10-31 19:50:55.682949', 999, 248, 2);
INSERT INTO venda VALUES (16, '2016-10-31 19:50:55.682949', 34, 995, 1);
INSERT INTO venda VALUES (17, '2016-10-31 19:50:55.682949', 131, 502, 2);
INSERT INTO venda VALUES (18, '2016-10-31 19:50:55.682949', 81, 205, 3);
INSERT INTO venda VALUES (19, '2016-10-31 19:50:55.682949', 552, 476, 3);
INSERT INTO venda VALUES (20, '2016-10-31 19:50:55.682949', 560, 55, 1);
INSERT INTO venda VALUES (21, '2016-10-31 19:50:55.682949', 138, 407, 1);
INSERT INTO venda VALUES (22, '2016-10-31 19:50:55.682949', 194, 691, 1);
INSERT INTO venda VALUES (23, '2016-10-31 19:50:55.682949', 231, 79, 3);
INSERT INTO venda VALUES (24, '2016-10-31 19:50:55.682949', 422, 800, 2);
INSERT INTO venda VALUES (25, '2016-10-31 19:50:55.682949', 710, 527, 3);
INSERT INTO venda VALUES (26, '2016-10-31 19:50:55.682949', 274, 540, 2);
INSERT INTO venda VALUES (27, '2016-10-31 19:50:55.682949', 452, 727, 1);
INSERT INTO venda VALUES (28, '2016-10-31 19:50:55.682949', 323, 232, 2);
INSERT INTO venda VALUES (29, '2016-10-31 19:50:55.682949', 245, 469, 2);
INSERT INTO venda VALUES (30, '2016-10-31 19:50:55.682949', 732, 69, 1);
INSERT INTO venda VALUES (31, '2016-10-31 19:50:55.682949', 41, 887, 3);
INSERT INTO venda VALUES (32, '2016-10-31 19:50:55.682949', 553, 910, 3);
INSERT INTO venda VALUES (33, '2016-10-31 19:50:55.682949', 187, 581, 1);
INSERT INTO venda VALUES (34, '2016-10-31 19:50:55.682949', 550, 786, 2);
INSERT INTO venda VALUES (35, '2016-10-31 19:50:55.682949', 993, 677, 3);
INSERT INTO venda VALUES (36, '2016-10-31 19:50:55.682949', 507, 69, 1);
INSERT INTO venda VALUES (37, '2016-10-31 19:50:55.682949', 55, 622, 1);
INSERT INTO venda VALUES (38, '2016-10-31 19:50:55.682949', 71, 293, 1);
INSERT INTO venda VALUES (39, '2016-10-31 19:50:55.682949', 253, 519, 1);
INSERT INTO venda VALUES (40, '2016-10-31 19:50:55.682949', 49, 232, 2);
INSERT INTO venda VALUES (41, '2016-10-31 19:50:55.682949', 917, 693, 2);
INSERT INTO venda VALUES (42, '2016-10-31 19:50:55.682949', 80, 760, 1);
INSERT INTO venda VALUES (43, '2016-10-31 19:50:55.682949', 538, 512, 3);
INSERT INTO venda VALUES (44, '2016-10-31 19:50:55.682949', 157, 959, 2);
INSERT INTO venda VALUES (45, '2016-10-31 19:50:55.682949', 627, 159, 3);
INSERT INTO venda VALUES (46, '2016-10-31 19:50:55.682949', 954, 3, 2);
INSERT INTO venda VALUES (47, '2016-10-31 19:50:55.682949', 968, 613, 1);
INSERT INTO venda VALUES (48, '2016-10-31 19:50:55.682949', 767, 527, 3);
INSERT INTO venda VALUES (49, '2016-10-31 19:50:55.682949', 377, 286, 3);
INSERT INTO venda VALUES (50, '2016-10-31 19:50:55.682949', 118, 383, 3);
INSERT INTO venda VALUES (51, '2016-10-31 19:50:55.682949', 229, 519, 1);
INSERT INTO venda VALUES (52, '2016-10-31 19:50:55.682949', 926, 624, 3);
INSERT INTO venda VALUES (53, '2016-10-31 19:50:55.682949', 341, 149, 2);
INSERT INTO venda VALUES (54, '2016-10-31 19:50:55.682949', 328, 870, 3);
INSERT INTO venda VALUES (55, '2016-10-31 19:50:55.682949', 783, 679, 2);
INSERT INTO venda VALUES (56, '2016-10-31 19:53:12.686916', 849, 82, 2);
INSERT INTO venda VALUES (57, '2016-10-31 19:53:12.686916', 343, 771, 3);
INSERT INTO venda VALUES (58, '2016-10-31 19:53:12.686916', 900, 590, 1);
INSERT INTO venda VALUES (59, '2016-10-31 19:53:12.686916', 939, 550, 3);
INSERT INTO venda VALUES (60, '2016-10-31 19:53:12.686916', 640, 870, 2);
INSERT INTO venda VALUES (61, '2016-10-31 19:53:12.686916', 451, 929, 2);
INSERT INTO venda VALUES (62, '2016-10-31 19:53:12.686916', 632, 389, 2);
INSERT INTO venda VALUES (63, '2016-10-31 19:53:12.686916', 765, 246, 3);
INSERT INTO venda VALUES (64, '2016-10-31 19:53:12.686916', 657, 395, 3);
INSERT INTO venda VALUES (65, '2016-10-31 19:53:12.686916', 150, 401, 2);
INSERT INTO venda VALUES (66, '2016-10-31 19:53:12.686916', 89, 631, 2);
INSERT INTO venda VALUES (67, '2016-10-31 19:53:12.686916', 669, 77, 2);
INSERT INTO venda VALUES (68, '2016-10-31 19:53:12.686916', 369, 380, 3);
INSERT INTO venda VALUES (69, '2016-10-31 19:53:12.686916', 603, 941, 1);
INSERT INTO venda VALUES (70, '2016-10-31 19:53:12.686916', 984, 141, 2);
INSERT INTO venda VALUES (71, '2016-10-31 19:53:12.686916', 602, 458, 3);
INSERT INTO venda VALUES (72, '2016-10-31 19:53:12.686916', 988, 141, 2);
INSERT INTO venda VALUES (73, '2016-10-31 19:53:12.686916', 707, 708, 1);
INSERT INTO venda VALUES (74, '2016-10-31 19:53:12.686916', 903, 73, 2);
INSERT INTO venda VALUES (75, '2016-10-31 19:53:12.686916', 776, 226, 1);
INSERT INTO venda VALUES (76, '2016-10-31 19:53:12.686916', 840, 141, 1);
INSERT INTO venda VALUES (77, '2016-10-31 19:53:12.686916', 312, 526, 3);
INSERT INTO venda VALUES (78, '2016-10-31 19:53:12.686916', 382, 522, 1);
INSERT INTO venda VALUES (79, '2016-10-31 19:53:12.686916', 406, 208, 2);
INSERT INTO venda VALUES (80, '2016-10-31 19:53:12.686916', 198, 995, 1);
INSERT INTO venda VALUES (81, '2016-10-31 19:53:12.686916', 740, 703, 2);
INSERT INTO venda VALUES (82, '2016-10-31 19:53:12.686916', 141, 260, 1);
INSERT INTO venda VALUES (83, '2016-10-31 19:53:12.686916', 180, 788, 2);
INSERT INTO venda VALUES (84, '2016-10-31 19:53:12.686916', 821, 232, 3);
INSERT INTO venda VALUES (85, '2016-10-31 19:53:12.686916', 40, 583, 3);
INSERT INTO venda VALUES (86, '2016-10-31 19:53:12.686916', 706, 244, 1);
INSERT INTO venda VALUES (87, '2016-10-31 19:53:12.686916', 327, 389, 1);
INSERT INTO venda VALUES (88, '2016-10-31 19:53:12.686916', 28, 613, 3);
INSERT INTO venda VALUES (89, '2016-10-31 19:53:12.686916', 432, 291, 3);
INSERT INTO venda VALUES (90, '2016-10-31 19:53:12.686916', 73, 534, 3);
INSERT INTO venda VALUES (91, '2016-10-31 19:53:12.686916', 573, 75, 2);
INSERT INTO venda VALUES (92, '2016-10-31 19:53:12.686916', 222, 427, 2);
INSERT INTO venda VALUES (93, '2016-10-31 19:53:12.686916', 209, 887, 3);
INSERT INTO venda VALUES (94, '2016-10-31 19:53:12.686916', 419, 492, 2);
INSERT INTO venda VALUES (95, '2016-10-31 19:53:12.686916', 179, 570, 1);
INSERT INTO venda VALUES (96, '2016-10-31 19:53:12.686916', 306, 205, 3);
INSERT INTO venda VALUES (97, '2016-10-31 19:53:12.686916', 108, 745, 1);
INSERT INTO venda VALUES (98, '2016-10-31 19:53:12.686916', 108, 269, 3);
INSERT INTO venda VALUES (99, '2016-10-31 19:53:12.686916', 131, 827, 1);
INSERT INTO venda VALUES (100, '2016-10-31 19:53:12.686916', 222, 204, 2);
INSERT INTO venda VALUES (101, '2016-10-31 19:53:12.686916', 345, 20, 3);
INSERT INTO venda VALUES (102, '2016-10-31 19:53:12.686916', 522, 358, 3);
INSERT INTO venda VALUES (103, '2016-10-31 19:53:12.686916', 222, 587, 2);
INSERT INTO venda VALUES (104, '2016-10-31 19:53:12.686916', 500, 34, 1);
INSERT INTO venda VALUES (105, '2016-10-31 19:53:12.686916', 949, 141, 3);
INSERT INTO venda VALUES (106, '2016-10-31 19:53:12.686916', 778, 83, 2);
INSERT INTO venda VALUES (107, '2016-10-31 19:53:12.686916', 953, 389, 2);
INSERT INTO venda VALUES (108, '2016-10-31 19:53:12.686916', 226, 490, 2);
INSERT INTO venda VALUES (109, '2016-10-31 19:53:12.686916', 315, 141, 2);
INSERT INTO venda VALUES (110, '2016-10-31 19:53:12.686916', 222, 324, 1);


--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 195
-- Name: venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venda_id_seq', 110, true);


--
-- TOC entry 2209 (class 0 OID 16725)
-- Dependencies: 196
-- Data for Name: venda_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO venda_item VALUES (1, 13, 9);
INSERT INTO venda_item VALUES (1, 31, 10);
INSERT INTO venda_item VALUES (1, 14, 4);
INSERT INTO venda_item VALUES (1, 21, 3);
INSERT INTO venda_item VALUES (1, 23, 1);
INSERT INTO venda_item VALUES (1, 25, 7);
INSERT INTO venda_item VALUES (1, 7, 2);
INSERT INTO venda_item VALUES (1, 4, 3);
INSERT INTO venda_item VALUES (1, 32, 7);
INSERT INTO venda_item VALUES (1, 35, 2);
INSERT INTO venda_item VALUES (1, 20, 3);
INSERT INTO venda_item VALUES (2, 21, 1);
INSERT INTO venda_item VALUES (2, 17, 3);
INSERT INTO venda_item VALUES (2, 31, 10);
INSERT INTO venda_item VALUES (2, 16, 6);
INSERT INTO venda_item VALUES (2, 27, 3);
INSERT INTO venda_item VALUES (3, 8, 1);
INSERT INTO venda_item VALUES (3, 7, 7);
INSERT INTO venda_item VALUES (3, 2, 9);
INSERT INTO venda_item VALUES (3, 33, 3);
INSERT INTO venda_item VALUES (4, 6, 5);
INSERT INTO venda_item VALUES (4, 18, 1);
INSERT INTO venda_item VALUES (4, 25, 10);
INSERT INTO venda_item VALUES (4, 14, 10);
INSERT INTO venda_item VALUES (5, 15, 3);
INSERT INTO venda_item VALUES (5, 37, 5);
INSERT INTO venda_item VALUES (5, 18, 9);
INSERT INTO venda_item VALUES (6, 18, 2);
INSERT INTO venda_item VALUES (6, 24, 1);
INSERT INTO venda_item VALUES (6, 35, 10);
INSERT INTO venda_item VALUES (6, 25, 7);
INSERT INTO venda_item VALUES (6, 32, 4);
INSERT INTO venda_item VALUES (6, 23, 7);
INSERT INTO venda_item VALUES (6, 2, 1);
INSERT INTO venda_item VALUES (6, 1, 8);
INSERT INTO venda_item VALUES (6, 22, 10);
INSERT INTO venda_item VALUES (6, 34, 9);
INSERT INTO venda_item VALUES (6, 13, 1);
INSERT INTO venda_item VALUES (6, 11, 9);
INSERT INTO venda_item VALUES (6, 16, 1);
INSERT INTO venda_item VALUES (7, 6, 1);
INSERT INTO venda_item VALUES (7, 30, 10);
INSERT INTO venda_item VALUES (7, 31, 6);
INSERT INTO venda_item VALUES (7, 33, 4);
INSERT INTO venda_item VALUES (7, 35, 9);
INSERT INTO venda_item VALUES (7, 10, 5);
INSERT INTO venda_item VALUES (7, 23, 3);
INSERT INTO venda_item VALUES (7, 15, 9);
INSERT INTO venda_item VALUES (7, 7, 3);
INSERT INTO venda_item VALUES (7, 27, 4);
INSERT INTO venda_item VALUES (7, 18, 9);
INSERT INTO venda_item VALUES (7, 28, 8);
INSERT INTO venda_item VALUES (7, 24, 6);
INSERT INTO venda_item VALUES (7, 36, 2);
INSERT INTO venda_item VALUES (7, 38, 10);
INSERT INTO venda_item VALUES (8, 14, 10);
INSERT INTO venda_item VALUES (8, 13, 9);
INSERT INTO venda_item VALUES (8, 3, 4);
INSERT INTO venda_item VALUES (8, 7, 9);
INSERT INTO venda_item VALUES (8, 34, 4);
INSERT INTO venda_item VALUES (8, 19, 5);
INSERT INTO venda_item VALUES (9, 21, 8);
INSERT INTO venda_item VALUES (9, 10, 6);
INSERT INTO venda_item VALUES (9, 32, 3);
INSERT INTO venda_item VALUES (9, 20, 1);
INSERT INTO venda_item VALUES (9, 38, 3);
INSERT INTO venda_item VALUES (9, 24, 8);
INSERT INTO venda_item VALUES (9, 17, 10);
INSERT INTO venda_item VALUES (9, 22, 7);
INSERT INTO venda_item VALUES (9, 35, 1);
INSERT INTO venda_item VALUES (9, 31, 10);
INSERT INTO venda_item VALUES (9, 7, 6);
INSERT INTO venda_item VALUES (9, 26, 2);
INSERT INTO venda_item VALUES (9, 29, 5);
INSERT INTO venda_item VALUES (9, 37, 3);
INSERT INTO venda_item VALUES (10, 2, 6);
INSERT INTO venda_item VALUES (10, 14, 8);
INSERT INTO venda_item VALUES (10, 20, 6);
INSERT INTO venda_item VALUES (10, 26, 5);
INSERT INTO venda_item VALUES (10, 12, 10);
INSERT INTO venda_item VALUES (10, 5, 5);
INSERT INTO venda_item VALUES (10, 38, 10);
INSERT INTO venda_item VALUES (10, 34, 5);
INSERT INTO venda_item VALUES (10, 30, 3);
INSERT INTO venda_item VALUES (10, 22, 3);
INSERT INTO venda_item VALUES (11, 35, 10);
INSERT INTO venda_item VALUES (11, 26, 5);
INSERT INTO venda_item VALUES (11, 36, 3);
INSERT INTO venda_item VALUES (11, 16, 9);
INSERT INTO venda_item VALUES (11, 14, 7);
INSERT INTO venda_item VALUES (11, 12, 7);
INSERT INTO venda_item VALUES (11, 13, 8);
INSERT INTO venda_item VALUES (11, 9, 1);
INSERT INTO venda_item VALUES (11, 27, 3);
INSERT INTO venda_item VALUES (12, 37, 9);
INSERT INTO venda_item VALUES (12, 31, 10);
INSERT INTO venda_item VALUES (12, 7, 1);
INSERT INTO venda_item VALUES (12, 11, 8);
INSERT INTO venda_item VALUES (12, 29, 4);
INSERT INTO venda_item VALUES (12, 36, 8);
INSERT INTO venda_item VALUES (12, 13, 1);
INSERT INTO venda_item VALUES (12, 8, 1);
INSERT INTO venda_item VALUES (12, 16, 8);
INSERT INTO venda_item VALUES (12, 35, 7);
INSERT INTO venda_item VALUES (12, 10, 8);
INSERT INTO venda_item VALUES (12, 22, 10);
INSERT INTO venda_item VALUES (13, 34, 9);
INSERT INTO venda_item VALUES (14, 24, 8);
INSERT INTO venda_item VALUES (14, 11, 8);
INSERT INTO venda_item VALUES (14, 27, 1);
INSERT INTO venda_item VALUES (14, 30, 2);
INSERT INTO venda_item VALUES (14, 14, 7);
INSERT INTO venda_item VALUES (14, 10, 3);
INSERT INTO venda_item VALUES (14, 8, 10);
INSERT INTO venda_item VALUES (14, 19, 5);
INSERT INTO venda_item VALUES (14, 23, 5);
INSERT INTO venda_item VALUES (14, 15, 3);
INSERT INTO venda_item VALUES (14, 13, 2);
INSERT INTO venda_item VALUES (14, 25, 1);
INSERT INTO venda_item VALUES (15, 36, 7);
INSERT INTO venda_item VALUES (15, 21, 10);
INSERT INTO venda_item VALUES (15, 38, 6);
INSERT INTO venda_item VALUES (15, 13, 5);
INSERT INTO venda_item VALUES (15, 20, 3);
INSERT INTO venda_item VALUES (15, 17, 9);
INSERT INTO venda_item VALUES (15, 34, 10);
INSERT INTO venda_item VALUES (15, 14, 1);
INSERT INTO venda_item VALUES (15, 28, 7);
INSERT INTO venda_item VALUES (15, 18, 6);
INSERT INTO venda_item VALUES (16, 7, 3);
INSERT INTO venda_item VALUES (16, 31, 10);
INSERT INTO venda_item VALUES (16, 1, 2);
INSERT INTO venda_item VALUES (16, 9, 8);
INSERT INTO venda_item VALUES (16, 13, 9);
INSERT INTO venda_item VALUES (16, 15, 4);
INSERT INTO venda_item VALUES (16, 24, 8);
INSERT INTO venda_item VALUES (16, 14, 7);
INSERT INTO venda_item VALUES (16, 36, 6);
INSERT INTO venda_item VALUES (16, 8, 5);
INSERT INTO venda_item VALUES (16, 37, 8);
INSERT INTO venda_item VALUES (16, 10, 1);
INSERT INTO venda_item VALUES (16, 12, 9);
INSERT INTO venda_item VALUES (17, 28, 1);
INSERT INTO venda_item VALUES (18, 38, 6);
INSERT INTO venda_item VALUES (18, 16, 2);
INSERT INTO venda_item VALUES (18, 21, 6);
INSERT INTO venda_item VALUES (18, 3, 5);
INSERT INTO venda_item VALUES (18, 25, 8);
INSERT INTO venda_item VALUES (18, 1, 2);
INSERT INTO venda_item VALUES (18, 5, 1);
INSERT INTO venda_item VALUES (18, 13, 4);
INSERT INTO venda_item VALUES (18, 17, 6);
INSERT INTO venda_item VALUES (18, 10, 2);
INSERT INTO venda_item VALUES (19, 33, 2);
INSERT INTO venda_item VALUES (19, 4, 6);
INSERT INTO venda_item VALUES (19, 23, 3);
INSERT INTO venda_item VALUES (19, 31, 7);
INSERT INTO venda_item VALUES (19, 36, 3);
INSERT INTO venda_item VALUES (19, 27, 1);
INSERT INTO venda_item VALUES (19, 2, 2);
INSERT INTO venda_item VALUES (19, 21, 2);
INSERT INTO venda_item VALUES (19, 3, 7);
INSERT INTO venda_item VALUES (19, 8, 9);
INSERT INTO venda_item VALUES (19, 19, 6);
INSERT INTO venda_item VALUES (19, 18, 10);
INSERT INTO venda_item VALUES (19, 10, 10);
INSERT INTO venda_item VALUES (19, 11, 4);
INSERT INTO venda_item VALUES (19, 28, 5);
INSERT INTO venda_item VALUES (20, 24, 8);
INSERT INTO venda_item VALUES (20, 20, 3);
INSERT INTO venda_item VALUES (20, 33, 8);
INSERT INTO venda_item VALUES (20, 9, 4);
INSERT INTO venda_item VALUES (20, 31, 8);
INSERT INTO venda_item VALUES (20, 11, 3);
INSERT INTO venda_item VALUES (20, 34, 5);
INSERT INTO venda_item VALUES (20, 29, 9);
INSERT INTO venda_item VALUES (20, 10, 5);
INSERT INTO venda_item VALUES (20, 8, 10);
INSERT INTO venda_item VALUES (20, 36, 7);
INSERT INTO venda_item VALUES (20, 16, 7);
INSERT INTO venda_item VALUES (21, 17, 5);
INSERT INTO venda_item VALUES (21, 34, 8);
INSERT INTO venda_item VALUES (21, 1, 6);
INSERT INTO venda_item VALUES (21, 15, 10);
INSERT INTO venda_item VALUES (21, 11, 6);
INSERT INTO venda_item VALUES (21, 38, 10);
INSERT INTO venda_item VALUES (21, 29, 8);
INSERT INTO venda_item VALUES (21, 4, 9);
INSERT INTO venda_item VALUES (22, 38, 10);
INSERT INTO venda_item VALUES (22, 18, 6);
INSERT INTO venda_item VALUES (22, 3, 7);
INSERT INTO venda_item VALUES (22, 19, 10);
INSERT INTO venda_item VALUES (22, 11, 6);
INSERT INTO venda_item VALUES (22, 16, 6);
INSERT INTO venda_item VALUES (22, 36, 2);
INSERT INTO venda_item VALUES (22, 29, 10);
INSERT INTO venda_item VALUES (22, 4, 5);
INSERT INTO venda_item VALUES (22, 14, 9);
INSERT INTO venda_item VALUES (22, 26, 6);
INSERT INTO venda_item VALUES (22, 31, 2);
INSERT INTO venda_item VALUES (22, 23, 3);
INSERT INTO venda_item VALUES (23, 34, 9);
INSERT INTO venda_item VALUES (23, 36, 7);
INSERT INTO venda_item VALUES (23, 25, 4);
INSERT INTO venda_item VALUES (24, 33, 9);
INSERT INTO venda_item VALUES (25, 7, 10);
INSERT INTO venda_item VALUES (25, 8, 4);
INSERT INTO venda_item VALUES (25, 16, 9);
INSERT INTO venda_item VALUES (26, 33, 2);
INSERT INTO venda_item VALUES (26, 7, 3);
INSERT INTO venda_item VALUES (26, 22, 7);
INSERT INTO venda_item VALUES (26, 3, 3);
INSERT INTO venda_item VALUES (26, 15, 3);
INSERT INTO venda_item VALUES (26, 10, 1);
INSERT INTO venda_item VALUES (26, 9, 5);
INSERT INTO venda_item VALUES (26, 2, 7);
INSERT INTO venda_item VALUES (26, 30, 9);
INSERT INTO venda_item VALUES (27, 28, 1);
INSERT INTO venda_item VALUES (27, 4, 3);
INSERT INTO venda_item VALUES (27, 2, 9);
INSERT INTO venda_item VALUES (27, 9, 2);
INSERT INTO venda_item VALUES (27, 20, 1);
INSERT INTO venda_item VALUES (27, 25, 7);
INSERT INTO venda_item VALUES (27, 32, 8);
INSERT INTO venda_item VALUES (27, 13, 10);
INSERT INTO venda_item VALUES (27, 24, 3);
INSERT INTO venda_item VALUES (27, 5, 7);
INSERT INTO venda_item VALUES (27, 21, 3);
INSERT INTO venda_item VALUES (27, 17, 10);
INSERT INTO venda_item VALUES (28, 8, 6);
INSERT INTO venda_item VALUES (28, 28, 10);
INSERT INTO venda_item VALUES (28, 13, 6);
INSERT INTO venda_item VALUES (28, 3, 7);
INSERT INTO venda_item VALUES (29, 31, 5);
INSERT INTO venda_item VALUES (29, 13, 8);
INSERT INTO venda_item VALUES (29, 20, 3);
INSERT INTO venda_item VALUES (29, 6, 8);
INSERT INTO venda_item VALUES (29, 30, 6);
INSERT INTO venda_item VALUES (29, 5, 9);
INSERT INTO venda_item VALUES (29, 14, 5);
INSERT INTO venda_item VALUES (30, 18, 8);
INSERT INTO venda_item VALUES (30, 12, 1);
INSERT INTO venda_item VALUES (30, 17, 4);
INSERT INTO venda_item VALUES (31, 14, 1);
INSERT INTO venda_item VALUES (31, 30, 5);
INSERT INTO venda_item VALUES (31, 18, 9);
INSERT INTO venda_item VALUES (32, 23, 1);
INSERT INTO venda_item VALUES (32, 18, 7);
INSERT INTO venda_item VALUES (32, 7, 7);
INSERT INTO venda_item VALUES (32, 2, 8);
INSERT INTO venda_item VALUES (32, 19, 10);
INSERT INTO venda_item VALUES (32, 30, 2);
INSERT INTO venda_item VALUES (32, 5, 6);
INSERT INTO venda_item VALUES (33, 33, 9);
INSERT INTO venda_item VALUES (33, 37, 9);
INSERT INTO venda_item VALUES (33, 36, 7);
INSERT INTO venda_item VALUES (33, 31, 8);
INSERT INTO venda_item VALUES (33, 10, 8);
INSERT INTO venda_item VALUES (33, 21, 3);
INSERT INTO venda_item VALUES (33, 5, 10);
INSERT INTO venda_item VALUES (33, 29, 2);
INSERT INTO venda_item VALUES (33, 15, 6);
INSERT INTO venda_item VALUES (33, 19, 3);
INSERT INTO venda_item VALUES (34, 31, 8);
INSERT INTO venda_item VALUES (34, 23, 4);
INSERT INTO venda_item VALUES (34, 17, 9);
INSERT INTO venda_item VALUES (34, 24, 5);
INSERT INTO venda_item VALUES (34, 21, 10);
INSERT INTO venda_item VALUES (34, 13, 4);
INSERT INTO venda_item VALUES (35, 9, 2);
INSERT INTO venda_item VALUES (35, 30, 2);
INSERT INTO venda_item VALUES (35, 36, 2);
INSERT INTO venda_item VALUES (35, 4, 7);
INSERT INTO venda_item VALUES (35, 27, 8);
INSERT INTO venda_item VALUES (35, 18, 10);
INSERT INTO venda_item VALUES (35, 1, 3);
INSERT INTO venda_item VALUES (35, 19, 5);
INSERT INTO venda_item VALUES (35, 6, 1);
INSERT INTO venda_item VALUES (35, 12, 1);
INSERT INTO venda_item VALUES (35, 22, 7);
INSERT INTO venda_item VALUES (35, 11, 1);
INSERT INTO venda_item VALUES (36, 1, 10);
INSERT INTO venda_item VALUES (36, 30, 7);
INSERT INTO venda_item VALUES (36, 35, 10);
INSERT INTO venda_item VALUES (36, 4, 4);
INSERT INTO venda_item VALUES (36, 24, 6);
INSERT INTO venda_item VALUES (36, 28, 10);
INSERT INTO venda_item VALUES (36, 19, 7);
INSERT INTO venda_item VALUES (36, 36, 1);
INSERT INTO venda_item VALUES (36, 33, 8);
INSERT INTO venda_item VALUES (36, 29, 9);
INSERT INTO venda_item VALUES (36, 7, 8);
INSERT INTO venda_item VALUES (37, 31, 1);
INSERT INTO venda_item VALUES (37, 28, 4);
INSERT INTO venda_item VALUES (37, 25, 7);
INSERT INTO venda_item VALUES (37, 36, 1);
INSERT INTO venda_item VALUES (37, 21, 3);
INSERT INTO venda_item VALUES (37, 4, 5);
INSERT INTO venda_item VALUES (37, 11, 4);
INSERT INTO venda_item VALUES (37, 8, 5);
INSERT INTO venda_item VALUES (37, 37, 3);
INSERT INTO venda_item VALUES (38, 23, 10);
INSERT INTO venda_item VALUES (38, 1, 10);
INSERT INTO venda_item VALUES (38, 7, 4);
INSERT INTO venda_item VALUES (38, 6, 7);
INSERT INTO venda_item VALUES (38, 21, 4);
INSERT INTO venda_item VALUES (38, 13, 8);
INSERT INTO venda_item VALUES (38, 29, 7);
INSERT INTO venda_item VALUES (39, 8, 9);
INSERT INTO venda_item VALUES (39, 38, 4);
INSERT INTO venda_item VALUES (39, 31, 8);
INSERT INTO venda_item VALUES (39, 13, 3);
INSERT INTO venda_item VALUES (39, 32, 4);
INSERT INTO venda_item VALUES (39, 35, 1);
INSERT INTO venda_item VALUES (39, 15, 4);
INSERT INTO venda_item VALUES (39, 14, 2);
INSERT INTO venda_item VALUES (39, 37, 5);
INSERT INTO venda_item VALUES (39, 21, 9);
INSERT INTO venda_item VALUES (40, 18, 4);
INSERT INTO venda_item VALUES (40, 17, 8);
INSERT INTO venda_item VALUES (40, 27, 1);
INSERT INTO venda_item VALUES (40, 5, 4);
INSERT INTO venda_item VALUES (40, 34, 8);
INSERT INTO venda_item VALUES (40, 14, 2);
INSERT INTO venda_item VALUES (40, 35, 3);
INSERT INTO venda_item VALUES (40, 29, 4);
INSERT INTO venda_item VALUES (40, 2, 1);
INSERT INTO venda_item VALUES (40, 22, 3);
INSERT INTO venda_item VALUES (40, 3, 2);
INSERT INTO venda_item VALUES (40, 9, 2);
INSERT INTO venda_item VALUES (41, 32, 10);
INSERT INTO venda_item VALUES (41, 7, 2);
INSERT INTO venda_item VALUES (41, 18, 10);
INSERT INTO venda_item VALUES (41, 35, 9);
INSERT INTO venda_item VALUES (41, 17, 1);
INSERT INTO venda_item VALUES (41, 1, 9);
INSERT INTO venda_item VALUES (41, 5, 7);
INSERT INTO venda_item VALUES (41, 15, 10);
INSERT INTO venda_item VALUES (42, 34, 8);
INSERT INTO venda_item VALUES (42, 26, 3);
INSERT INTO venda_item VALUES (42, 29, 10);
INSERT INTO venda_item VALUES (42, 38, 8);
INSERT INTO venda_item VALUES (42, 7, 1);
INSERT INTO venda_item VALUES (42, 20, 9);
INSERT INTO venda_item VALUES (42, 33, 1);
INSERT INTO venda_item VALUES (42, 18, 1);
INSERT INTO venda_item VALUES (42, 37, 10);
INSERT INTO venda_item VALUES (42, 12, 5);
INSERT INTO venda_item VALUES (42, 22, 6);
INSERT INTO venda_item VALUES (42, 1, 8);
INSERT INTO venda_item VALUES (42, 3, 9);
INSERT INTO venda_item VALUES (43, 24, 6);
INSERT INTO venda_item VALUES (43, 37, 8);
INSERT INTO venda_item VALUES (43, 19, 1);
INSERT INTO venda_item VALUES (43, 28, 5);
INSERT INTO venda_item VALUES (44, 4, 10);
INSERT INTO venda_item VALUES (44, 10, 2);
INSERT INTO venda_item VALUES (44, 27, 9);
INSERT INTO venda_item VALUES (44, 2, 9);
INSERT INTO venda_item VALUES (44, 22, 7);
INSERT INTO venda_item VALUES (44, 38, 5);
INSERT INTO venda_item VALUES (44, 14, 5);
INSERT INTO venda_item VALUES (44, 21, 8);
INSERT INTO venda_item VALUES (45, 13, 3);
INSERT INTO venda_item VALUES (45, 7, 5);
INSERT INTO venda_item VALUES (45, 8, 9);
INSERT INTO venda_item VALUES (45, 11, 6);
INSERT INTO venda_item VALUES (45, 23, 1);
INSERT INTO venda_item VALUES (45, 4, 10);
INSERT INTO venda_item VALUES (45, 5, 7);
INSERT INTO venda_item VALUES (45, 2, 2);
INSERT INTO venda_item VALUES (45, 29, 5);
INSERT INTO venda_item VALUES (45, 26, 7);
INSERT INTO venda_item VALUES (45, 28, 6);
INSERT INTO venda_item VALUES (45, 15, 6);
INSERT INTO venda_item VALUES (46, 33, 2);
INSERT INTO venda_item VALUES (46, 29, 1);
INSERT INTO venda_item VALUES (46, 30, 6);
INSERT INTO venda_item VALUES (46, 3, 7);
INSERT INTO venda_item VALUES (46, 20, 5);
INSERT INTO venda_item VALUES (47, 12, 7);
INSERT INTO venda_item VALUES (47, 33, 7);
INSERT INTO venda_item VALUES (47, 7, 7);
INSERT INTO venda_item VALUES (47, 31, 9);
INSERT INTO venda_item VALUES (47, 23, 3);
INSERT INTO venda_item VALUES (48, 25, 10);
INSERT INTO venda_item VALUES (48, 29, 2);
INSERT INTO venda_item VALUES (48, 30, 6);
INSERT INTO venda_item VALUES (48, 19, 9);
INSERT INTO venda_item VALUES (48, 38, 1);
INSERT INTO venda_item VALUES (48, 13, 1);
INSERT INTO venda_item VALUES (48, 5, 4);
INSERT INTO venda_item VALUES (48, 15, 4);
INSERT INTO venda_item VALUES (48, 10, 2);
INSERT INTO venda_item VALUES (48, 31, 3);
INSERT INTO venda_item VALUES (49, 27, 3);
INSERT INTO venda_item VALUES (49, 10, 5);
INSERT INTO venda_item VALUES (49, 9, 9);
INSERT INTO venda_item VALUES (49, 20, 8);
INSERT INTO venda_item VALUES (49, 17, 3);
INSERT INTO venda_item VALUES (49, 25, 5);
INSERT INTO venda_item VALUES (49, 16, 7);
INSERT INTO venda_item VALUES (50, 22, 1);
INSERT INTO venda_item VALUES (50, 27, 9);
INSERT INTO venda_item VALUES (50, 21, 2);
INSERT INTO venda_item VALUES (50, 30, 7);
INSERT INTO venda_item VALUES (50, 36, 6);
INSERT INTO venda_item VALUES (50, 20, 7);
INSERT INTO venda_item VALUES (50, 37, 4);
INSERT INTO venda_item VALUES (50, 29, 5);
INSERT INTO venda_item VALUES (50, 4, 3);
INSERT INTO venda_item VALUES (50, 38, 4);
INSERT INTO venda_item VALUES (50, 17, 5);
INSERT INTO venda_item VALUES (50, 10, 2);
INSERT INTO venda_item VALUES (50, 24, 7);
INSERT INTO venda_item VALUES (51, 33, 7);
INSERT INTO venda_item VALUES (51, 20, 9);
INSERT INTO venda_item VALUES (51, 29, 8);
INSERT INTO venda_item VALUES (51, 17, 8);
INSERT INTO venda_item VALUES (51, 22, 5);
INSERT INTO venda_item VALUES (51, 1, 5);
INSERT INTO venda_item VALUES (51, 18, 5);
INSERT INTO venda_item VALUES (51, 35, 4);
INSERT INTO venda_item VALUES (51, 10, 1);
INSERT INTO venda_item VALUES (51, 19, 5);
INSERT INTO venda_item VALUES (51, 21, 3);
INSERT INTO venda_item VALUES (51, 13, 5);
INSERT INTO venda_item VALUES (51, 6, 4);
INSERT INTO venda_item VALUES (51, 9, 6);
INSERT INTO venda_item VALUES (52, 29, 2);
INSERT INTO venda_item VALUES (52, 34, 4);
INSERT INTO venda_item VALUES (53, 31, 10);
INSERT INTO venda_item VALUES (53, 38, 8);
INSERT INTO venda_item VALUES (53, 34, 6);
INSERT INTO venda_item VALUES (53, 9, 9);
INSERT INTO venda_item VALUES (53, 24, 8);
INSERT INTO venda_item VALUES (53, 4, 5);
INSERT INTO venda_item VALUES (53, 10, 3);
INSERT INTO venda_item VALUES (53, 8, 8);
INSERT INTO venda_item VALUES (53, 25, 9);
INSERT INTO venda_item VALUES (54, 17, 10);
INSERT INTO venda_item VALUES (54, 19, 10);
INSERT INTO venda_item VALUES (54, 38, 4);
INSERT INTO venda_item VALUES (54, 31, 6);
INSERT INTO venda_item VALUES (54, 15, 7);
INSERT INTO venda_item VALUES (54, 11, 4);
INSERT INTO venda_item VALUES (54, 1, 2);
INSERT INTO venda_item VALUES (54, 2, 2);
INSERT INTO venda_item VALUES (54, 6, 2);
INSERT INTO venda_item VALUES (54, 32, 5);
INSERT INTO venda_item VALUES (54, 37, 6);
INSERT INTO venda_item VALUES (55, 15, 4);
INSERT INTO venda_item VALUES (55, 17, 7);
INSERT INTO venda_item VALUES (55, 11, 2);
INSERT INTO venda_item VALUES (55, 18, 3);
INSERT INTO venda_item VALUES (56, 32, 3);
INSERT INTO venda_item VALUES (56, 8, 5);
INSERT INTO venda_item VALUES (56, 29, 4);
INSERT INTO venda_item VALUES (56, 25, 3);
INSERT INTO venda_item VALUES (56, 7, 4);
INSERT INTO venda_item VALUES (56, 38, 2);
INSERT INTO venda_item VALUES (56, 22, 3);
INSERT INTO venda_item VALUES (57, 16, 7);
INSERT INTO venda_item VALUES (57, 23, 4);
INSERT INTO venda_item VALUES (57, 2, 10);
INSERT INTO venda_item VALUES (57, 20, 8);
INSERT INTO venda_item VALUES (57, 7, 8);
INSERT INTO venda_item VALUES (57, 36, 6);
INSERT INTO venda_item VALUES (57, 32, 6);
INSERT INTO venda_item VALUES (57, 35, 6);
INSERT INTO venda_item VALUES (57, 37, 5);
INSERT INTO venda_item VALUES (58, 8, 4);
INSERT INTO venda_item VALUES (58, 24, 5);
INSERT INTO venda_item VALUES (58, 31, 10);
INSERT INTO venda_item VALUES (58, 21, 8);
INSERT INTO venda_item VALUES (59, 37, 10);
INSERT INTO venda_item VALUES (59, 35, 1);
INSERT INTO venda_item VALUES (59, 3, 6);
INSERT INTO venda_item VALUES (59, 25, 9);
INSERT INTO venda_item VALUES (59, 33, 8);
INSERT INTO venda_item VALUES (59, 18, 6);
INSERT INTO venda_item VALUES (59, 36, 6);
INSERT INTO venda_item VALUES (59, 8, 3);
INSERT INTO venda_item VALUES (59, 17, 10);
INSERT INTO venda_item VALUES (59, 32, 8);
INSERT INTO venda_item VALUES (59, 14, 6);
INSERT INTO venda_item VALUES (60, 22, 6);
INSERT INTO venda_item VALUES (60, 17, 5);
INSERT INTO venda_item VALUES (61, 24, 5);
INSERT INTO venda_item VALUES (61, 16, 7);
INSERT INTO venda_item VALUES (61, 10, 7);
INSERT INTO venda_item VALUES (61, 29, 4);
INSERT INTO venda_item VALUES (61, 34, 6);
INSERT INTO venda_item VALUES (61, 18, 9);
INSERT INTO venda_item VALUES (61, 7, 8);
INSERT INTO venda_item VALUES (61, 38, 1);
INSERT INTO venda_item VALUES (61, 1, 3);
INSERT INTO venda_item VALUES (62, 11, 5);
INSERT INTO venda_item VALUES (62, 34, 1);
INSERT INTO venda_item VALUES (62, 24, 8);
INSERT INTO venda_item VALUES (62, 10, 10);
INSERT INTO venda_item VALUES (62, 9, 8);
INSERT INTO venda_item VALUES (62, 33, 5);
INSERT INTO venda_item VALUES (62, 21, 4);
INSERT INTO venda_item VALUES (62, 19, 10);
INSERT INTO venda_item VALUES (62, 36, 4);
INSERT INTO venda_item VALUES (62, 27, 7);
INSERT INTO venda_item VALUES (63, 19, 6);
INSERT INTO venda_item VALUES (63, 32, 10);
INSERT INTO venda_item VALUES (63, 20, 9);
INSERT INTO venda_item VALUES (63, 8, 4);
INSERT INTO venda_item VALUES (63, 24, 3);
INSERT INTO venda_item VALUES (63, 6, 6);
INSERT INTO venda_item VALUES (63, 21, 4);
INSERT INTO venda_item VALUES (64, 28, 9);
INSERT INTO venda_item VALUES (64, 12, 3);
INSERT INTO venda_item VALUES (64, 5, 9);
INSERT INTO venda_item VALUES (64, 16, 1);
INSERT INTO venda_item VALUES (64, 31, 9);
INSERT INTO venda_item VALUES (64, 37, 2);
INSERT INTO venda_item VALUES (64, 18, 6);
INSERT INTO venda_item VALUES (64, 20, 4);
INSERT INTO venda_item VALUES (64, 38, 7);
INSERT INTO venda_item VALUES (64, 10, 4);
INSERT INTO venda_item VALUES (64, 32, 2);
INSERT INTO venda_item VALUES (65, 8, 1);
INSERT INTO venda_item VALUES (65, 18, 2);
INSERT INTO venda_item VALUES (65, 2, 3);
INSERT INTO venda_item VALUES (65, 16, 6);
INSERT INTO venda_item VALUES (65, 22, 5);
INSERT INTO venda_item VALUES (65, 23, 7);
INSERT INTO venda_item VALUES (65, 31, 4);
INSERT INTO venda_item VALUES (65, 17, 10);
INSERT INTO venda_item VALUES (65, 13, 5);
INSERT INTO venda_item VALUES (65, 19, 3);
INSERT INTO venda_item VALUES (65, 12, 5);
INSERT INTO venda_item VALUES (65, 20, 2);
INSERT INTO venda_item VALUES (65, 25, 2);
INSERT INTO venda_item VALUES (65, 26, 4);
INSERT INTO venda_item VALUES (65, 11, 9);
INSERT INTO venda_item VALUES (66, 29, 5);
INSERT INTO venda_item VALUES (66, 7, 10);
INSERT INTO venda_item VALUES (66, 38, 4);
INSERT INTO venda_item VALUES (66, 36, 4);
INSERT INTO venda_item VALUES (66, 9, 5);
INSERT INTO venda_item VALUES (66, 11, 5);
INSERT INTO venda_item VALUES (67, 14, 1);
INSERT INTO venda_item VALUES (68, 25, 1);
INSERT INTO venda_item VALUES (69, 10, 3);
INSERT INTO venda_item VALUES (70, 34, 2);
INSERT INTO venda_item VALUES (70, 32, 2);
INSERT INTO venda_item VALUES (70, 33, 7);
INSERT INTO venda_item VALUES (70, 16, 8);
INSERT INTO venda_item VALUES (70, 7, 1);
INSERT INTO venda_item VALUES (70, 4, 8);
INSERT INTO venda_item VALUES (70, 6, 4);
INSERT INTO venda_item VALUES (70, 5, 5);
INSERT INTO venda_item VALUES (70, 22, 2);
INSERT INTO venda_item VALUES (70, 25, 9);
INSERT INTO venda_item VALUES (70, 29, 4);
INSERT INTO venda_item VALUES (70, 31, 8);
INSERT INTO venda_item VALUES (70, 14, 1);
INSERT INTO venda_item VALUES (71, 28, 5);
INSERT INTO venda_item VALUES (71, 23, 6);
INSERT INTO venda_item VALUES (71, 9, 7);
INSERT INTO venda_item VALUES (71, 31, 5);
INSERT INTO venda_item VALUES (71, 29, 10);
INSERT INTO venda_item VALUES (71, 20, 6);
INSERT INTO venda_item VALUES (71, 6, 5);
INSERT INTO venda_item VALUES (71, 16, 1);
INSERT INTO venda_item VALUES (71, 10, 4);
INSERT INTO venda_item VALUES (71, 32, 6);
INSERT INTO venda_item VALUES (71, 19, 2);
INSERT INTO venda_item VALUES (71, 17, 7);
INSERT INTO venda_item VALUES (72, 29, 8);
INSERT INTO venda_item VALUES (72, 6, 5);
INSERT INTO venda_item VALUES (72, 1, 5);
INSERT INTO venda_item VALUES (72, 32, 5);
INSERT INTO venda_item VALUES (72, 26, 3);
INSERT INTO venda_item VALUES (73, 16, 5);
INSERT INTO venda_item VALUES (73, 31, 9);
INSERT INTO venda_item VALUES (73, 11, 10);
INSERT INTO venda_item VALUES (73, 1, 7);
INSERT INTO venda_item VALUES (73, 34, 10);
INSERT INTO venda_item VALUES (73, 22, 9);
INSERT INTO venda_item VALUES (73, 38, 4);
INSERT INTO venda_item VALUES (73, 6, 2);
INSERT INTO venda_item VALUES (74, 32, 3);
INSERT INTO venda_item VALUES (74, 33, 6);
INSERT INTO venda_item VALUES (74, 4, 10);
INSERT INTO venda_item VALUES (74, 6, 5);
INSERT INTO venda_item VALUES (75, 5, 3);
INSERT INTO venda_item VALUES (75, 4, 2);
INSERT INTO venda_item VALUES (75, 23, 4);
INSERT INTO venda_item VALUES (75, 27, 9);
INSERT INTO venda_item VALUES (75, 15, 2);
INSERT INTO venda_item VALUES (75, 6, 4);
INSERT INTO venda_item VALUES (75, 8, 4);
INSERT INTO venda_item VALUES (76, 16, 7);
INSERT INTO venda_item VALUES (76, 26, 3);
INSERT INTO venda_item VALUES (76, 30, 8);
INSERT INTO venda_item VALUES (76, 13, 1);
INSERT INTO venda_item VALUES (76, 15, 3);
INSERT INTO venda_item VALUES (76, 6, 2);
INSERT INTO venda_item VALUES (76, 18, 8);
INSERT INTO venda_item VALUES (76, 34, 1);
INSERT INTO venda_item VALUES (76, 37, 4);
INSERT INTO venda_item VALUES (76, 29, 6);
INSERT INTO venda_item VALUES (76, 12, 8);
INSERT INTO venda_item VALUES (76, 14, 10);
INSERT INTO venda_item VALUES (76, 32, 9);
INSERT INTO venda_item VALUES (76, 24, 9);
INSERT INTO venda_item VALUES (77, 20, 9);
INSERT INTO venda_item VALUES (77, 16, 2);
INSERT INTO venda_item VALUES (77, 34, 8);
INSERT INTO venda_item VALUES (77, 25, 4);
INSERT INTO venda_item VALUES (77, 4, 3);
INSERT INTO venda_item VALUES (77, 6, 1);
INSERT INTO venda_item VALUES (77, 5, 1);
INSERT INTO venda_item VALUES (77, 11, 10);
INSERT INTO venda_item VALUES (77, 14, 1);
INSERT INTO venda_item VALUES (77, 21, 2);
INSERT INTO venda_item VALUES (77, 13, 5);
INSERT INTO venda_item VALUES (78, 18, 6);
INSERT INTO venda_item VALUES (78, 32, 9);
INSERT INTO venda_item VALUES (78, 6, 1);
INSERT INTO venda_item VALUES (78, 16, 7);
INSERT INTO venda_item VALUES (79, 5, 2);
INSERT INTO venda_item VALUES (80, 21, 4);
INSERT INTO venda_item VALUES (80, 7, 5);
INSERT INTO venda_item VALUES (80, 23, 7);
INSERT INTO venda_item VALUES (80, 11, 2);
INSERT INTO venda_item VALUES (80, 12, 7);
INSERT INTO venda_item VALUES (80, 27, 2);
INSERT INTO venda_item VALUES (80, 32, 8);
INSERT INTO venda_item VALUES (80, 10, 6);
INSERT INTO venda_item VALUES (80, 30, 2);
INSERT INTO venda_item VALUES (80, 16, 5);
INSERT INTO venda_item VALUES (80, 2, 1);
INSERT INTO venda_item VALUES (81, 27, 1);
INSERT INTO venda_item VALUES (81, 29, 3);
INSERT INTO venda_item VALUES (81, 33, 2);
INSERT INTO venda_item VALUES (81, 38, 3);
INSERT INTO venda_item VALUES (81, 36, 4);
INSERT INTO venda_item VALUES (81, 21, 9);
INSERT INTO venda_item VALUES (81, 4, 8);
INSERT INTO venda_item VALUES (81, 12, 7);
INSERT INTO venda_item VALUES (81, 32, 1);
INSERT INTO venda_item VALUES (82, 3, 5);
INSERT INTO venda_item VALUES (82, 32, 8);
INSERT INTO venda_item VALUES (82, 22, 4);
INSERT INTO venda_item VALUES (82, 27, 9);
INSERT INTO venda_item VALUES (82, 38, 4);
INSERT INTO venda_item VALUES (83, 5, 9);
INSERT INTO venda_item VALUES (83, 6, 6);
INSERT INTO venda_item VALUES (84, 25, 9);
INSERT INTO venda_item VALUES (84, 27, 7);
INSERT INTO venda_item VALUES (85, 3, 6);
INSERT INTO venda_item VALUES (86, 24, 7);
INSERT INTO venda_item VALUES (86, 25, 2);
INSERT INTO venda_item VALUES (86, 34, 6);
INSERT INTO venda_item VALUES (86, 14, 7);
INSERT INTO venda_item VALUES (86, 27, 5);
INSERT INTO venda_item VALUES (86, 20, 1);
INSERT INTO venda_item VALUES (86, 22, 6);
INSERT INTO venda_item VALUES (86, 1, 10);
INSERT INTO venda_item VALUES (86, 16, 5);
INSERT INTO venda_item VALUES (86, 8, 1);
INSERT INTO venda_item VALUES (87, 14, 2);
INSERT INTO venda_item VALUES (87, 15, 2);
INSERT INTO venda_item VALUES (87, 18, 7);
INSERT INTO venda_item VALUES (87, 25, 10);
INSERT INTO venda_item VALUES (87, 6, 2);
INSERT INTO venda_item VALUES (87, 35, 3);
INSERT INTO venda_item VALUES (87, 10, 4);
INSERT INTO venda_item VALUES (87, 19, 4);
INSERT INTO venda_item VALUES (87, 23, 7);
INSERT INTO venda_item VALUES (87, 9, 2);
INSERT INTO venda_item VALUES (87, 28, 8);
INSERT INTO venda_item VALUES (87, 5, 10);
INSERT INTO venda_item VALUES (87, 11, 3);
INSERT INTO venda_item VALUES (88, 18, 1);
INSERT INTO venda_item VALUES (88, 14, 5);
INSERT INTO venda_item VALUES (88, 36, 1);
INSERT INTO venda_item VALUES (88, 1, 6);
INSERT INTO venda_item VALUES (88, 35, 6);
INSERT INTO venda_item VALUES (88, 29, 10);
INSERT INTO venda_item VALUES (88, 15, 7);
INSERT INTO venda_item VALUES (88, 10, 1);
INSERT INTO venda_item VALUES (88, 19, 4);
INSERT INTO venda_item VALUES (88, 9, 7);
INSERT INTO venda_item VALUES (88, 24, 7);
INSERT INTO venda_item VALUES (89, 37, 7);
INSERT INTO venda_item VALUES (89, 24, 2);
INSERT INTO venda_item VALUES (89, 19, 5);
INSERT INTO venda_item VALUES (89, 6, 9);
INSERT INTO venda_item VALUES (89, 14, 8);
INSERT INTO venda_item VALUES (89, 20, 10);
INSERT INTO venda_item VALUES (89, 3, 6);
INSERT INTO venda_item VALUES (89, 15, 1);
INSERT INTO venda_item VALUES (89, 28, 5);
INSERT INTO venda_item VALUES (89, 8, 7);
INSERT INTO venda_item VALUES (89, 23, 8);
INSERT INTO venda_item VALUES (89, 18, 5);
INSERT INTO venda_item VALUES (89, 22, 9);
INSERT INTO venda_item VALUES (89, 26, 4);
INSERT INTO venda_item VALUES (89, 31, 6);
INSERT INTO venda_item VALUES (90, 15, 6);
INSERT INTO venda_item VALUES (90, 34, 6);
INSERT INTO venda_item VALUES (90, 18, 9);
INSERT INTO venda_item VALUES (90, 25, 9);
INSERT INTO venda_item VALUES (90, 5, 5);
INSERT INTO venda_item VALUES (90, 3, 1);
INSERT INTO venda_item VALUES (90, 21, 9);
INSERT INTO venda_item VALUES (90, 16, 4);
INSERT INTO venda_item VALUES (90, 36, 3);
INSERT INTO venda_item VALUES (91, 6, 9);
INSERT INTO venda_item VALUES (91, 10, 5);
INSERT INTO venda_item VALUES (91, 29, 1);
INSERT INTO venda_item VALUES (91, 5, 5);
INSERT INTO venda_item VALUES (91, 8, 5);
INSERT INTO venda_item VALUES (92, 3, 7);
INSERT INTO venda_item VALUES (92, 32, 5);
INSERT INTO venda_item VALUES (92, 9, 1);
INSERT INTO venda_item VALUES (92, 33, 2);
INSERT INTO venda_item VALUES (92, 19, 8);
INSERT INTO venda_item VALUES (92, 11, 2);
INSERT INTO venda_item VALUES (92, 17, 2);
INSERT INTO venda_item VALUES (92, 29, 1);
INSERT INTO venda_item VALUES (92, 30, 2);
INSERT INTO venda_item VALUES (92, 16, 1);
INSERT INTO venda_item VALUES (92, 2, 3);
INSERT INTO venda_item VALUES (92, 7, 2);
INSERT INTO venda_item VALUES (93, 13, 1);
INSERT INTO venda_item VALUES (93, 33, 3);
INSERT INTO venda_item VALUES (93, 4, 4);
INSERT INTO venda_item VALUES (93, 19, 2);
INSERT INTO venda_item VALUES (93, 9, 2);
INSERT INTO venda_item VALUES (93, 18, 2);
INSERT INTO venda_item VALUES (93, 17, 2);
INSERT INTO venda_item VALUES (94, 30, 7);
INSERT INTO venda_item VALUES (94, 4, 8);
INSERT INTO venda_item VALUES (94, 2, 1);
INSERT INTO venda_item VALUES (94, 18, 10);
INSERT INTO venda_item VALUES (94, 5, 7);
INSERT INTO venda_item VALUES (94, 32, 5);
INSERT INTO venda_item VALUES (94, 11, 3);
INSERT INTO venda_item VALUES (95, 27, 1);
INSERT INTO venda_item VALUES (95, 31, 2);
INSERT INTO venda_item VALUES (95, 28, 8);
INSERT INTO venda_item VALUES (95, 6, 8);
INSERT INTO venda_item VALUES (95, 24, 7);
INSERT INTO venda_item VALUES (96, 32, 7);
INSERT INTO venda_item VALUES (96, 37, 1);
INSERT INTO venda_item VALUES (96, 36, 3);
INSERT INTO venda_item VALUES (96, 29, 9);
INSERT INTO venda_item VALUES (96, 23, 6);
INSERT INTO venda_item VALUES (96, 19, 5);
INSERT INTO venda_item VALUES (96, 35, 10);
INSERT INTO venda_item VALUES (96, 30, 4);
INSERT INTO venda_item VALUES (96, 1, 7);
INSERT INTO venda_item VALUES (96, 38, 4);
INSERT INTO venda_item VALUES (96, 17, 4);
INSERT INTO venda_item VALUES (96, 9, 10);
INSERT INTO venda_item VALUES (96, 34, 9);
INSERT INTO venda_item VALUES (97, 1, 7);
INSERT INTO venda_item VALUES (97, 25, 3);
INSERT INTO venda_item VALUES (97, 10, 4);
INSERT INTO venda_item VALUES (98, 22, 10);
INSERT INTO venda_item VALUES (99, 31, 5);
INSERT INTO venda_item VALUES (99, 8, 9);
INSERT INTO venda_item VALUES (99, 20, 3);
INSERT INTO venda_item VALUES (99, 27, 9);
INSERT INTO venda_item VALUES (99, 22, 2);
INSERT INTO venda_item VALUES (99, 15, 5);
INSERT INTO venda_item VALUES (99, 23, 2);
INSERT INTO venda_item VALUES (99, 37, 3);
INSERT INTO venda_item VALUES (99, 4, 8);
INSERT INTO venda_item VALUES (99, 9, 10);
INSERT INTO venda_item VALUES (99, 33, 2);
INSERT INTO venda_item VALUES (99, 14, 8);
INSERT INTO venda_item VALUES (99, 3, 3);
INSERT INTO venda_item VALUES (99, 18, 9);
INSERT INTO venda_item VALUES (99, 7, 10);
INSERT INTO venda_item VALUES (100, 15, 3);
INSERT INTO venda_item VALUES (100, 4, 6);
INSERT INTO venda_item VALUES (100, 7, 9);
INSERT INTO venda_item VALUES (100, 28, 10);
INSERT INTO venda_item VALUES (100, 21, 6);
INSERT INTO venda_item VALUES (100, 38, 10);
INSERT INTO venda_item VALUES (100, 18, 3);
INSERT INTO venda_item VALUES (100, 36, 3);
INSERT INTO venda_item VALUES (100, 2, 8);
INSERT INTO venda_item VALUES (100, 8, 7);
INSERT INTO venda_item VALUES (100, 11, 5);
INSERT INTO venda_item VALUES (100, 30, 2);
INSERT INTO venda_item VALUES (100, 37, 5);
INSERT INTO venda_item VALUES (100, 26, 7);
INSERT INTO venda_item VALUES (101, 20, 9);
INSERT INTO venda_item VALUES (101, 30, 3);
INSERT INTO venda_item VALUES (101, 14, 1);
INSERT INTO venda_item VALUES (102, 16, 10);
INSERT INTO venda_item VALUES (102, 38, 8);
INSERT INTO venda_item VALUES (103, 10, 7);
INSERT INTO venda_item VALUES (103, 26, 2);
INSERT INTO venda_item VALUES (103, 18, 8);
INSERT INTO venda_item VALUES (103, 35, 3);
INSERT INTO venda_item VALUES (103, 16, 10);
INSERT INTO venda_item VALUES (103, 12, 1);
INSERT INTO venda_item VALUES (103, 36, 1);
INSERT INTO venda_item VALUES (103, 32, 2);
INSERT INTO venda_item VALUES (103, 29, 3);
INSERT INTO venda_item VALUES (103, 13, 5);
INSERT INTO venda_item VALUES (103, 5, 2);
INSERT INTO venda_item VALUES (104, 11, 4);
INSERT INTO venda_item VALUES (104, 2, 7);
INSERT INTO venda_item VALUES (104, 28, 6);
INSERT INTO venda_item VALUES (104, 14, 8);
INSERT INTO venda_item VALUES (104, 5, 5);
INSERT INTO venda_item VALUES (104, 31, 4);
INSERT INTO venda_item VALUES (104, 19, 2);
INSERT INTO venda_item VALUES (104, 20, 5);
INSERT INTO venda_item VALUES (104, 36, 10);
INSERT INTO venda_item VALUES (104, 22, 7);
INSERT INTO venda_item VALUES (104, 37, 8);
INSERT INTO venda_item VALUES (105, 16, 2);
INSERT INTO venda_item VALUES (105, 32, 4);
INSERT INTO venda_item VALUES (105, 19, 10);
INSERT INTO venda_item VALUES (105, 33, 5);
INSERT INTO venda_item VALUES (106, 2, 7);
INSERT INTO venda_item VALUES (106, 16, 10);
INSERT INTO venda_item VALUES (106, 11, 1);
INSERT INTO venda_item VALUES (106, 30, 2);
INSERT INTO venda_item VALUES (107, 6, 5);
INSERT INTO venda_item VALUES (107, 16, 5);
INSERT INTO venda_item VALUES (107, 29, 4);
INSERT INTO venda_item VALUES (107, 4, 3);
INSERT INTO venda_item VALUES (107, 2, 10);
INSERT INTO venda_item VALUES (107, 17, 6);
INSERT INTO venda_item VALUES (107, 5, 1);
INSERT INTO venda_item VALUES (107, 24, 6);
INSERT INTO venda_item VALUES (107, 1, 2);
INSERT INTO venda_item VALUES (107, 19, 2);
INSERT INTO venda_item VALUES (107, 26, 2);
INSERT INTO venda_item VALUES (108, 31, 7);
INSERT INTO venda_item VALUES (108, 10, 9);
INSERT INTO venda_item VALUES (108, 7, 8);
INSERT INTO venda_item VALUES (108, 6, 10);
INSERT INTO venda_item VALUES (108, 11, 9);
INSERT INTO venda_item VALUES (108, 35, 6);
INSERT INTO venda_item VALUES (108, 23, 6);
INSERT INTO venda_item VALUES (108, 29, 2);
INSERT INTO venda_item VALUES (108, 21, 6);
INSERT INTO venda_item VALUES (108, 33, 1);
INSERT INTO venda_item VALUES (108, 37, 5);
INSERT INTO venda_item VALUES (108, 20, 1);
INSERT INTO venda_item VALUES (108, 14, 2);
INSERT INTO venda_item VALUES (108, 2, 8);
INSERT INTO venda_item VALUES (109, 27, 8);
INSERT INTO venda_item VALUES (109, 25, 1);
INSERT INTO venda_item VALUES (109, 16, 3);
INSERT INTO venda_item VALUES (109, 13, 6);
INSERT INTO venda_item VALUES (109, 1, 2);
INSERT INTO venda_item VALUES (109, 24, 7);
INSERT INTO venda_item VALUES (109, 3, 1);
INSERT INTO venda_item VALUES (109, 17, 2);
INSERT INTO venda_item VALUES (109, 6, 8);
INSERT INTO venda_item VALUES (109, 14, 5);
INSERT INTO venda_item VALUES (109, 30, 6);
INSERT INTO venda_item VALUES (109, 32, 10);
INSERT INTO venda_item VALUES (109, 21, 5);
INSERT INTO venda_item VALUES (109, 19, 4);
INSERT INTO venda_item VALUES (109, 9, 6);
INSERT INTO venda_item VALUES (110, 1, 6);
INSERT INTO venda_item VALUES (110, 38, 8);
INSERT INTO venda_item VALUES (110, 8, 7);
INSERT INTO venda_item VALUES (110, 23, 6);
INSERT INTO venda_item VALUES (110, 5, 1);
INSERT INTO venda_item VALUES (110, 14, 8);
INSERT INTO venda_item VALUES (110, 15, 8);
INSERT INTO venda_item VALUES (110, 7, 3);
INSERT INTO venda_item VALUES (110, 16, 5);
INSERT INTO venda_item VALUES (110, 13, 2);

-- Completed on 2020-08-31 14:58:07

--
-- PostgreSQL database dump complete
--
