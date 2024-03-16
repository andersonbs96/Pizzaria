create DATABASE pizzaria;

use pizzaria;

-- Entidade Forte --
create table clientes (
  id int primary key not null,
  nome varchar(50) not null,
  idade int not null,
  endereco varchar(100) not null,
  telefone varchar(9) not null
);

create table bebidas (
  id int primary key not null,
  nome varchar(50) not null,
  descrição varchar(200) not null,
  preço float(4,2) not null
);

create table Ingredientes (
	id int primary key not null,
	nome varchar(50) not null,
	qtdEstoque int not null 
);

create table saboresPizzas (
  id int primary key not null,
  nome varchar(50) not null,
  preco float(5,2) not null,

  -- Chaves estrangeiras --
  fk_idIngrediente int not null,
  foreign key (fk_idIngrediente) references Ingredientes(id)
);

create table bordasPizzas (
  id int primary key not null,
  saborBorda varchar(50) not null,
  preco float(4,2) not null,

  -- Chaves estrangeiras --
  fk_idIngrediente int not null,
  foreign key (fk_idIngrediente) references Ingredientes(id)
);

create table massasPizzas (
  id int primary key not null,
  tipoMassa varchar(50) not null,
  preco float(5,2) not null,

  -- Chaves estrangeiras --
  fk_idIngrediente int not null,
  foreign key (fk_idIngrediente) references Ingredientes(id)
);

create table pizzas (
  id int primary key not null,

  -- Chaves estrangeiras --
  fk_idSabor int not null,
  fk_idBorda int not null,
  fk_idMassa int not null,
  foreign key (fk_idSabor) references saboresPizzas(id),
  foreign key (fk_idBorda) references bordasPizzas(id),
  foreign key (fk_idMassa) references massasPizzas(id)
);

create table pedidos (
  id int primary key not null,
  dataPedido datetime not null,
  qtdPizzas int not null,
  qtdBebidas int not null,
  valorTotal float (10,2) not null,

  -- Chaves estrangeiras --
  fk_idClientes int not null,
  fk_idPizzas int not null,
  fk_idBebidas int not null,
  foreign key (fk_idClientes) references clientes(id),
  foreign key (fk_idPizzas) references pizzas(id),
  foreign key (fk_idBebidas) references Bebidas(id)
);

create table fornadaPizzas (
  id int primary key not null,
  dataFornada datetime,

  -- Chaves estrangeiras --
  fk_idPedido int not null,
  foreign key (fk_idPedido) references pedidos(id)
);