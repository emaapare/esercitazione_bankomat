use bankomat

create TABLE funzionalita(
 nome nvarchar(20) primary key
)

insert INTO funzionalita VALUES ('funzionalità base')
insert INTO funzionalita VALUES ('report saldo')
insert INTO funzionalita VALUES ('prelievo')
insert INTO funzionalita VALUES ('registro operazioni')

create TABLE banca(
 id int identity(0,1) primary key not null,
 nome nvarchar(30) not null,
)

insert INTO banca VALUES ('Credit Agricole')
insert INTO banca VALUES ('Che Banca!')
insert INTO banca VALUES ('Intesa San Paolo')
insert INTO banca VALUES ('BPM')
insert INTO banca VALUES ('Fineco')

create TABLE funzionalitaBanca(
 id int identity(0,1) primary key not null,
 funzionalita nvarchar(20) not null,
 idBanca int not null,
 FOREIGN KEY(funzionalita) REFERENCES funzionalita(nome),
 FOREIGN KEY(idBanca) REFERENCES banca(id)
)

insert INTO funzionalitaBanca VALUES (0,0)
insert INTO funzionalitaBanca VALUES (0,1)
insert INTO funzionalitaBanca VALUES (1,1)
insert INTO funzionalitaBanca VALUES (0,2)
insert INTO funzionalitaBanca VALUES (2,2)
insert INTO funzionalitaBanca VALUES (0,3)
insert INTO funzionalitaBanca VALUES (1,3)
insert INTO funzionalitaBanca VALUES (2,3)
insert INTO funzionalitaBanca VALUES (0,4)
insert INTO funzionalitaBanca VALUES (1,4)
insert INTO funzionalitaBanca VALUES (2,4)
insert INTO funzionalitaBanca VALUES (3,4)

create TABLE cliente(
 id int identity(0,1) primary key not null,
 nome nvarchar(20) not null,
 cognome nvarchar(20) not null, 
 email nvarchar(40) not null,
 codiceFiscale nvarchar(16) not null,
 username nvarchar(20) not null,
 pssword nvarchar(20) not null,
 stato bit not null,
 tentativi int not null,
 idBanca int not null,
 FOREIGN KEY(idBanca) REFERENCES banca(id)
)

insert INTO cliente VALUES ('mario', 'rossi', 'mariorossi@gmail.com', 'MEWHEI38293', 'mariorossi', '123', 0, 3, 3)
insert INTO cliente VALUES ('pippo', 'angelo', 'pippoangelo@gmail.com', 'PA912312HJB', 'pippoangelo', '123', 0, 3, 3)
insert INTO cliente VALUES ('giancarlo', 'ferrari', 'giancarloferrari@gmail.com', 'GFSGYGEWSJA3', 'giancarloferrari', '123', 0, 3, 3)
insert INTO cliente VALUES ('piero', 'giallo', 'pierogiallo@libero.it', 'PRICDSD323B2', 'pierogiallo', '123', 0, 3, 1)
insert INTO cliente VALUES ('lorenzo', 'verde', 'lorenzoverde@gmail.com', 'LREI93IEJ3I3', 'lorenzoverde', '123', 0, 3, 2)


create TABLE contoCorrente(
 iban int primary key not null,
 saldo float not null,
 idCliente int not null,
 FOREIGN KEY(idCliente) REFERENCES cliente(id)
)

insert INTO contoCorrente VALUES (875465532, 1000, 0)
insert INTO contoCorrente VALUES (562132100, 1200, 1)
insert INTO contoCorrente VALUES (564651209, 760, 2)

create TABLE movimenti(
 id int identity(0,1) primary key not null,
 importo float not null,
 dtMovimento date not null,
 note nvarchar(100),
 iban int not null,
 FOREIGN KEY(iban) REFERENCES contoCorrente(iban)
)

insert INTO movimenti VALUES (700, '2022-06-23', 'regalo compleanno', 875465532)
insert INTO movimenti VALUES (350, '2019-08-04', 'versamento contanti', 562132100)
insert INTO movimenti VALUES (400, '2016-11-18', 'soldi cena', 564651209)

select * from funzionalita
select * from banca
select * from cliente
select * from contoCorrente
select * from movimenti

select * from cliente join contoCorrente on cliente.id = contoCorrente.idCliente where saldo >= 1000

select *
from movimenti 
join contoCorrente on movimenti.iban = contoCorrente.iban
where cliente.codiceFiscale = 



select banca.nome , count(cliente.id)
from banca join cliente on banca.id = cliente.idBanca 
group by banca.nome 
having COUNT(cliente.id) >= 3