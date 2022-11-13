-- Criaçao de um banco de dados para criaçao do E-commerce.

create database oficina;
use oficina;

-- criar tabela cliente

create table clients(
	idClient int auto_increment primary key, 
    Fname varchar(20),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(100),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment = 1;

-- criar tabela produto
create table products(
	idProduct int auto_increment primary key,
    Pname varchar(100) not null,
    Classification_kids bool default false,
    Category enum ('Acessórios', 'Peças', 'Serviços') not null,
    Avaliacao float default 0,
    Size varchar(10)
   
);
-- para ser continuado no desafio; termine de implementar a tabela e crie a conexao com as 
-- tabelas necessárias além disso reflita essa modificaçao no dioagrama do esquema relacional.
-- criar constraints relacionados ao pagamento.

create table payments(
	idClient int,
    typePayment enum ('Boleto', 'Cartao', 'Dois cartoes','Pix'),
    limiteAvailable enum('Em Processamento','Confirmado', 'Negado', 'Cancelado') default 'Em Processameento',
    primary key (idClient, idPayment)
);
-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum ('Confirmado', 'Cancelado', 'Em Processamento') default 'Em Processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
	constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
			on update cascade
); 
desc orders;
-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15),
    Contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
);

-- criar tabela funcionario.

create table employee(
	idEmployee int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(15),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_employee unique(CNPJ),
    constraint unique_cpf_employee unique(CPF)
);

-- criar tabela produto / funcionario
create table productEmployee(
	idPemployee int,
    idPproduct int,
    prodQuantity int default 1,
	constraint primary key (idPemployee, idPproduct),
    constraint fk_product_employee foreign key (idPemployee) references employee(idEmployee),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum ('Disponivel', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_employee foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key ( idPOorder) references orders(IdOrder)

); 

create table storageLocation(
	idLproduct int,
    idLstorage int,
    Location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
); 

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
	constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
    );
    
    desc productSupplier;
    show tables;
    show databases;
    use information_schema;
    desc referential_constraints;
    select * from referential_constraints where constraint_schema = 'oficina';
    
    