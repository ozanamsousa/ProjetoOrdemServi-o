create database OrdemServiço;
use OrdemServiço;
-- criação da tabela cliente
create table Cliente(
idCliente int auto_increment not null,
Nome varchar(45) not null,
Sobrenome varchar (45) not null,
Endereço varchar (255) not null,
CPF char (11) not null,
primary key (idCliente)
); 
insert into Cliente(Nome,Sobrenome,Endereço,CPF) 
values
('Fernando','Souza','342-Rua Joao Viana-Paraiso-Ipatinga',70709638078),
('Tereza','Cristina','21-Castle-Spring-TX',75089110085),
('Carine','Gusmão','41-Castle-Spring-TX',75089110095),
('Gustavo','Fernandes','100-Castle-Spring-TX',85089110085),
('Gustavo','Martins','21-Castle-Spring-TX',75089111085),
('Cecilia','Ferreira','123-Castle-Spring-TX',75089110065),
('Fernando','Pereira','24-Fondren-Houston-TX',75089120085),
('Carlos','Silva','1-Fondren-Houston-TX',75089110085),
('Melisa','Souza','12-Fondren-Houston-TX',75189110085),
('Hercules','Pereira','31-Fondren-Houston-TX',75029110085),
('Alicia','Pereira','731-Fondren-Houston-TX',75089110085),
('Jennifer','Lopes','291-Berry-Bellaire-TX',90525837060),
('Ramesh','Nakashi','975-Fire-Oak-Humble-TX',36943638076),
('Joyce','Nunes','5631-Rice-Houston-TX',39436357087),
('James','Raviot','450-Stone-Houston-TX',42538249007);
select *from cliente;
-- criação da tabela veiculo
create table Veiculo(
idVeiculo int auto_increment not null,
Marca varchar (45) not null,
Modelo varchar (45) not null,
Cor varchar(45),
Placa varchar(20),
Descrição enum ('Ret', 'Sedan', 'SUV'),
primary key (idVeiculo),
constraint fk_veiculo_cliente foreign key (idVeiculo) references Cliente(idCliente)
);
insert into Veiculo(Marca,Modelo,Cor,Placa,Descrição) values
('Fiat','Mobi','Prata','GTV3712','Ret'),
('Renault','Kwid','Vermelho','GTW7309','Ret'),
('Citroen','C3','Prata','GXZ0050','Ret'),
('Fiat','Argo','Prata','GMH2005','Ret'),
('Volkswagen','Gol','Preto','GRF8324','Ret'),
('Volkswagen','Voyage','Preto','HKJ2127','Sedan'),
('Volkswagen','Voyage','Prata','HNR0819','Sedan'),
('Volkswagen','Voyage','Branco','HDU9901','Sedan'),
('Volkswagen','Voyage','Vermelho','HJS8783','Sedan'),
('Hyundai ','HB20','Vermelho','HEM9459','Ret'),
('Hyundai ','HB20','Prata','GZE9923','Ret'),
('Volkswagen ','Polo','Prata','GYV4268','Ret'),
('Volkswagen ','Polo','Preto','GLW6551','Ret'),
('Chevrolet  ','Onix','Prata','HNO6564','Ret'),
('Chevrolet  ','Onix','Preto','GUL7593','Ret')
;
-- criação da tabela mecanico

create table Mecanico(
idMecanico int not null,
NomeMecanico varchar(45),
Especialidade varchar(45),
Endereço varchar(255),
primary key (idMecanico),
constraint fk_mecanico_veiculo foreign key (idMecanico) references Veiculo(idVeiculo),
constraint fk_mecanico_ordemserviço foreign key (idMecanico) references OrdemServiço(idOrdemServiço)
);
insert into Mecanico(NomeMecanico,Especialidade,Endereço) values
(1,'Joventino Gervasio','Eletrica','200-Rua Adoriran-Tx'),
(2,'Silvio Teixeira','Motor','200-Rua Adoriran-Tx'),
(3,'Jhon Lenon','Hidraulico','200-Rua Adoriran-Tx'),
(4,'Joventino Gervasio','Eletrica','100-Rua Porto Alegre-Tx'),
(5,'Silvio Teixeira','Motor','100-Rua Porto Alegre-Tx'),
(6,'Jhon Lenon','Hidraulico','100-Rua Porto Alegre-Tx'),
(7,'Rodrigo Ferreira','Eletrica','300-Rua Brasilia-Tx'),
(8,'Thiago Nunes','Motor','300-Rua Brasilia-Tx'),
(9,'Luis Ferreira','Hidraulico','300-Rua Brasilia-Tx');
-- criação da tabela Ordem de Serviço
drop table OrdemServiço;
create table OrdemServiço(
idOrdemServiço int auto_increment not null,
NumeroOs int not null,
ValorMãoDeObra float,
ValorPeça float,
DataInicio Date not null,
DataFim Date not null,
StatusOrdemServiço ENUM('Andamento', 'Concluido'),
primary key (idOrdemServiço),
constraint fk_ordemserviço_mãodeobra foreign key (idOrdemServiço) references MãoDeObra(idMãoDeObra),
constraint fk_ordemserviço_peça foreign key (idOrdemServiço) references Peça(idPeça)
);
insert into OrdemServiço(NumeroOs,ValorMãoDeObra,ValorPeça,DataInicio,DataFim,StatusOrdemServiço) values
(1,'350.00','150.00','2022-02-10','2022-02-14','Concluido'),
(2,'350.00','270.00','2022-02-10','2022-02-17','Andamento'),
(3,'350.00','370.00','2022-02-10','2022-02-12','Concluido'),
(4,'350.00','120.00','2022-02-10','2022-02-12','Concluido'),
(5,'350.00','150.00','2022-02-10','2022-02-20','Andamento'),
(6,'350.00','180.00','2022-02-10','2022-02-21','Andamento'),
(7,'350.00','220.00','2022-02-10','2022-02-21','Andamento'),
(8,'350.00','420.00','2022-02-10','2022-02-22','Andamento');
-- criação da tabela Mão de Obra
create table MãoDeObra(
idMãoDeObra int auto_increment,
Descrição varchar(255),
ValorMãoDeObra float,
primary key(idMãoDeObra)
);
insert into MãoDeObra(Descrição,ValorMãoDeObra) values
('Abertura do capuz','350.00');
-- criação da tabela peça
create table Peça(
idPeça int auto_increment not null,
NomePeça varchar(45),
ValorPeça float,
primary key (idPeça)
);
insert into Peça(NomePeça,ValorPeça) values
('Pastilhas de freio','200.00'),
('Disco e tambores de freio (conjunto)','579.00'),
('Baterias (TUDOR)','360.00'),
('Embreagens','360.00'),
('Homocinetica e Semieixo','370.00'),
('Radiadores','470.00'),
('Correiras','120.00'),
('Filtros','79.00'),
('Valvulas','29.00'),
('Amortecedor e Kit','329.00'),
('Lubrificante','60.00'),
('Bombas','60.00'),
('Aditivos','30.00'),
('Buchas e Coxin','75.00'),
('Cabos de Comando','65.00'),
('Mangueiras','125.00'),
('Palheitas','80.00'),
('Pistoes e Bronzinas','280.00'),
('Rolamento','80.00'),
('Vela e Cabo','180.00');

create table Pagamento(
idCliente int,
idPagamento int,
tipoPagamento enum ('Boleto','Cartão', 'Dois cartões,Pix'),
LimiteAvaliado float,
Validade date,
primary key (idCliente, idPagamento),
constraint fk_pagamento_cliente foreign key (idPagamento) references Cliente(idCliente)
);
insert into Pagamento(idCliente,idPagamento,tipoPagamento,LimiteAvaliado,Validade)value
(8,2,'Boleto','3500.00','2037-01-21'),
(9,2,'Boleto','3500.00','2038-02-22'),
(10,1,'Cartão','3500.00','2039-04-23'),
(11,1,'Cartão','3500.00','2040-05-14');
select*from Pagamento;
show tables;
-- verificando qual carro é Ret na mecanica
select Marca, Modelo, placa from veiculo where Descrição = 'Ret';
-- verificando qual carro é Sedan na mecanica
select Marca, Modelo, placa from veiculo where Descrição = 'Sedan';
-- verificando qual Mecanico é responsavel por carro trabalhando na especialidade de motor
SELECT NomeMecanico
FROM (Mecanico JOIN Veiculo ON idMecanico = idVeiculo)
WHERE Especialidade = 'Motor';
-- verificando quantos clientes tem na base
select count(*) from Cliente;
-- verificando Nome completo e endereço do cliente, e que ja pagaram e está concluida a ordem de serviço
select concat(Nome,' ',Sobrenome) as Nome_completo, Endereço from Cliente, OrdemServiço  where idCliente = idOrdemServiço and  StatusOrdemServiço = 'Concluido';
SELECT NomeMecanico, Especialidade FROM Mecanico
	ORDER BY Especialidade DESC;
