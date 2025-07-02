
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);


CREATE TABLE vendedor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    salario NUMERIC(10, 2) DEFAULT 0,
    comissao NUMERIC(5, 2) DEFAULT 0,
    total_vendido NUMERIC(10, 2) DEFAULT 0,
    id_usuario INTEGER UNIQUE REFERENCES usuario(id)
);

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    data_entrada DATE DEFAULT CURRENT_DATE,
    ativo BOOLEAN DEFAULT TRUE
);


CREATE TABLE contato (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    id_cliente INTEGER REFERENCES cliente(id)
);


CREATE TABLE contrato (
    id SERIAL PRIMARY KEY,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    descricao TEXT,
    valor NUMERIC(10,2) NOT NULL,
    id_cliente INTEGER NOT NULL REFERENCES cliente(id),
    id_vendedor INTEGER NOT NULL REFERENCES vendedor(id),
    ativo BOOLEAN DEFAULT TRUE
);