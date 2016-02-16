create database dbProyectoCoordinacion;

create table tbCarreras(
	IdCarrera int unique identity not null,
	IdReticula int unique,
	Nombre nvarchar(50),
	constraint PK_tbCarreras_IdCarrera primary key (IdCarrera)
);

create table tbRoles(
	IdRol int unique identity not null,
	Tipo nvarchar(30),
	constraint PK_tbRoles_IdRol primary key (IdRol)
);

create table tbUsuarios(
	IdUsuario int unique not null,
	IdCarrera int not null,
	IdRol int not null,
	Nombre nvarchar(50),
	Apellidos nvarchar(50),
	Contraseņa nvarchar(10) not null,
	constraint PK_tbUsuarios_IdUsuario primary key (IdUsuario),
	constraint FK_tbUsuarios_IdCarrera foreign key (IdCarrera)
		references tbCarreras(IdCarrera) on delete cascade on update cascade,
	constraint FK_tbUsuarios_IdRol foreign key (IdRol)
		references tbRoles(IdRol) on delete cascade on update cascade
);

create table tbCitas(
	IdCita int unique identity not null,
	IdCoordinador int not null,
	IdUsuario int,
	FechaAgendada date default getdate(),
	FechaDisponible date,
	Estado int default 0, /*0 disponible, 1 ocupada, 2 expiro, 3 elimino*/
	Comentario nvarchar(MAX) default '',
	constraint PK_tbCitas_IdCita primary key (IdCita)
);