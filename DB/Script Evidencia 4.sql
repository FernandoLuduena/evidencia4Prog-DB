Create Database DB_Batidora;

Use db_batidora;

Create Table Fabricante (
	Id int primary key auto_increment,
    Nombre varchar(50)
);

Create Table Accesorios (
	Id int primary key auto_increment,
    Nombre varchar(50),
    Material varchar(50)
);

Create Table Fabricante_MarcaModelo (
	Id int primary key auto_increment,
    IdFabricante int,
    Marca varchar(50),
    Modelo varchar(50),
	Constraint FK_FabricanteMarcaModelo_Fabricante FOREIGN KEY(IdFabricante) REFERENCES Fabricante(Id)
);

Create Table Batidoras(
	Id int primary key auto_increment,
    IdMarcaModelo int,
    Potencia int,
    Velocidades int,
    Material varchar(50),
    Peso float,
    FechaLanzamiento DATE,
    CONSTRAINT FK_Batidoras_MarcaModelo FOREIGN KEY(IdMarcaModelo) REFERENCES Fabricante_MarcaModelo(Id)
);


Create Table Batidoras_Accesorios(
	IdBatidora int,
    IdAccesorio int,
    CONSTRAINT FK_BatidoraAccesorio_Batidora foreign key(IdBatidora) REFERENCES Batidoras(Id),
    CONSTRAINT FK_BatidoraAccesorios_Accesorio FOREIGN KEY(IdAccesorio) REFERENCES Accesorios(Id)
);

insert into Fabricante values (1,'KitchenAid');
insert into Fabricante values (2,'Moulinex');
insert into Fabricante values (3,'Yelmo');

insert into Fabricante_MarcaModelo values (1, 1, 'KitchenAid' ,'Blossom');
insert into Fabricante_MarcaModelo values (2, 2,'Moulinex','Planetaria');
insert into Fabricante_MarcaModelo values (3, 3, 'Yelmo','BB-1103A');

insert into accesorios values (1,'Paleta Amasar', 'Metal');
insert into accesorios values (2,'Batidor', 'Alambre');
insert into accesorios values (3,'Paleta Mezclar', 'Plastico');

insert into Batidoras values (1, 1, 300, 2, 'Plastico', 1000, '2005-09-05' );
insert into Batidoras values (2, 2, 500, 2, 'Metal', 1500, '2007-09-15' );
insert into Batidoras values (3, 3, 700, 2, 'Plastico', 2000, '2010-10-23' );

Insert into Batidoras_accesorios values (1,3);
Insert into Batidoras_accesorios values (2,1);
Insert into Batidoras_accesorios values (3,2);


Select Potencia, Velocidaes, Material from Batidoras;

Select Nombre, Material from Accesorios where id = 2;

Select Marca, Modelo from fabricante_marcamodelo where Modelo Like 'Blossom';

Select * from batidoras_accesorios;

select (Select Nombre from Fabricante F where F.Id = FM.IdFabricante) as Fabricante, Modelo  from Fabricante_MarcaModelo FM where FM.Id = 1;

Select Nombre from fabricante where id = 1;