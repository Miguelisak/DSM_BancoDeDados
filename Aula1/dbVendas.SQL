CREATE DATABASE dbVendas;
Use DATABASE dbVendas;
Go
CREATE TABLE Cliente
(
    idCliente INT IDENTITY(1, 1) NOT NULL,
    Nome Varchar(100), NOT NULL,
    Email Varchar(100) NOT NULL,
    Telefone Varchar(20) NULL,
    cpf Varchar(14) NOT NULL,
    dtCadastro Datetime NOT NULL DEFAULT GETDATE(),

    CONSTRAINT PK_Cliente
        PRIMARY KEY (idCliente),

    CONSTRAINT UQ_Cliente_CPF
        UNIQUE (cpf)
);

CREATE TABLE Pedido
(
    IdPedido INT IDENTITY(1, 1) NOT NULL,
    IdCliente INT IDENTITY(1, 1) NOT NULL, 
    DtPedido Datetime NOT NULL DEFAULT GETDATE(),
    PeStatus Varchar(20) NOT NULL,
    ValorTotal MONEY NOT NULL, 

    CONSTRAINT PK_IdPedido
        PRIMARY KEY (IdPedido),

    CONSTRAINT FK_IdCliente
        FOREIGN KEY (IdCliente)
);

CREATE TABLE Produto
(
    IdProduto INT IDENTITY(1, 1) NOT NULL,
    Descricao Varchar(150) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    ativo BIT NOT NULL DEFAULT 1,
    
    CONSTRAINT FK_IdProduto
        PRIMARY KEY (IdProduto),

    CONSTRAINT CK_Produto_Preco
        CHECK (preco > 0),

    CONSTRAINT CK_Produto_Estoque
        CHECK (estoque >= 0)
);


CREATE TABLE ItemPedido
(
    IdPedido INT IDENTITY(1, 1) NOT NULL,
    IdCliente INT IDENTITY(1, 1) NOT NULL,
    Quantidade INT NOT NULL,
    Valor MONEY NOT NULL,

    CONSTRAINT FK_IdPedido
        FOREIGN KEY (IdPedido),

    CONSTRAINT FK_IdProduto
        FOREIGN KEY (IdProduto),

);

CREATE INDEX Id_Cliente_Nome
ON Cliente(nome);