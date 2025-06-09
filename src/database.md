### Tabelas

````create table usuario(
id SERIAL PRIMARY KEY,
email varchar(100) UNIQUE NOT NULL,
senha varchar(40) NOT NULL
)````

create table cliente(
id SERIAL PRIMARY KEY,
nome varchar(150) NOT NULL,
gasto_total INT,		
id_usuario INT  UNIQUE NOT NULL,
FOREiGN KEY (id_usuario) REFERENCES usuario(id)

)

create table contato(
id SERIAL PRIMARY KEY,
nome varchar(100),
email varchar(120),
telefone varchar(13),
endereco varchar(150),
id_cliente INT not null,
FOREIGN KEY (id_cliente) REFERENCES cliente(id)
)


create table contrato(
id SERIAL PRIMARY KEY,
data_inicial DATE NOT NULL,
data_final DATE NOT NULL,
descricao TEXT,
valor DECIMAL(10,2),
id_cliente int NOT NULL,
foreign key (id_cliente) REFERENCES cliente(id)
)

CREATE INDEX idx_cliente_usuario ON cliente(id_usuario);
CREATE INDEX idx_contato_cliente ON contato(id_cliente);