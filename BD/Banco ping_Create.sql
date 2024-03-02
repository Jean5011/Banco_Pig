drop database Bank_the_horrid_pig;
create database Bank_pig;
use Bank_pig;

create table Provincia
(
	Cod_Provincia BIGINT AUTO_INCREMENT  NOT NULL,
    Nombre CHAR(50) NOT NULL,
    CONSTRAINT PK_Provincias PRIMARY KEY (Cod_Provincia)

);
ALTER TABLE Provincia AUTO_INCREMENT = 1;

create table Localidad
(
	Cod_Provincia BIGINT  NOT NULL,
    Cod_Localidad BIGINT AUTO_INCREMENT NOT NULL,
    Nombre CHAR(50) NOT NULL,
    CONSTRAINT PK_Localidad PRIMARY KEY (Cod_Localidad,Cod_Provincia),
    CONSTRAINT FK_ProvinciasXLocalidades FOREIGN KEY (Cod_Provincia) REFERENCES Provincia (Cod_Provincia)
);
ALTER TABLE Localidad AUTO_INCREMENT = 1;

create table Nacionalidades 
(
	Cod_Nacionalidad  BIGINT AUTO_INCREMENT  NOT NULL,
    Nombre CHAR(50) NOT NULL,
    CONSTRAINT PK_Nacionalidades PRIMARY KEY (Cod_Nacionalidad)
);
ALTER TABLE Nacionalidades AUTO_INCREMENT = 001;

 create table Clientes 
 (  
 ID_Cliente BIGINT AUTO_INCREMENT  NOT NULL,
 Dni bigint not null,
 Nombre char(50) not null,
 Apellido char(50) not null,
 Sexo char(20) not null check(Sexo='Masculino' or Sexo='Femenino' or sexo='Indefinido'),
 Nacionalidad char(50) not null,
 fecha_Nacimiento date not null, 
 N_Celular char(50) not null,
 Correo_Electrónico char(70) not null,
 Cantidad_Cuentas int not null,
 Domicilio char(100) not null,
 Cod_Provincia BIGINT not null,
 Cod_Localidad BIGINT not null,
 Monto real not null,  
 Estado_Civil char(20) not null check(Estado_Civil='Casado' or Estado_Civil='Soltero'),
 CONSTRAINT PK_Clientes PRIMARY KEY (ID_Cliente),
 constraint UK_Cliente unique(Dni)
 );
 ALTER TABLE Clientes AUTO_INCREMENT = 1;
 
 create table Usuarios
 (
 ID_Usuario BIGINT AUTO_INCREMENT NOT NULL,
 ID_Cliente BIGINT not null,
 Nombre_Usuario char(50) not null,
 Contrasenia char(50) not null, 
 constraint PK_Usuarios primary key(ID_Usuario),
 constraint FK_UsuariosXClientes 
 foreign key(ID_Cliente) references Clientes(ID_Cliente),
constraint UK_Cliente unique(Nombre_Usuario,Contrasenia)
 );
ALTER TABLE Usuarios AUTO_INCREMENT = 1;
  
 create table Cuentas
 (
 ID_Cliente BIGINT not null,
 N_Cuenta int AUTO_INCREMENT NOT NULL,
 CBU char(100) not null,
 Tipo_Cuenta char(50) not null check(Tipo_Cuenta='Caja de ahorro' or Tipo_Cuenta='Cuenta corriente'),
 Alias char(50) not null,
 Monto real not null,  
 Estado bit not null,
 constraint PK_Cuentas primary key(N_Cuenta,ID_Cliente),
 constraint FK_CuentasXClientes 
 foreign key(ID_Cliente) references Clientes(ID_Cliente),
constraint UK_CBU unique(CBU,Alias)
 );
ALTER TABLE Cuentas AUTO_INCREMENT = 1;

create table Tipos_de_Movimientos
(
Cod_TipoMovimiento bigint AUTO_INCREMENT  NOT NULL,
Nombre char(50) not null,
constraint PK_Cod_TipoMovimiento primary key (Cod_TipoMovimiento)
);

create table Movimientos
(
Cod_Movimiento bigint AUTO_INCREMENT not null,
ID_Cliente BIGINT not null,
N_Cuenta int  NOT NULL,
Cod_TipoMovimiento bigint not null,
Fecha datetime not null,
Monto real not null,
Saldo bit,
constraint PK_Movimientos primary key (Cod_Movimiento),
constraint FK_MovimientosXCuentas foreign key (ID_Cliente,N_Cuenta)
references Cuentas(ID_Cliente,N_Cuenta),
constraint FK_MovimientosXTipos_de_Movimientos foreign key(Cod_TipoMovimiento)
references Tipos_de_Movimientos(Cod_TipoMovimiento)
);
ALTER TABLE Movimientos AUTO_INCREMENT = 1;

create table Remuneraciones 
(
ID_Remuneraciones bigint AUTO_INCREMENT not null,
ID_Cliente bigint not null,
N_Cuenta int not null,
Porcentaje float not null,
Monto real not null,
constraint PK_ID_Remuneraciones primary key(ID_Remuneraciones),
constraint FK_RemuneracionesXCuentas foreign key (ID_Cliente,N_Cuenta)
references Cuentas(ID_Cliente,N_Cuenta)
);
ALTER TABLE Remuneraciones AUTO_INCREMENT = 1;

create table RemuneracionesXMovimientos
(
ID_Remuneraciones bigint not null,
Cod_Movimiento bigint not null,
constraint PK_RemuneracionesXMovimientos primary key (ID_Remuneraciones,Cod_Movimiento),
constraint FK_RemuneracionesXMovimientosXMovimientos foreign key(Cod_Movimiento) 
references Movimientos(Cod_Movimiento), 
constraint FK_RemuneracionesXMovimientosXRemuneraciones foreign key(ID_Remuneraciones) 
references Remuneraciones(ID_Remuneraciones)
);

create table Prestamos
(
ID_Prestamo bigint AUTO_INCREMENT not null,
ID_Cliente bigint not null,
N_Cuenta int not null,
CantidadCuotas int not null,
FechaPedido datetime not null,
FechaRespuestadate datetime not null,
Monto real not null,
Estado char(20) not null check(Estado='Aceptado' or Estado='Pendiente' or Estado='Rechazado'),
constraint PK_Prestamos primary key(ID_Prestamo),
constraint FK_MovimientosXPrestamos foreign key (ID_Cliente,N_Cuenta)
references Cuentas(ID_Cliente,N_Cuenta)
);
ALTER TABLE Prestamos AUTO_INCREMENT = 1;

create table PrestamosXMovimientos
(
ID_Prestamo bigint not null,
Cod_Movimiento bigint not null,
constraint PK_PrestamosXMovimientos primary key(ID_Prestamo,Cod_Movimiento),
constraint FK_PrestamosXMovimientosXPrestamos foreign key (ID_Prestamo)
references Prestamos(ID_Prestamo),
constraint FK_PrestamosXMovimientosXMovimientos foreign key (Cod_Movimiento)
references Movimientos(Cod_Movimiento)
);

create table Cuotas_Pagos
(
ID_Prestamo bigint not null,
Cod_Movimiento bigint not null,
N_Cuota int not null,
Fecha datetime not null,
Monto real,
constraint PK_Cuotas_Pagos primary key (N_Cuota,ID_Prestamo,Cod_Movimiento),
constraint FK_PrestamosXCuotas_Pagos foreign key (ID_Prestamo)
references Prestamos(ID_Prestamo),
constraint FK_MovimientosXCuotas_Pagos foreign key (Cod_Movimiento)
references Movimientos(Cod_Movimiento)
);

 create table tarjeta
 (
 N_Trajeta bigint not null,
 ID_Cliente bigint not null,
 Tipo_tajeta char(20) not null check(Tipo_tajeta='Credito' or Tipo_tajeta='Devito'),
 Marca char(20) not null check(Marca='Visa' or Marca='Mastercard'),
 Fecha_Inspiracion date not null,
 Codigo_Seguridad int not null,
 constraint PK_tarjeta primary key(N_Trajeta),
 constraint FK_tarjetaXClientes 
 foreign key(ID_Cliente) references Clientes(ID_Cliente)
 );
 
 create table TarjetaXMovimientos
 (
 N_Trajeta bigint not null,
 Cod_Movimiento bigint not null,
 constraint PK_TarjetaXMovimientos primary key (N_Trajeta,Cod_Movimiento),
 constraint FK_TarjetaXMovimientosXtarjeta foreign  key (N_Trajeta)
 references tarjeta(N_Trajeta),
 constraint FK_TarjetaXMovimientosXMovimientos foreign key (Cod_Movimiento)
 references Movimientos(Cod_Movimiento)
 );
 
 create table Transferencias
 (
ID_Cliente bigint not null,
N_Cuenta int not null,
N_Transferencia bigint AUTO_INCREMENT not null,
Monto real not null,
Fecha datetime,
ID_Cliente_Recidente int not null,
N_Cuenta_Recidente int not null,
constraint PK_Transferencias primary key (N_Transferencia,ID_Cliente,N_Cuenta),
constraint FK_TransferenciasXCuentas foreign key (ID_Cliente,N_Cuenta)
references Cuentas(ID_Cliente,N_Cuenta)
 );
 ALTER TABLE Transferencias AUTO_INCREMENT = 1;
 
 create table TransferenciasXMovimientos
 (
ID_Cliente bigint not null,
N_Cuenta int not null,
N_Transferencia bigint not null,
Cod_Movimiento bigint not null,
constraint PK_TransferenciasXMovimientos primary key (ID_Cliente,N_Cuenta,N_Transferencia,Cod_Movimiento),
constraint FK_TransferenciasXMovimientosXTransferencias foreign key (ID_Cliente,N_Cuenta,N_Transferencia)
references Transferencias(ID_Cliente,N_Cuenta,N_Transferencia),
constraint FK_TransferenciasXMovimientosXMovimientos foreign key (Cod_Movimiento)
references Movimientos(Cod_Movimiento)
 );