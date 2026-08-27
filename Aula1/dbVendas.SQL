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
