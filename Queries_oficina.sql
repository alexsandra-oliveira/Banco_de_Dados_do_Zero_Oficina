use oficina;
show tables;

insert into clients (Fname, Minit, Lname, CPF, Address) values
	      ('Regina', 'M', 'Silva', 12356789, 'rua silva de prata 29, Carangola - cidade das flores'),
		  ('Oswaldo', 'O', 'Pimentel', 987654321, 'rua alameda 289, centro - cidade das flores'),
		  ('Ricardo', 'F', 'Silva', 45678913, 'avenida alameda vinha 1009, Centro - cidade das flores'),
		  ('Juliana', 'S', 'França', 789123456, 'rua lareijras 861, centro - Cidade das flores'),
		  ('Geovana', 'G', 'Assis', 98745631, 'avenida koller 19, centro - Cidade das flores'),
		  ('Priscila', 'M', 'Cruz', 654789123, 'rua alameda das flores 28, Centro - Cidade das flores');

select * from clients;
          
insert into product(Pname, classification, category, avaliacao, size) values
          ('Valvúlas', false, 'Peças', '4', null),
          ('Pneus', true, 'Peças', '3', null),
          ('Lanternagem', true, 'Serviços', '5', null),
          ('Troca de Óleo', false, 'Serviços', '4', null),
          ('Cano de escape', true, 'Peças', '3', '3x57x80'),
          ('Som', false, 'Acessórios', '2', null),
          ('Alarme', false, 'Acessórios', '3', null);
          
select * from product;

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		(1, default, 'Venda de Peças', null, 1),
        (2, default, 'Prestaçao de Serviços', 50, 0),
        (3, 'confirmado', null, null, 1),
        (4, default, 'Venda de Acessórios', 150, 0);

select * from orders;

insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
		(1, 1, 2, null),
		(2, 1, 1, null),
		(3, 2, 1, null);
        
select * from productOrder;

insert into productStorage(storageLocation, quantity)values
		('Rio de Janeiro', 200),
		('Rio de Janeiro', 500),
		('Sao Paulo', 10),
		('Sao Paulo', 100),
		('Sao Paulo', 10),
		('Brasilia', 60);

select * from productStorage;
        
insert into storageLocation(idLproduct, idLstorage, location) values
		(1, 2, 'RJ'),
        (2, 6, 'GO');
        
select * from storageLocation;

insert into supplier(SocialName, CNPJ, contact) values
		('Auto Peças Sao Vicente', 123456789123456, '21982474'),
        ('Auto Peças Vitória', 854519649143457, '21982484'),
        ('Auto Peças Dois Irmaos', 934567893934695, '21972474');

 select * from supplier;  
 
insert into productSupplier(idPsSupplier, idPsProduct, quantity) values
		(1, 1, 100),
        (1, 2, 200),
        (2, 4, 50),
        (3, 3, 15),
        (2, 5, 10);

select * from productSupplier;
        
insert into employee(Office, Fname, Minit, Lname, CPF, Address, contact) values
		('Mecanico', 'José', 'O', 'Nascimento', 12345678945, 'R. Sao Judas Tadeu, 29 - Copa Cabana - Rio de Janeiro', '21994628754'),
        ('Recepcionista', 'Fátima','M', 'Carvalho', 12345678317, 'R. 2 irmaos, 45 - Tabocas - Rio de Janeiro', '21985678952'),
        ('Lanterneiro', 'Rogério', 'P', 'Santos', 45678912365, 'R. da Praia Grande, 55 - Praia Grande - Sao Paulo', '11986574846');

select * from employee;

insert into productEmployee(idPemployee, idPproduct, prodQuantity) values
		(1, 6, 80),
        (2, 7, 10);
        
select * from productEmployee;
select count(*) from clients;   
    
select * from clients c, orders o 
		where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus 
		from clients c, orders o 
        where c.idClient = idOrderClient;

select concat(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status 
		from clients c, orders o 
        where c.idClient = idOrderClient;
        
select count(*) from clients c, orders o
		where c.idClient = idOrderClient;

-- recuperaçao de pedido com produto associado.
select * from clients c 
        inner join orders o on c.idClient = o.idOrderClient
		inner join productOrder p on idOrder = o.idOrder
        group by idClient;

-- Recuperar quantos pedidos forem realizados pelos clientes.
select c.idClient, Fname, count(*) as Number_of_order from clients c 
        inner join orders o on c.idClient = o.idOrderClient
        group by idClient;
        
select c.idClient, Fname, count(*) as Number_of_order from clients c 
        inner join orders o on c.idClient = o.idOrderClient
		inner join productOrder p on p.idPOorder = o.idOrder
        group by idClient;
                

