CREATE TABLE Pessoa (
  idPessoa INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  logradouro VARCHAR(255)    ,
  cidade VARCHAR(255)    ,
  estado CHAR(15)    ,
  telefone VARCHAR(20)    ,
  email VARCHAR(255)      ,
PRIMARY KEY(idPessoa));




CREATE TABLE Produto (
  idProduto INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  quantidade INTEGER    ,
  preço NUMERIC      ,
PRIMARY KEY(idProduto));




CREATE TABLE Usuario (
  idUsuario INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  email VARCHAR(255)    ,
  senha CHAR(15)      ,
PRIMARY KEY(idUsuario));




CREATE TABLE PessoaJuridica (
  idPessoaJuridica INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  cnpj INTEGER      ,
PRIMARY KEY(idPessoaJuridica)  ,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));


CREATE INDEX PessoaJuridica_FKIndex1 ON PessoaJuridica (Pessoa_idPessoa);


CREATE INDEX IFK_juridica ON PessoaJuridica (Pessoa_idPessoa);


CREATE TABLE PessoaFisica (
  idPessoaFisica INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  cpf INTEGER      ,
PRIMARY KEY(idPessoaFisica)  ,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));


CREATE INDEX PessoaFisica_FKIndex1 ON PessoaFisica (Pessoa_idPessoa);


CREATE INDEX IFK_fisica ON PessoaFisica (Pessoa_idPessoa);


CREATE TABLE movimentocompra (
  Usuario_idUsuario INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  Produto_idProduto INTEGER   NOT NULL ,
  quantidade FLOAT    ,
  precounitario NUMERIC          ,
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa),
  FOREIGN KEY(Usuario_idUsuario)
    REFERENCES Usuario(idUsuario));


CREATE INDEX movimentocompra_FKIndex1 ON movimentocompra (Produto_idProduto);
CREATE INDEX movimentocompra_FKIndex2 ON movimentocompra (Pessoa_idPessoa);
CREATE INDEX movimentocompra_FKIndex3 ON movimentocompra (Usuario_idUsuario);


CREATE INDEX IFK_fisica ON movimentocompra (Produto_idProduto);
CREATE INDEX IFK_dados ON movimentocompra (Pessoa_idPessoa);
CREATE INDEX IFK_Rel_28 ON movimentocompra (Usuario_idUsuario);


CREATE TABLE movimentovenda (
  Produto_idProduto INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  Usuario_idUsuario INTEGER   NOT NULL ,
  quantinade INTEGER    ,
  tipo CHAR(15)    ,
  preco FLOAT          ,
  FOREIGN KEY(Usuario_idUsuario)
    REFERENCES Usuario(idUsuario),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa),
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto));


CREATE INDEX movimentovenda_FKIndex1 ON movimentovenda (Usuario_idUsuario);
CREATE INDEX movimentovenda_FKIndex2 ON movimentovenda (Pessoa_idPessoa);
CREATE INDEX movimentovenda_FKIndex3 ON movimentovenda (Produto_idProduto);


CREATE INDEX IFK_usuario ON movimentovenda (Usuario_idUsuario);
CREATE INDEX IFK_dados ON movimentovenda (Pessoa_idPessoa);
CREATE INDEX IFK_movimentação ON movimentovenda (Produto_idProduto);


