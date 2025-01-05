
CREATE LOGIN Loja
   WITH PASSWORD ='loja'
GO
CREATE DATABASE LojaDB;
-- Sequence para ID de Pessoa
CREATE SEQUENCE seq_pessoa_id
START WITH 1
INCREMENT BY 1;

-- Tabela Usuários
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY IDENTITY,
    nome NVARCHAR(100),
    email NVARCHAR(100) UNIQUE,
    senha NVARCHAR(100)
);

-- Tabela Pessoas
CREATE TABLE Pessoas (
    id_pessoa INT PRIMARY KEY DEFAULT NEXT VALUE FOR seq_pessoa_id,
    nome NVARCHAR(100),
    endereco NVARCHAR(200),
    telefone NVARCHAR(20),
    tipo NVARCHAR(20)
);

-- Tabela Pessoa Física
CREATE TABLE PessoaFisica (
    id_pessoa INT PRIMARY KEY,
    cpf NVARCHAR(11) UNIQUE,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoas(id_pessoa)
);

-- Tabela Pessoa Jurídica
CREATE TABLE PessoaJuridica (
    id_pessoa INT PRIMARY KEY,
    cnpj NVARCHAR(14) UNIQUE,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoas(id_pessoa)
);

-- Tabela Produtos
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY IDENTITY,
    nome NVARCHAR(100),
    quantidade INT,
    preco_venda DECIMAL(10, 2)
);

-- Tabela Movimentos de Compra
CREATE TABLE MovimentosCompra (
    id_movimento INT PRIMARY KEY IDENTITY,
    id_usuario INT,
    id_produto INT,
    id_pessoa_juridica INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_pessoa_juridica) REFERENCES PessoaJuridica(id_pessoa)
);

-- Tabela Movimentos de Venda
CREATE TABLE MovimentosVenda (
    id_movimento INT PRIMARY KEY IDENTITY,
    id_usuario INT,
    id_produto INT,
    id_pessoa_fisica INT,
    quantidade INT,
    preco_total AS (quantidade * (SELECT preco_venda FROM Produtos WHERE id_produto = MovimentosVenda.id_produto)),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_pessoa_fisica) REFERENCES PessoaFisica(id_pessoa)
);
