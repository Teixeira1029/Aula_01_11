create database bd_exporta;

use bd_exporta;

create table departamento(
	id int primary key auto_increment not null,
    nome varchar(50),
    localizacao varchar(50),
    orcamento decimal(10, 2)
);

insert into departamento (nome, localizacao, orcamento) values 
('Recursos Humanos', 'São Paulo', 50000.00),
('Financeiro', 'Rio de Janeiro', 75000.00),
('Marketing', 'Belo Horizonte', 60000.00),
('TI', 'Curitiba', 50000.00),
('vendas', 'porto Alegre', 87000.00);


delete from departamento
where id =5;

select * from departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento 
fields terminated by ',' enclosed by '"'
lines terminated by '\n';



start transaction;

update departamento set orcamento = orcamento + 1000.00 where nome = 'TI';

update departamento set orcamento = orcamento + 1000.00 where nome = 'financeiro';

commit;

start transaction;

update departamento set orcamento = orcamento + 1000.00 where nome = 'recursos humanos';

update departamento set orcamento = orcamento + 1000.00 where nome = 'vendas';

rollback;

