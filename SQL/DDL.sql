-- Creación de tablas
--Eliminación de esquema
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

--Seccion emprendedor
DROP TABLE IF EXISTS emprendedor;
CREATE TABLE IF NOT EXISTS emprendedor(
    rfc CHAR(13),
    nombreNegocio VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    nombre VARCHAR(50),
    genero CHAR(1),
    nacimiento DATE,
    calle VARCHAR(50),
    numInterior int, 
    numExterior int, 
    colonia VARCHAR(50),
    estado VARCHAR(50)
);

    COMMENT ON TABLE emprendedor IS 'Tabla que almacena los datos personales de los emprendedores';
    COMMENT ON COLUMN emprendedor.rfc IS 'RFC del emprendedor';
    COMMENT ON COLUMN emprendedor.nombreNegocio IS 'Nombre del negocio del emprendedor';
    COMMENT ON COLUMN emprendedor.apellidoPaterno IS 'Apellido paterno del emprendedor';
    COMMENT ON COLUMN emprendedor.apellidoMaterno IS 'Apellido materno del emprendedor';
    COMMENT ON COLUMN emprendedor.nombre IS 'Nombre del emprendedor';
    COMMENT ON COLUMN emprendedor.genero IS 'Género del emprendedor';
    COMMENT ON COLUMN emprendedor.nacimiento IS 'Fecha de nacimiento del emprendedor';
    COMMENT ON COLUMN emprendedor.calle IS 'Calle del domicilio del emprendedor'; 
    COMMENT ON COLUMN emprendedor.numInterior IS 'Número interior del domicilio del emprendedor'; 
    COMMENT ON COLUMN emprendedor.numExterior IS 'Número exterior del domicilio del emprendedor'; 
    COMMENT ON COLUMN emprendedor.colonia IS 'Colonia del domicilio del emprendedor'; 
    COMMENT ON COLUMN emprendedor.estado IS 'Estado del domicilio del emprendedor'; 


DROP TABLE IF EXISTS telefonoEmprendedor;
CREATE TABLE IF NOT EXISTS telefonoEmprendedor(
    rfc CHAR(13),
    telefono VARCHAR(10)
);

    COMMENT ON TABLE telefonoEmprendedor IS 'Tabla que almacena los teléfonos de los emprendedores';
    COMMENT ON COLUMN telefonoEmprendedor.rfc IS 'RFC del emprendedor';
    COMMENT ON COLUMN telefonoEmprendedor.telefono IS 'Teléfono del emprendedor';

DROP TABLE IF EXISTS correoEmprendedor;
CREATE TABLE IF NOT EXISTS correoEmprendedor(
    rfc CHAR(13),
    correo VARCHAR(50)
);

    COMMENT ON TABLE correoEmprendedor IS 'Tabla que almacena los correos de los emprendedores';
    COMMENT ON COLUMN correoEmprendedor.rfc IS 'RFC del emprendedor';
    COMMENT ON COLUMN correoEmprendedor.correo IS 'Correo del emprendedor';

--Seccion personal
DROP TABLE IF EXISTS personalLimpieza;
CREATE TABLE IF NOT EXISTS personalLimpieza(
    rfc CHAR(13),
    nombre VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    calle VARCHAR(50),
    numInterior int, 
    numExterior int, 
    colonia VARCHAR(50),
    estado VARCHAR(50),
    horaInicio TIME,
    horaFinal TIME,
    fechaAsistencia DATE,
    salario MONEY
);

    COMMENT ON TABLE personalLimpieza IS 'Tabla que almacena los datos personales del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.rfc IS 'RFC del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.nombre IS 'Nombre del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.apellidoPaterno IS 'Apellido paterno del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.apellidoMaterno IS 'Apellido materno del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.calle IS 'Calle del domicilio del personal de limpieza'; 
    COMMENT ON COLUMN personalLimpieza.numInterior IS 'Número interior del domicilio del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.numExterior IS 'Número exterior del domicilio del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.colonia IS 'Colonia del domicilio del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.estado IS 'Estado del domicilio del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.horaInicio IS 'Hora de inicio de la jornada laboral del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.horaFinal IS 'Hora de fin de la jornada laboral del personal de limpieza';
    COMMENT ON COLUMN personalLimpieza.fechaAsistencia IS 'Fecha de asistencia del personal de limpieza'; 
    COMMENT ON COLUMN personalLimpieza.salario IS 'Salario del personal de limpieza';

DROP TABLE IF EXISTS telefonoPersonalLimpieza;
CREATE TABLE IF NOT EXISTS telefonoPersonalLimpieza(
    rfc CHAR(13),
    telefono VARCHAR(10)
);

    COMMENT ON TABLE telefonoPersonalLimpieza IS 'Tabla que almacena los teléfonos del personal de limpieza';
    COMMENT ON COLUMN telefonoPersonalLimpieza.rfc IS 'RFC del personal de limpieza';
    COMMENT ON COLUMN telefonoPersonalLimpieza.telefono IS 'Teléfono del personal de limpieza';

DROP TABLE IF EXISTS correoPersonalLimpieza;
CREATE TABLE IF NOT EXISTS correoPersonalLimpieza(
    rfc CHAR(13),
    correo VARCHAR(50)
);

    COMMENT ON TABLE correoPersonalLimpieza IS 'Tabla que almacena los correos del personal de limpieza';
    COMMENT ON COLUMN correoPersonalLimpieza.rfc IS 'RFC del personal de limpieza';
    COMMENT ON COLUMN correoPersonalLimpieza.correo IS 'Correo del personal de limpieza';

DROP TABLE IF EXISTS personalSeguridad;
CREATE TABLE IF NOT EXISTS personalSeguridad(
    rfc CHAR(13),
    nombre VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    calle VARCHAR(50),
    numInterior int, 
    numExterior int,
    colonia VARCHAR(50),
    estado VARCHAR(50),
    horaInicio TIME,
    horaFinal TIME,
    fechaAsistencia DATE,
    salario MONEY
);

    COMMENT ON TABLE personalSeguridad IS 'Tabla que almacena los datos personales del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.rfc IS 'RFC del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.nombre IS 'Nombre del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.apellidoPaterno IS 'Apellido paterno del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.apellidoMaterno IS 'Apellido materno del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.calle IS 'Calle del domicilio del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.numInterior IS 'Numero interior del domicilio del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.numExterior IS 'Numero exterior del domicilio del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.colonia IS 'Colonia del domicilio del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.estado IS 'Estado del domicilio del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.horaInicio IS 'Hora de inicio de la jornada laboral del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.horaFinal IS 'Hora de fin de la jornada laboral del personal de seguridad';
    COMMENT ON COLUMN personalSeguridad.fechaAsistencia IS 'Fecha de asistencia del personal de seguridad'; 
    COMMENT ON COLUMN personalSeguridad.salario IS 'Salario del personal de seguridad';

DROP TABLE IF EXISTS telefonoPersonalSeguridad;
CREATE TABLE IF NOT EXISTS telefonoPersonalSeguridad(
    rfc CHAR(13),
    telefono VARCHAR(10)
);

    COMMENT ON TABLE telefonoPersonalSeguridad IS 'Tabla que almacena los telefonos del personal de seguridad';
    COMMENT ON COLUMN telefonoPersonalSeguridad.rfc IS 'RFC del personal de seguridad';
    COMMENT ON COLUMN telefonoPersonalSeguridad.telefono IS 'Telefono del personal de seguridad';

DROP TABLE IF EXISTS correoPersonalSeguridad;
CREATE TABLE IF NOT EXISTS correoPersonalSeguridad(
    rfc CHAR(13),
    correo VARCHAR(50)
);

    COMMENT ON TABLE correoPersonalSeguridad IS 'Tabla que almacena los correos del personal de seguridad';
    COMMENT ON COLUMN correoPersonalSeguridad.rfc IS 'RFC del personal de seguridad';
    COMMENT ON COLUMN correoPersonalSeguridad.correo IS 'Correo del personal de seguridad';

DROP TABLE IF EXISTS personalMedico;
CREATE TABLE IF NOT EXISTS personalMedico(
    rfc CHAR(13),
    nombre VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    calle VARCHAR(50),
    numInterior int, 
    numExterior int, 
    colonia VARCHAR(50),
    estado VARCHAR(50),
    horaInicio TIME,
    horaFinal TIME,
    fechaAsistencia DATE,
    salario MONEY
);

    COMMENT ON TABLE personalMedico IS 'Tabla que almacena los datos personales del personal medico';
    COMMENT ON COLUMN personalMedico.rfc IS 'RFC del personal medico';
    COMMENT ON COLUMN personalMedico.nombre IS 'Nombre del personal medico';
    COMMENT ON COLUMN personalMedico.apellidoPaterno IS 'Apellido paterno del personal medico';
    COMMENT ON COLUMN personalMedico.apellidoMaterno IS 'Apellido materno del personal medico';
    COMMENT ON COLUMN personalMedico.calle IS 'Calle del domicilio del personal medico';
    COMMENT ON COLUMN personalMedico.numInterior IS 'Numero interior del domicilio del personal medico';
    COMMENT ON COLUMN personalMedico.numExterior IS 'Numero exterior del domicilio del personal medico';
    COMMENT ON COLUMN personalMedico.colonia IS 'Colonia del domicilio del personal medico';
    COMMENT ON COLUMN personalMedico.estado IS 'Estado del domicilio del personal medico';
    COMMENT ON COLUMN personalMedico.horaInicio IS 'Hora de inicio de la jornada laboral del personal médico';
    COMMENT ON COLUMN personalMedico.horaFinal IS 'Hora de fin de la jornada laboral del personal medico';
    COMMENT ON COLUMN personalMedico.fechaAsistencia IS 'Fecha de asistencia del personal medico'; 
    COMMENT ON COLUMN personalMedico.salario IS 'Salario del personal medico';

DROP TABLE IF EXISTS telefonoPersonalMedico;
CREATE TABLE IF NOT EXISTS telefonoPersonalMedico(
    rfc CHAR(13),
    telefono VARCHAR(10)
);

    COMMENT ON TABLE telefonoPersonalMedico IS 'Tabla que almacena los telefonos del personal medico';
    COMMENT ON COLUMN telefonoPersonalMedico.rfc IS 'RFC del personal medico';
    COMMENT ON COLUMN telefonoPersonalMedico.telefono IS 'Telefono del personal medico';

DROP TABLE IF EXISTS correoPersonalMedico;
CREATE TABLE IF NOT EXISTS correoPersonalMedico(
    rfc CHAR(13),
    correo VARCHAR(50)
);

    COMMENT ON TABLE correoPersonalMedico IS 'Tabla que almacena los correos del personal medico';
    COMMENT ON COLUMN correoPersonalMedico.rfc IS 'RFC del personal medico';
    COMMENT ON COLUMN correoPersonalMedico.correo IS 'Correo del personal medico';

--Seccion cliente
DROP TABLE IF EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente(
    idCliente int,
    esClienteFisico boolean,
    esClienteLinea boolean,
    nombre VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    metodoPago VARCHAR(8),
    calle VARCHAR(50),
    numExterior int, 
    numInterior int, 
    colonia VARCHAR(50),
    estado VARCHAR(50),
    numTarjeta VARCHAR(16), 
    vencimiento DATE,
    cvv CHAR(3) 
);

    COMMENT ON TABLE cliente IS 'Tabla que almacena los datos personales de los clientes';
    COMMENT ON COLUMN cliente.idCliente IS 'ID del cliente';
    COMMENT ON COLUMN cliente.esClienteFisico IS 'Indica si el cliente es fisico o no';
    COMMENT ON COLUMN cliente.esClienteLinea IS 'Indica si el cliente es de linea o no';
    COMMENT ON COLUMN cliente.nombre IS 'Nombre del cliente';
    COMMENT ON COLUMN cliente.apellidoPaterno IS 'Apellido paterno del cliente';
    COMMENT ON COLUMN cliente.apellidoMaterno IS 'Apellido materno del cliente';
    COMMENT ON COLUMN cliente.metodoPago IS 'Metodo de pago del cliente';
    COMMENT ON COLUMN cliente.calle IS 'Calle del domicilio del cliente';
    COMMENT ON COLUMN cliente.numExterior IS 'Numero exterior del domicilio del cliente';
    COMMENT ON COLUMN cliente.numInterior IS 'Numero interior del domicilio del cliente';
    COMMENT ON COLUMN cliente.colonia IS 'Colonia del domicilio del cliente';
    COMMENT ON COLUMN cliente.estado IS 'Estado del domicilio del cliente';
    COMMENT ON COLUMN cliente.numTarjeta IS 'Numero de tarjeta de pago del cliente';
    COMMENT ON COLUMN cliente.vencimiento IS 'Fecha de vencimiento de la tarjeta de pago del cliente';
    COMMENT ON COLUMN cliente.cvv IS 'CVV de la tarjeta de pago del cliente';

--Seccion negocio
DROP TABLE IF EXISTS negocio;
CREATE TABLE IF NOT EXISTS negocio(
    nombreNegocio VARCHAR(50),
    precioMasBajo MONEY,
    precioMasAlto MONEY,
    descripcion VARCHAR(100)
);

    COMMENT ON TABLE negocio IS 'Tabla que almacena los datos de los negocios';
    COMMENT ON COLUMN negocio.nombreNegocio IS 'Nombre del negocio';
    COMMENT ON COLUMN negocio.precioMasBajo IS 'Precio mas bajo del negocio';
    COMMENT ON COLUMN negocio.precioMasAlto IS 'Precio mas alto del negocio';
    COMMENT ON COLUMN negocio.descripcion IS 'Descripcion del negocio';

DROP TABLE IF EXISTS telefonoNegocio;
CREATE TABLE IF NOT EXISTS telefonoNegocio(
    nombreNegocio VARCHAR(50),
    telefono VARCHAR(10)
);

    COMMENT ON TABLE telefonoNegocio IS 'Tabla que almacena los telefonos de los negocios';
    COMMENT ON COLUMN telefonoNegocio.nombreNegocio IS 'Nombre del negocio';
    COMMENT ON COLUMN telefonoNegocio.telefono IS 'Telefono del negocio';

DROP TABLE IF EXISTS correoNegocio;
CREATE TABLE IF NOT EXISTS correoNegocio(
    nombreNegocio VARCHAR(50),
    correo VARCHAR(50)
);

    COMMENT ON TABLE correoNegocio IS 'Tabla que almacena los correos de los negocios';
    COMMENT ON COLUMN correoNegocio.nombreNegocio IS 'Nombre del negocio';
    COMMENT ON COLUMN correoNegocio.correo IS 'Correo del negocio';

DROP TABLE IF EXISTS redSocialNegocio;
CREATE TABLE IF NOT EXISTS redSocialNegocio(
    nombreNegocio VARCHAR(50),
    redSocial VARCHAR(50)
);

    COMMENT ON TABLE redSocialNegocio IS 'Tabla que almacena las redes sociales de los negocios';
    COMMENT ON COLUMN redSocialNegocio.nombreNegocio IS 'Nombre del negocio';
    COMMENT ON COLUMN redSocialNegocio.redSocial IS 'Red social del negocio';

--Seccion bazar
DROP TABLE IF EXISTS bazar;
CREATE TABLE IF NOT EXISTS bazar(
    idBazar int,
    fechaInicio DATE,
    fechaFin DATE,
    calle VARCHAR(50),
    numInterior int, 
    numExterior int, 
    colonia VARCHAR(50),
    estado VARCHAR(50)
);

    COMMENT ON TABLE bazar IS 'Tabla que almacena los datos de los bazares';
    COMMENT ON COLUMN bazar.idBazar IS 'ID del bazar';
    COMMENT ON COLUMN bazar.fechaInicio IS 'Fecha de inicio del bazar';
    COMMENT ON COLUMN bazar.fechaFin IS 'Fecha de fin del bazar';
    COMMENT ON COLUMN bazar.calle IS 'Calle del bazar';
    COMMENT ON COLUMN bazar.numInterior IS 'Numero interior del bazar'; 
    COMMENT ON COLUMN bazar.numExterior IS 'Numero exterior del bazar';
    COMMENT ON COLUMN bazar.colonia IS 'Colonia del bazar';
    COMMENT ON COLUMN bazar.estado IS 'Estado del bazar';


DROP TABLE IF EXISTS amenidades;
CREATE TABLE IF NOT EXISTS amenidades(
    idBazar int,
    amenidad VARCHAR(50)
);

    COMMENT ON TABLE amenidades IS 'Tabla que almacena las amenidades de los bazares';
    COMMENT ON COLUMN amenidades.idBazar IS 'ID del bazar';
    COMMENT ON COLUMN amenidades.amenidad IS 'Amenidad del bazar';

--Seccion agenda
DROP TABLE IF EXISTS agenda;
CREATE TABLE IF NOT EXISTS agenda(
    idAgenda int,
    idBazar int,
    fecha DATE
);

    COMMENT ON TABLE agenda IS 'Tabla que almacena la agenda de los bazares';
    COMMENT ON COLUMN agenda.idAgenda IS 'ID de la agenda';
    COMMENT ON COLUMN agenda.idBazar IS 'ID del bazar';
    COMMENT ON COLUMN agenda.fecha IS 'Fecha de la agenda';

--Seccion estand
DROP TABLE IF EXISTS estand;
CREATE TABLE IF NOT EXISTS estand(
    numeroEstand int,
    nombreNegocio VARCHAR(50),
    esEmprendedor boolean,
    esPremium boolean,
    esBasico boolean
);

    COMMENT ON TABLE estand IS 'Tabla que almacena los datos de los estands';
    COMMENT ON COLUMN estand.numeroEstand IS 'Numero del estand';
    COMMENT ON COLUMN estand.nombreNegocio IS 'Nombre del negocio del estand';
    COMMENT ON COLUMN estand.esEmprendedor IS 'Indica si el estand es de un emprendedor o no';
    COMMENT ON COLUMN estand.esPremium IS 'Indica si el estand es premium o no';
    COMMENT ON COLUMN estand.esBasico IS 'Indica si el estand es basico o no';

--Seccion mercancias
DROP TABLE IF EXISTS mercanciaServicio;
CREATE TABLE IF NOT EXISTS mercanciaServicio(
    nombre VARCHAR(50),
    tipo VARCHAR(50),
    precio MONEY,
    descripcion VARCHAR(100),
    duracion TIME
);

    COMMENT ON TABLE mercanciaServicio IS 'Tabla que almacena los datos de los servicios';
    COMMENT ON COLUMN mercanciaServicio.nombre IS 'Nombre del servicio';
    COMMENT ON COLUMN mercanciaServicio.tipo IS 'Tipo de servicio';
    COMMENT ON COLUMN mercanciaServicio.precio IS 'Precio del servicio';
    COMMENT ON COLUMN mercanciaServicio.descripcion IS 'Descripcion del servicio';
    COMMENT ON COLUMN mercanciaServicio.duracion IS 'Duracion del servicio';

DROP TABLE IF EXISTS mercanciaProductoPerecedero;
CREATE TABLE IF NOT EXISTS mercanciaProductoPerecedero(
    nombre VARCHAR(50),
    tipo VARCHAR(50),
    precio MONEY,
    descripcion VARCHAR(100),
    presentacion VARCHAR(50),
    cantidadInicial int,
    fechaPreparacion DATE,
    fechaCaducidad DATE
);

    COMMENT ON TABLE mercanciaProductoPerecedero IS 'Tabla que almacena los datos de los productos perecederos';
    COMMENT ON COLUMN mercanciaProductoPerecedero.nombre IS 'Nombre del producto perecedero';
    COMMENT ON COLUMN mercanciaProductoPerecedero.tipo IS 'Tipo de producto perecedero';
    COMMENT ON COLUMN mercanciaProductoPerecedero.precio IS 'Precio del producto perecedero';
    COMMENT ON COLUMN mercanciaProductoPerecedero.descripcion IS 'Descripcion del producto perecedero';
    COMMENT ON COLUMN mercanciaProductoPerecedero.presentacion IS 'Presentacion del producto perecedero';
    COMMENT ON COLUMN mercanciaProductoPerecedero.cantidadInicial IS 'Cantidad inicial del producto perecedero';
    COMMENT ON COLUMN mercanciaProductoPerecedero.fechaPreparacion IS 'Fecha de preparacion del producto perecedero';
    COMMENT ON COLUMN mercanciaProductoPerecedero.fechaCaducidad IS 'Fecha de caducidad del producto perecedero';

DROP TABLE IF EXISTS mercanciaProductoNoPerecedero;
CREATE TABLE IF NOT EXISTS mercanciaProductoNoPerecedero(
    nombre VARCHAR(50),
    tipo VARCHAR(50),
    precio MONEY,
    descripcion VARCHAR(100),
    presentacion VARCHAR(50),
    cantidadInicial int
);

    COMMENT ON TABLE mercanciaProductoNoPerecedero IS 'Tabla que almacena los datos de los productos no perecederos';
    COMMENT ON COLUMN mercanciaProductoNoPerecedero.nombre IS 'Nombre del producto no perecedero';
    COMMENT ON COLUMN mercanciaProductoNoPerecedero.tipo IS 'Tipo de producto no perecedero';
    COMMENT ON COLUMN mercanciaProductoNoPerecedero.precio IS 'Precio del producto no perecedero';
    COMMENT ON COLUMN mercanciaProductoNoPerecedero.descripcion IS 'Descripcion del producto no perecedero';
    COMMENT ON COLUMN mercanciaProductoNoPerecedero.presentacion IS 'Presentacion del producto no perecedero';
    COMMENT ON COLUMN mercanciaProductoNoPerecedero.cantidadInicial IS 'Cantidad inicial del producto no perecedero';

-- Seccion ticket
DROP TABLE IF EXISTS ticket;
CREATE TABLE IF NOT EXISTS ticket(
    idTicket int,
    idCliente int,
    rfc CHAR(13)
);

    COMMENT ON TABLE ticket IS 'Tabla que almacena los datos de los tickets';
    COMMENT ON COLUMN ticket.idTicket IS 'ID del ticket';
    COMMENT ON COLUMN ticket.idCliente IS 'ID del cliente del ticket';
    COMMENT ON COLUMN ticket.rfc IS 'RFC del emprendedor del ticket (del que cobra)';


-- Relaciones
DROP TABLE IF EXISTS asistir;
CREATE TABLE IF NOT EXISTS asistir(
    idBazar int,
    idCliente int
);

    COMMENT ON TABLE asistir IS 'Tabla que almacena los datos de los asistentes a los bazares';
    COMMENT ON COLUMN asistir.idBazar IS 'ID del bazar al que asiste el cliente';
    COMMENT ON COLUMN asistir.idCliente IS 'ID del cliente que asiste al bazar';

DROP TABLE IF EXISTS trabajarSeguridad;
CREATE TABLE IF NOT EXISTS trabajarSeguridad(
    idBazar int,
    rfc CHAR(13)
);

    COMMENT ON TABLE trabajarSeguridad IS 'Tabla que almacena los datos del personal de seguridad que trabaja en los bazares';
    COMMENT ON COLUMN trabajarSeguridad.idBazar IS 'ID del bazar en el que trabaja el personal de seguridad';
    COMMENT ON COLUMN trabajarSeguridad.rfc IS 'RFC del personal de seguridad que trabaja en el bazar';

DROP TABLE IF EXISTS trabajarMedico;
CREATE TABLE IF NOT EXISTS trabajarMedico(
    idBazar int,
    rfc CHAR(13)
);

    COMMENT ON TABLE trabajarMedico IS 'Tabla que almacena los datos del personal medico que trabaja en los bazares';
    COMMENT ON COLUMN trabajarMedico.idBazar IS 'ID del bazar en el que trabaja el personal medico';
    COMMENT ON COLUMN trabajarMedico.rfc IS 'RFC del personal medico que trabaja en el bazar';

DROP TABLE IF EXISTS trabajarLimpieza;
CREATE TABLE IF NOT EXISTS trabajarLimpieza(
    idBazar int,
    rfc CHAR(13)
);

    COMMENT ON TABLE trabajarLimpieza IS 'Tabla que almacena los datos del personal de limpieza que trabaja en los bazares';
    COMMENT ON COLUMN trabajarLimpieza.idBazar IS 'ID del bazar en el que trabaja el personal de limpieza';
    COMMENT ON COLUMN trabajarLimpieza.rfc IS 'RFC del personal de limpieza que trabaja en el bazar';

DROP TABLE IF EXISTS tenerNegocio;
CREATE TABLE IF NOT EXISTS tenerNegocio(
    idBazar int,
    nombreNegocio VARCHAR(50)
);

    COMMENT ON TABLE tenerNegocio IS 'Tabla que almacena los datos de los negocios que tienen estand en los bazares';
    COMMENT ON COLUMN tenerNegocio.idBazar IS 'ID del bazar en el que tiene estand el negocio';
    COMMENT ON COLUMN tenerNegocio.nombreNegocio IS 'Nombre del negocio que tiene estand en el bazar';

DROP TABLE IF EXISTS guardarEstand;
CREATE TABLE IF NOT EXISTS guardarEstand(
    idAgenda int,
    idBazar int,
    numeroEstand int
);

    COMMENT ON TABLE guardarEstand IS 'Tabla que almacena los datos de los estands que se guardan en la agenda';
    COMMENT ON COLUMN guardarEstand.idAgenda IS 'ID de la agenda en la que se guarda el estand';
    COMMENT ON COLUMN guardarEstand.idBazar IS 'ID del bazar en el que se guarda el estand';
    COMMENT ON COLUMN guardarEstand.numeroEstand IS 'Numero del estand que se guarda en la agenda';

DROP TABLE IF EXISTS proporcionarServicio;
CREATE TABLE IF NOT EXISTS proporcionarServicio(
    nombreNegocio VARCHAR(50),
    nombre VARCHAR(50),
    tipo VARCHAR(50)
);

    COMMENT ON TABLE proporcionarServicio IS 'Tabla que almacena los datos de los servicios que proporcionan los negocios';
    COMMENT ON COLUMN proporcionarServicio.nombreNegocio IS 'Nombre del negocio que proporciona el servicio';
    COMMENT ON COLUMN proporcionarServicio.nombre IS 'Nombre del servicio que proporciona el negocio';
    COMMENT ON COLUMN proporcionarServicio.tipo IS 'Tipo del servicio que proporciona el negocio';

DROP TABLE IF EXISTS proporcionarProductoPerecedero;
CREATE TABLE IF NOT EXISTS proporcionarProductoPerecedero(
    nombreNegocio VARCHAR(50),
    nombre VARCHAR(50),
    tipo VARCHAR(50)
);

    COMMENT ON TABLE proporcionarProductoPerecedero IS 'Tabla que almacena los datos de los productos perecederos que proporcionan los negocios';
    COMMENT ON COLUMN proporcionarProductoPerecedero.nombreNegocio IS 'Nombre del negocio que proporciona el producto perecedero';
    COMMENT ON COLUMN proporcionarProductoPerecedero.nombre IS 'Nombre del producto perecedero que proporciona el negocio';
    COMMENT ON COLUMN proporcionarProductoPerecedero.tipo IS 'Tipo del producto perecedero que proporciona el negocio';

DROP TABLE IF EXISTS proporcionarProductoNoPerecedero;
CREATE TABLE IF NOT EXISTS proporcionarProductoNoPerecedero(
    nombreNegocio VARCHAR(50),
    nombre VARCHAR(50),
    tipo VARCHAR(50)
);

    COMMENT ON TABLE proporcionarProductoNoPerecedero IS 'Tabla que almacena los datos de los productos no perecederos que proporcionan los negocios';
    COMMENT ON COLUMN proporcionarProductoNoPerecedero.nombreNegocio IS 'Nombre del negocio que proporciona el producto no perecedero';
    COMMENT ON COLUMN proporcionarProductoNoPerecedero.nombre IS 'Nombre del producto no perecedero que proporciona el negocio';
    COMMENT ON COLUMN proporcionarProductoNoPerecedero.tipo IS 'Tipo del producto no perecedero que proporciona el negocio';

DROP TABLE IF EXISTS registrarCompraServicio;
CREATE TABLE IF NOT EXISTS registrarCompraServicio(
    idTicket int,
    nombre VARCHAR(50),
    tipo VARCHAR(50)
);

    COMMENT ON TABLE registrarCompraServicio IS 'Tabla que almacena los datos de los servicios que compran los clientes';
    COMMENT ON COLUMN registrarCompraServicio.idTicket IS 'ID del ticket de la compra del servicio';
    COMMENT ON COLUMN registrarCompraServicio.nombre IS 'Nombre del servicio que compra el cliente';
    COMMENT ON COLUMN registrarCompraServicio.tipo IS 'Tipo del servicio que compra el cliente';

DROP TABLE IF EXISTS registrarCompraNoPerecedero;
CREATE TABLE IF NOT EXISTS registrarCompraNoPerecedero(
    idTicket int,
    nombre VARCHAR(50),
    tipo VARCHAR(50),
    cantidadComprada int
);

    COMMENT ON TABLE registrarCompraNoPerecedero IS 'Tabla que almacena los datos de los productos no perecederos que compran los clientes';
    COMMENT ON COLUMN registrarCompraNoPerecedero.idTicket IS 'ID del ticket de la compra del producto no perecedero';
    COMMENT ON COLUMN registrarCompraNoPerecedero.nombre IS 'Nombre del producto no perecedero que compra el cliente';
    COMMENT ON COLUMN registrarCompraNoPerecedero.tipo IS 'Tipo del producto no perecedero que compra el cliente';
    COMMENT ON COLUMN registrarCompraNoPerecedero.cantidadComprada IS 'Cantidad comprada del producto no perecedero por el cliente'; 

DROP TABLE IF EXISTS registrarCompraPerecedero;
CREATE TABLE IF NOT EXISTS registrarCompraPerecedero(
    idTicket int,
    nombre VARCHAR(50),
    tipo VARCHAR(50),
    cantidadComprada int
);
    COMMENT ON TABLE registrarCompraPerecedero IS 'Tabla que almacena los datos de los productos perecederos que compran los clientes';
    COMMENT ON COLUMN registrarCompraPerecedero.idTicket IS 'ID del ticket de la compra del producto perecedero';
    COMMENT ON COLUMN registrarCompraPerecedero.nombre IS 'Nombre del producto perecedero que compra el cliente';
    COMMENT ON COLUMN registrarCompraPerecedero.tipo IS 'Tipo del producto perecedero que compra el cliente';
    COMMENT ON COLUMN registrarCompraPerecedero.cantidadComprada IS 'Cantidad comprada del producto perecedero por el cliente';

-- Restricciones de entidad 

    -- entidades llave primaria
ALTER TABLE emprendedor ADD CONSTRAINT emprendedor_pk PRIMARY KEY(rfc);
    COMMENT ON CONSTRAINT emprendedor_pk ON emprendedor IS 'Restriccion de entidad para la tabla emprendedor'; 

ALTER TABLE negocio ADD CONSTRAINT negocio_pk PRIMARY KEY(nombreNegocio);
    COMMENT ON CONSTRAINT negocio_pk ON negocio IS 'Restriccion de entidad para la tabla negocio'; 

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY(idCliente);
    COMMENT ON CONSTRAINT cliente_pk ON cliente IS 'Restriccion de entidad para la tabla cliente';

ALTER TABLE personalSeguridad ADD CONSTRAINT personalSeguridad_pk PRIMARY KEY(rfc);
    COMMENT ON CONSTRAINT personalSeguridad_pk ON personalSeguridad IS 'Restriccion de entidad para la tabla personalSeguridad';

ALTER TABLE personalLimpieza ADD CONSTRAINT personalLimpieza_pk PRIMARY KEY(rfc);
    COMMENT ON CONSTRAINT personalLimpieza_pk ON personalLimpieza IS 'Restriccion de entidad para la tabla personalLimpieza';

ALTER TABLE personalMedico ADD CONSTRAINT personalMedico_pk PRIMARY KEY(rfc);
    COMMENT ON CONSTRAINT personalMedico_pk ON personalMedico IS 'Restriccion de entidad para la tabla personalMedico';

    -- Entidades llave primaria compuesta
ALTER TABLE estand ADD CONSTRAINT estand_pk PRIMARY KEY(numeroEstand);
    COMMENT ON CONSTRAINT estand_pk ON estand IS 'Restriccion de entidad para la tabla estand'; 

ALTER TABLE bazar ADD CONSTRAINT bazar_pk PRIMARY KEY(idBazar);
    COMMENT ON CONSTRAINT bazar_pk ON bazar IS 'Restriccion de entidad para la tabla bazar'; 

ALTER TABLE ticket ADD CONSTRAINT ticket_pk PRIMARY KEY(idTicket);
    COMMENT ON CONSTRAINT ticket_pk ON ticket IS 'Restriccion de entidad para la tabla ticket'; 

    -- Doble llave primaria entidad
ALTER TABLE mercanciaServicio
    ADD CONSTRAINT mercanciaServicio_pk PRIMARY KEY(nombre, tipo);
    COMMENT ON CONSTRAINT mercanciaServicio_pk ON mercanciaServicio IS 'Restriccion de entidad para la tabla mercanciaServicio'; 

ALTER TABLE mercanciaProductoPerecedero 
    ADD CONSTRAINT mercanciaProductoPerecedero_pk PRIMARY KEY(nombre, tipo);
    COMMENT ON CONSTRAINT mercanciaProductoPerecedero_pk ON mercanciaProductoPerecedero IS 'Restriccion de entidad para la tabla mercanciaProductoPerecedero';

ALTER TABLE mercanciaProductoNoPerecedero 
    ADD CONSTRAINT mercanciaProductoNoPerecedero_pk PRIMARY KEY(nombre, tipo);
    COMMENT ON CONSTRAINT mercanciaProductoNoPerecedero_pk ON mercanciaProductoNoPerecedero IS 'Restriccion de entidad para la tabla mercanciaProductoNoPerecedero'; 

ALTER TABLE agenda 
    ADD CONSTRAINT agenda_pk PRIMARY KEY(idAgenda, idBazar);
    COMMENT ON CONSTRAINT agenda_pk ON agenda IS 'Restriccion de entidad para la tabla agenda'; 

    -- Multivaluados/otros
ALTER TABLE telefonoEmprendedor 
    ADD CONSTRAINT telefonoEmprendedor_pk PRIMARY KEY(rfc, telefono);
    COMMENT ON CONSTRAINT telefonoEmprendedor_pk ON telefonoEmprendedor IS 'Restriccion de entidad para la tabla telefonoEmprendedor'; 
ALTER TABLE correoEmprendedor 
    ADD CONSTRAINT correoEmprendedor_pk PRIMARY KEY(rfc, correo);
    COMMENT ON CONSTRAINT correoEmprendedor_pk ON correoEmprendedor IS 'Restriccion de entidad para la tabla correoEmprendedor'; 

ALTER TABLE telefonoNegocio 
    ADD CONSTRAINT telefonoNegocio_pk PRIMARY KEY(nombreNegocio, telefono);
    COMMENT ON CONSTRAINT telefonoNegocio_pk ON telefonoNegocio IS 'Restriccion de entidad para la tabla telefonoNegocio'; 
ALTER TABLE correoNegocio 
    ADD CONSTRAINT correoNegocio_pk PRIMARY KEY(nombreNegocio, correo);
    COMMENT ON CONSTRAINT correoNegocio_pk ON correoNegocio IS 'Restriccion de entidad para la tabla correoNegocio'; 
ALTER TABLE redSocialNegocio 
    ADD CONSTRAINT redSocialNegocio_pk PRIMARY KEY(nombreNegocio, redSocial);
    COMMENT ON CONSTRAINT redSocialNegocio_pk ON redSocialNegocio IS 'Restriccion de entidad para la tabla redSocialNegocio'; 

ALTER TABLE telefonoPersonalLimpieza 
    ADD CONSTRAINT telefonoPersonalLimpieza_pk PRIMARY KEY(rfc, telefono);
    COMMENT ON CONSTRAINT telefonoPersonalLimpieza_pk ON telefonoPersonalLimpieza IS 'Restriccion de entidad para la tabla telefonoPersonalLimpieza'; 
ALTER TABLE correoPersonalLimpieza 
    ADD CONSTRAINT correoPersonalLimpieza_pk PRIMARY KEY(rfc, correo);
    COMMENT ON CONSTRAINT correoPersonalLimpieza_pk ON correoPersonalLimpieza IS 'Restriccion de entidad para la tabla correoPersonalLimpieza'; 

ALTER TABLE telefonoPersonalSeguridad 
    ADD CONSTRAINT telefonoPersonalSeguridad_pk PRIMARY KEY(rfc, telefono);
    COMMENT ON CONSTRAINT telefonoPersonalSeguridad_pk ON telefonoPersonalSeguridad IS 'Restriccion de entidad para la tabla telefonoPersonalSeguridad'; 
ALTER TABLE correoPersonalSeguridad 
    ADD CONSTRAINT correoPersonalSeguridad_pk PRIMARY KEY(rfc, correo);
    COMMENT ON CONSTRAINT correoPersonalSeguridad_pk ON correoPersonalSeguridad IS 'Restriccion de entidad para la tabla correoPersonalSeguridad'; 

ALTER TABLE telefonoPersonalMedico 
    ADD CONSTRAINT telefonoPersonalMedico_pk PRIMARY KEY(rfc, telefono);
    COMMENT ON CONSTRAINT telefonoPersonalMedico_pk ON telefonoPersonalMedico IS 'Restriccion de entidad para la tabla telefonoPersonalMedico'; 
ALTER TABLE correoPersonalMedico 
    ADD CONSTRAINT correoPersonalMedico_pk PRIMARY KEY(rfc, correo);
    COMMENT ON CONSTRAINT correoPersonalMedico_pk ON correoPersonalMedico IS 'Restriccion de entidad para la tabla correoPersonalMedico';

ALTER TABLE amenidades 
    ADD CONSTRAINT amenidades_pk PRIMARY KEY(idBazar, amenidad);
    COMMENT ON CONSTRAINT amenidades_pk ON amenidades IS 'Restriccion de entidad para la tabla amenidades'; 

-- Restricciones referenciales FK

ALTER TABLE estand 
    ADD CONSTRAINT idNegocio_fk FOREIGN KEY(nombreNegocio) 
    REFERENCES negocio(nombreNegocio)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT idNegocio_fk ON estand IS 'Restriccion referencial que checa si el nombreNegocio existe';

ALTER TABLE emprendedor 
    ADD CONSTRAINT nombreNegocio_fk FOREIGN KEY(nombreNegocio) 
    REFERENCES negocio(nombreNegocio)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT nombreNegocio_fk ON emprendedor IS 'Restriccion referencial que checa si el nombreNegocio existe';

ALTER TABLE ticket 
    ADD CONSTRAINT cliente_fk FOREIGN KEY(idCliente) 
    REFERENCES cliente(idCliente)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    ADD CONSTRAINT cliente_fk2 FOREIGN KEY(rfc) 
    REFERENCES emprendedor(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT cliente_fk ON ticket IS 'Restriccion referencial que checa si el idCliente existe';
    COMMENT ON CONSTRAINT cliente_fk2 ON ticket IS 'Restriccion referencial que checa si el rfc existe';

ALTER TABLE asistir 
    ADD CONSTRAINT asistir_fk FOREIGN KEY(idBazar) 
    REFERENCES bazar(idBazar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    ADD CONSTRAINT asistir_fk2 FOREIGN KEY(idCliente) 
    REFERENCES cliente(idCliente)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT asistir_fk ON asistir IS 'Restriccion referencial que checa si el idBazar existe';
    COMMENT ON CONSTRAINT asistir_fk2 ON asistir IS 'Restriccion referencial que checa si el idCliente existe';

ALTER TABLE trabajarSeguridad 
    ADD CONSTRAINT trabajarSeguridad_fk FOREIGN KEY(idBazar) 
    REFERENCES bazar(idBazar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    ADD CONSTRAINT trabajarSeguridad_fk2 FOREIGN KEY(rfc) 
    REFERENCES personalSeguridad(rfc)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT trabajarSeguridad_fk ON trabajarSeguridad IS 'Restriccion referencial que checa si el idBazar existe';
    COMMENT ON CONSTRAINT trabajarSeguridad_fk2 ON trabajarSeguridad IS 'Restriccion referencial que checa si el rfc existe';

ALTER TABLE trabajarLimpieza 
    ADD CONSTRAINT trabajarLimpieza_fk FOREIGN KEY(idBazar) 
    REFERENCES bazar(idBazar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    ADD CONSTRAINT trabajarLimpieza_fk2 FOREIGN KEY(rfc) 
    REFERENCES personalLimpieza(rfc)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT trabajarLimpieza_fk ON trabajarLimpieza IS 'Restriccion referencial que checa si el idBazar existe';
    COMMENT ON CONSTRAINT trabajarLimpieza_fk2 ON trabajarLimpieza IS 'Restriccion referencial que checa si el rfc existe';

ALTER TABLE trabajarMedico 
    ADD CONSTRAINT trabajarMedico_fk FOREIGN KEY(idBazar) 
    REFERENCES bazar(idBazar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    ADD CONSTRAINT trabajarMedico_fk2 FOREIGN KEY(rfc) 
    REFERENCES personalMedico(rfc)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT trabajarMedico_fk ON trabajarMedico IS 'Restriccion referencial que checa si el idBazar existe';
    COMMENT ON CONSTRAINT trabajarMedico_fk2 ON trabajarMedico IS 'Restriccion referencial que checa si el rfc existe';

ALTER TABLE tenerNegocio 
    ADD CONSTRAINT tenerNegocio_fk FOREIGN KEY(idBazar) 
    REFERENCES bazar(idBazar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    ADD CONSTRAINT tenerNegocio_fk2 FOREIGN KEY(nombreNegocio) 
    REFERENCES negocio(nombreNegocio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT tenerNegocio_fk ON tenerNegocio IS 'Restriccion referencial que checa si el idBazar existe';
    COMMENT ON CONSTRAINT tenerNegocio_fk2 ON tenerNegocio IS 'Restriccion referencial que checa si el nombreNegocio existe';

ALTER TABLE guardarEstand 
    ADD CONSTRAINT guardarEstand_fk FOREIGN KEY(idAgenda, idBazar)  
    REFERENCES agenda(idAgenda, idBazar) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    ADD CONSTRAINT guardarEstand_fk2 FOREIGN KEY(numeroEstand) 
    REFERENCES estand(numeroEstand)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT guardarEstand_fk ON guardarEstand IS 'Restriccion referencial que checa si el idAgenda y idBazar existen';
    COMMENT ON CONSTRAINT guardarEstand_fk2 ON guardarEstand IS 'Restriccion referencial que checa si el numeroEstand existe';

ALTER TABLE proporcionarServicio 
    ADD CONSTRAINT proporcionarS_fk FOREIGN KEY(nombreNegocio) 
    REFERENCES negocio(nombreNegocio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION, 
    ADD CONSTRAINT proporcionarS_fk2 FOREIGN KEY(nombre, tipo) 
    REFERENCES mercanciaServicio(nombre, tipo) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT proporcionarS_fk ON proporcionarServicio IS 'Restriccion referencial que checa si el nombreNegocio existe';
    COMMENT ON CONSTRAINT proporcionarS_fk2 ON proporcionarServicio IS 'Restriccion referencial que checa si el nombre y tipo existe';

ALTER TABLE proporcionarProductoPerecedero 
    ADD CONSTRAINT proporcionarP_fk FOREIGN KEY(nombreNegocio) 
    REFERENCES negocio(nombreNegocio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION, 
    ADD CONSTRAINT proporcionarP_fk2 FOREIGN KEY(nombre, tipo)  
    REFERENCES mercanciaProductoPerecedero(nombre,tipo) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT proporcionarP_fk ON proporcionarProductoPerecedero IS 'Restriccion referencial que checa si el nombreNegocio existe';
    COMMENT ON CONSTRAINT proporcionarP_fk2 ON proporcionarProductoPerecedero IS 'Restriccion referencial que checa si el nombre y tipo existe';

ALTER TABLE proporcionarProductoNoPerecedero 
    ADD CONSTRAINT proporcionarNP_fk FOREIGN KEY(nombreNegocio) 
    REFERENCES negocio(nombreNegocio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION, 
    ADD CONSTRAINT proporcionarNP_fk2 FOREIGN KEY(nombre, tipo)  
    REFERENCES mercanciaProductoNoPerecedero(nombre, tipo) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT proporcionarNP_fk ON proporcionarProductoNoPerecedero IS 'Restriccion referencial que checa si el nombreNegocio existe';
    COMMENT ON CONSTRAINT proporcionarNP_fk2 ON proporcionarProductoNoPerecedero IS 'Restriccion referencial que checa si el nombre y tipo existe';

ALTER TABLE registrarCompraServicio 
    ADD CONSTRAINT registrarCompraServicio_fk FOREIGN KEY(idTicket) 
    REFERENCES ticket(idTicket)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    ADD CONSTRAINT registrarCompraServicio_fk2 FOREIGN KEY(nombre, tipo) 
    REFERENCES mercanciaServicio(nombre, tipo)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT registrarCompraServicio_fk ON registrarCompraServicio IS 'Restriccion referencial que checa si el idTicket existe';
    COMMENT ON CONSTRAINT registrarCompraServicio_fk2 ON registrarCompraServicio IS 'Restriccion referencial que checa si el nombre existe';

ALTER TABLE registrarCompraNoPerecedero 
    ADD CONSTRAINT registrarCompraNoPerecedero_fk FOREIGN KEY(idTicket) 
    REFERENCES ticket(idTicket)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    ADD CONSTRAINT registrarCompraNoPerecedero_fk2 FOREIGN KEY(nombre, tipo) 
    REFERENCES mercanciaProductoNoPerecedero(nombre, tipo)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT registrarCompraNoPerecedero_fk ON registrarCompraNoPerecedero  IS 'Restriccion referencial que checa si el idTicket existe';
    COMMENT ON CONSTRAINT registrarCompraNoPerecedero_fk2 ON registrarCompraNoPerecedero IS 'Restriccion referencial que checa si el nombre existe';

ALTER TABLE registrarCompraPerecedero 
    ADD CONSTRAINT registrarCompraPerecedero_fk FOREIGN KEY(idTicket) 
    REFERENCES ticket(idTicket)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    ADD CONSTRAINT registrarCompraPerecedero_fk2 FOREIGN KEY(nombre, tipo) 
    REFERENCES mercanciaProductoPerecedero(nombre, tipo)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT registrarCompraPerecedero_fk ON registrarCompraPerecedero IS 'Restriccion referencial que checa si el idTicket existe';
    COMMENT ON CONSTRAINT registrarCompraPerecedero_fk2 ON registrarCompraPerecedero IS 'Restriccion referencial que checa si el nombre existe';

ALTER TABLE telefonoEmprendedor
    ADD CONSTRAINT telefonoEmprendedor_fk FOREIGN KEY(rfc)
    REFERENCES emprendedor(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT telefonoEmprendedor_fk ON telefonoEmprendedor IS  'Restriccion referencial que checa si el rfc existe';
ALTER TABLE correoEmprendedor
    ADD CONSTRAINT correoEmprendedor_fk FOREIGN KEY(rfc)
    REFERENCES emprendedor(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT correoEmprendedor_fk ON correoEmprendedor IS  'Restriccion referencial que checa si el rfc existe';

ALTER TABLE telefonoNegocio
    ADD CONSTRAINT telefonoNegocio_fk FOREIGN KEY(nombreNegocio)
    REFERENCES negocio(nombreNegocio)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT telefonoNegocio_fk ON telefonoNegocio IS  'Restriccion referencial que checa si el nombreNegocio existe';
ALTER TABLE correoNegocio
    ADD CONSTRAINT correoNegocio_fk FOREIGN KEY(nombreNegocio)
    REFERENCES negocio(nombreNegocio)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT correoNegocio_fk ON correoNegocio IS  'Restriccion referencial que checa si el nombreNegocio existe';
ALTER TABLE redSocialNegocio
    ADD CONSTRAINT redSocialNegocio_fk FOREIGN KEY(nombreNegocio)
    REFERENCES negocio(nombreNegocio)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT redSocialNegocio_fk ON redSocialNegocio IS  'Restriccion referencial que checa si el nombreNegocio existe';

ALTER TABLE telefonoPersonalLimpieza
    ADD CONSTRAINT telefonoPersonalLimpieza_fk FOREIGN KEY(rfc)
    REFERENCES personalLimpieza(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT telefonoPersonalLimpieza_fk ON telefonoPersonalLimpieza IS  'Restriccion referencial que checa si el rfc existe';
ALTER TABLE correoPersonalLimpieza
    ADD CONSTRAINT correoPersonalLimpieza_fk FOREIGN KEY(rfc)
    REFERENCES personalLimpieza(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT correoPersonalLimpieza_fk ON correoPersonalLimpieza IS  'Restriccion referencial que checa si el rfc existe';

ALTER TABLE telefonoPersonalSeguridad
    ADD CONSTRAINT telefonoPersonalSeguridad_fk FOREIGN KEY(rfc)
    REFERENCES personalSeguridad(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT telefonoPersonalSeguridad_fk ON telefonoPersonalSeguridad IS  'Restriccion referencial que checa si el rfc existe';
ALTER TABLE correoPersonalSeguridad
    ADD CONSTRAINT correoPersonalSeguridad_fk FOREIGN KEY(rfc)
    REFERENCES personalSeguridad(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT correoPersonalSeguridad_fk ON correoPersonalSeguridad IS  'Restriccion referencial que checa si el rfc existe';

ALTER TABLE telefonoPersonalMedico
    ADD CONSTRAINT telefonoPersonalMedico_fk FOREIGN KEY(rfc)
    REFERENCES personalMedico(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT telefonoPersonalMedico_fk ON telefonoPersonalMedico IS  'Restriccion referencial que checa si el rfc existe';
ALTER TABLE correoPersonalMedico
    ADD CONSTRAINT correoPersonalMedico_fk FOREIGN KEY(rfc)
    REFERENCES personalMedico(rfc)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT correoPersonalMedico_fk ON correoPersonalMedico IS  'Restriccion referencial que checa si el rfc existe';

ALTER TABLE amenidades
    ADD CONSTRAINT amenidades_fk FOREIGN KEY(idBazar)
    REFERENCES bazar(idBazar)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT amenidades_fk ON amenidades IS  'Restriccion referencial que checa si el idBazar existe';

ALTER TABLE agenda
    ADD CONSTRAINT agenda_fk FOREIGN KEY(idBazar)
    REFERENCES bazar(idBazar)
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
    COMMENT ON CONSTRAINT agenda_fk ON agenda IS  'Restriccion referencial que checa si el idBazar existe';


-- Restricciones de dominio
    --Reestricciones de compras
ALTER TABLE registrarCompraServicio
    ALTER COLUMN idTicket SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN tipo SET NOT NULL;

ALTER TABLE registrarCompraNoPerecedero
    ALTER COLUMN idTicket SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN tipo SET NOT NULL,
    ADD CONSTRAINT registrarCompraNoPerecederoDominio01 CHECK (cantidadComprada > 0);
    COMMENT ON CONSTRAINT registrarCompraNoPerecederoDominio01 ON registrarCompraNoPerecedero IS 'restriccion que verifica que la cantidad comprada es mayor a 0';

ALTER TABLE registrarCompraPerecedero
    ALTER COLUMN idTicket SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN tipo SET NOT NULL,
    ADD CONSTRAINT registrarCompraPerecederoDominio01 CHECK (cantidadComprada > 0);
    COMMENT ON CONSTRAINT registrarCompraPerecederoDominio01 ON registrarCompraPerecedero IS 'restriccion que verifica que la cantidad comprada es mayor a 0';

ALTER TABLE proporcionarProductoNoPerecedero
    ALTER COLUMN nombreNegocio SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN tipo SET NOT NULL;
    
ALTER TABLE proporcionarServicio
    ALTER COLUMN nombreNegocio SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN tipo SET NOT NULL;

ALTER TABLE proporcionarProductoPerecedero
    ALTER COLUMN nombreNegocio SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN tipo SET NOT NULL;    

    --Reestricciones de emprendedor
ALTER TABLE emprendedor 
    ALTER COLUMN nombreNegocio SET NOT NULL,
    ALTER COLUMN apellidoPaterno SET NOT NULL,
    ALTER COLUMN apellidoMaterno SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN calle SET NOT NULL,
    ALTER COLUMN colonia SET NOT NULL,
    ALTER COLUMN estado SET NOT NULL,
    ALTER COLUMN nacimiento SET NOT NULL,
    ADD CONSTRAINT emprendedorDominio01 CHECK (genero IN ('M', 'F')),
    ADD CONSTRAINT emprendedorDominio02 CHECK(nacimiento BETWEEN (CURRENT_DATE - INTERVAL '100 years') AND CURRENT_DATE - INTERVAL '18 years'), -- 18 a 100 años
    ADD CONSTRAINT emprendedorDominio03 CHECK (numInterior >= 0),
    ADD CONSTRAINT emprendedorDominio04 CHECK (numExterior >= 0),
    ADD CONSTRAINT emprendedorDominio05 CHECK (CHAR_LENGTH(rfc) = 13);
    COMMENT ON CONSTRAINT emprendedorDominio01 ON emprendedor IS 'Restriccion que verifica que el genero es M o F';
    COMMENT ON CONSTRAINT emprendedorDominio02 ON emprendedor IS 'Restriccion que verifica que la fecha de nacimiento corresponda a edades entre 18 y 100 años';
    COMMENT ON CONSTRAINT emprendedorDominio03 ON emprendedor IS 'Restriccion que verifica que el numero interior es mayor o igual a 0';
    COMMENT ON CONSTRAINT emprendedorDominio04 ON emprendedor IS 'Restriccion que verifica que el numero exterior es mayor o igual a 0';
    COMMENT on CONSTRAINT emprendedorDominio05 ON emprendedor IS 'Restriccion que verifica que el rfc tenga 13 caracteres';

ALTER TABLE telefonoEmprendedor 
    ADD CONSTRAINT telefonoEmprendedorDominio01 CHECK (telefono ~ '[0-9]{10}');
    COMMENT ON CONSTRAINT telefonoEmprendedorDominio01 ON telefonoEmprendedor IS 'Restriccion que verifica que el telefono tenga entre 10 y 12 digitos';

ALTER TABLE correoEmprendedor 
    ADD CONSTRAINT correoEmprendedorDominio01 CHECK(correo SIMILAR TO '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}');
    COMMENT ON CONSTRAINT correoEmprendedorDominio01 ON correoEmprendedor IS 'Restriccion que verifica que el correo tenga el formato correcto';

    --Reestricciones del personal
ALTER TABLE personalLimpieza 
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN apellidoPaterno SET NOT NULL,
    ALTER COLUMN apellidoMaterno SET NOT NULL,
    ALTER COLUMN calle SET NOT NULL,
    ALTER COLUMN colonia SET NOT NULL,
    ALTER COLUMN estado SET NOT NULL,
    ALTER COLUMN fechaAsistencia SET NOT NULL,  
    ALTER COLUMN horaInicio SET NOT NULL, 
    ALTER COLUMN horaFinal SET NOT NULL, 
    ADD CONSTRAINT personalLimpiezaDominio01 CHECK (CHAR_LENGTH(rfc) = 13),
    ADD CONSTRAINT personalLimpiezaDominio02 CHECK (salario >= 0::money),
    ADD CONSTRAINT personalLimpiezaDominio03 CHECK (numInterior >= 0),
    ADD CONSTRAINT personalLimpiezaDominio04 CHECK (numExterior >= 0),
    ADD CONSTRAINT personalLimpiezaDominio05 CHECK (horaInicio BETWEEN TIME '06:00' AND TIME '20:00'), 
    ADD CONSTRAINT personalLimpiezaDominio06 CHECK (horaFinal >= horaInicio + INTERVAL '1 hour'); 
    COMMENT ON CONSTRAINT personalLimpiezaDominio01 ON personalLimpieza IS 'Restriccion que verifica que el rfc tenga 13 caracteres';
    COMMENT ON CONSTRAINT personalLimpiezaDominio02 ON personalLimpieza IS 'Restriccion que verifica que el salario sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalLimpiezaDominio03 ON personalLimpieza IS 'Restriccion que verifica que el numero interior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalLimpiezaDominio04 ON personalLimpieza IS 'Restriccion que verifica que el numero exterior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalLimpiezaDominio05 ON personalLimpieza IS 'Restriccion que verifica que la hora de inicio este entre las 8 y las 20 horas';
    COMMENT ON CONSTRAINT personalLimpiezaDominio06 ON personalLimpieza IS 'Restriccion que verifica que hora final sea al menos una hora mayor a la hora inicio';

ALTER TABLE telefonoPersonalLimpieza 
    ADD CONSTRAINT telefonoPersonalLimpiezaDominio01 CHECK (telefono ~ '[0-9]{10}');
    COMMENT ON CONSTRAINT telefonoPersonalLimpiezaDominio01 ON telefonoPersonalLimpieza IS 'Restriccion que verifica que el telefono tenga entre 10 y 12 digitos';

ALTER TABLE correoPersonalLimpieza
    ADD CONSTRAINT correoPersonalLimpiezaDominio01 CHECK (correo SIMILAR TO '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}');
    COMMENT ON CONSTRAINT correoPersonalLimpiezaDominio01 ON correoPersonalLimpieza IS 'Restriccion que verifica que el correo tenga el formato correcto';

ALTER TABLE personalSeguridad
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN apellidoPaterno SET NOT NULL,
    ALTER COLUMN apellidoMaterno SET NOT NULL,
    ALTER COLUMN calle SET NOT NULL,
    ALTER COLUMN colonia SET NOT NULL,
    ALTER COLUMN estado SET NOT NULL,
    ALTER COLUMN fechaAsistencia SET NOT NULL,  
    ALTER COLUMN horaInicio SET NOT NULL, 
    ALTER COLUMN horaFinal SET NOT NULL, 
    ADD CONSTRAINT personalSeguridadDominio01 CHECK (CHAR_LENGTH(rfc) = 13),
    ADD CONSTRAINT personalSeguridadDominio02 CHECK (salario >= 0::money),
    ADD CONSTRAINT personalSeguridadDominio03 CHECK (numInterior >= 0),
    ADD CONSTRAINT personalSeguridadDominio04 CHECK (numExterior >= 0),
    ADD CONSTRAINT personalSeguridadDominio05 CHECK (horaInicio BETWEEN TIME '06:00' AND TIME '23:00'), 
    ADD CONSTRAINT personalSeguridadDominio06 CHECK (horaFinal >= horaInicio + INTERVAL '1 hour'); 
    COMMENT ON CONSTRAINT personalSeguridadDominio01 ON personalSeguridad IS 'Restriccion que verifica que el rfc tenga 13 caracteres'; 
    COMMENT ON CONSTRAINT personalSeguridadDominio02 ON personalSeguridad IS 'Restriccion que verifica que el salario sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalSeguridadDominio03 ON personalSeguridad IS 'Restriccion que verifica que el numero interior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalSeguridadDominio04 ON personalSeguridad IS 'Restriccion que verifica que el numero exterior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalSeguridadDominio05 ON personalSeguridad IS 'Restriccion que verifica que la hora de inicio este entre las 8 y las 20 horas';
    COMMENT ON CONSTRAINT personalSeguridadDominio06 ON personalSeguridad IS 'Restriccion que verifica que hora final sea al menos una hora mayor a la hora inicio';

ALTER TABLE telefonoPersonalSeguridad 
    ADD CONSTRAINT telefonoPersonalSeguridadDominio01 CHECK (telefono ~ '[0-9]{10}');
    COMMENT ON CONSTRAINT telefonoPersonalSeguridadDominio01 ON telefonoPersonalSeguridad IS 'Restriccion que verifica que el telefono tenga entre 10 y 12 digitos';

ALTER TABLE correoPersonalSeguridad
    ADD CONSTRAINT correoPersonalSeguridadDominio01 CHECK (correo SIMILAR TO '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}');
    COMMENT ON CONSTRAINT correoPersonalSeguridadDominio01 ON correoPersonalSeguridad IS 'Restriccion que verifica que el correo tenga el formato correcto';

ALTER TABLE personalMedico 
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN apellidoPaterno SET NOT NULL,
    ALTER COLUMN apellidoMaterno SET NOT NULL,
    ALTER COLUMN calle SET NOT NULL,
    ALTER COLUMN colonia SET NOT NULL,
    ALTER COLUMN estado SET NOT NULL,
    ALTER COLUMN fechaAsistencia SET NOT NULL,  
    ALTER COLUMN horaInicio SET NOT NULL, 
    ALTER COLUMN horaFinal SET NOT NULL, 
    ADD CONSTRAINT personalMedicoDominio01 CHECK (CHAR_LENGTH(rfc) = 13),
    ADD CONSTRAINT personalMedicoDominio02 CHECK (salario >= 0::money),
    ADD CONSTRAINT personalMedicoDominio03 CHECK (numInterior >= 0),
    ADD CONSTRAINT personalMedicoDominio04 CHECK (numExterior >= 0),
    ADD CONSTRAINT personalMedicoDominio05 CHECK (horaInicio BETWEEN TIME '06:00' AND TIME '20:00'), 
    ADD CONSTRAINT personalMedicoDominio06 CHECK (horaFinal >= horaInicio + INTERVAL '1 hour'); 
    COMMENT ON CONSTRAINT personalMedicoDominio01 ON personalMedico IS 'Restriccion que verifica que el rfc tenga 13 caracteres'; 
    COMMENT ON CONSTRAINT personalMedicoDominio02 ON personalMedico IS 'Restriccion que verifica que el salario sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalMedicoDominio03 ON personalMedico IS 'Restriccion que verifica que el numero interior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalMedicoDominio04 ON personalMedico IS 'Restriccion que verifica que el numero exterior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT personalMedicoDominio05 ON personalMedico IS 'Restriccion que verifica que la hora de inicio este entre las 8 y las 20 horas';
    COMMENT ON CONSTRAINT personalMedicoDominio06 ON personalMedico IS 'Restriccion que verifica que hora final sea al menos una hora mayor a la hora inicio';

ALTER TABLE telefonoPersonalMedico 
    ADD CONSTRAINT telefonoPersonalMedicoDominio01 CHECK (telefono ~ '[0-9]{10}');
    COMMENT ON CONSTRAINT telefonoPersonalMedicoDominio01 ON telefonoPersonalMedico IS 'Restriccion que verifica que el telefono tenga entre 10 y 12 digitos';

ALTER TABLE correoPersonalMedico 
    ADD CONSTRAINT correoPersonalMedicoDominio01 CHECK (correo SIMILAR TO '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}');
    COMMENT ON CONSTRAINT correoPersonalMedicoDominio01 ON correoPersonalMedico IS 'Restriccion que verifica que el correo tenga el formato correcto';

ALTER TABLE trabajarLimpieza 
    ALTER COLUMN idBazar SET NOT NULL,
    ALTER COLUMN rfc SET NOT NULL;

ALTER TABLE trabajarSeguridad
    ALTER COLUMN idBazar SET NOT NULL,
    ALTER COLUMN rfc SET NOT NULL;

ALTER TABLE trabajarMedico
    ALTER COLUMN idBazar SET NOT NULL,
    ALTER COLUMN rfc SET NOT NULL;

    --Reestricciones del cliente
ALTER TABLE cliente 
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN apellidoPaterno SET NOT NULL,
    ALTER COLUMN apellidoMaterno SET NOT NULL,
    ALTER COLUMN calle SET NOT NULL,
    ALTER COLUMN colonia SET NOT NULL,
    ALTER COLUMN estado SET NOT NULL,    
    ALTER COLUMN metodoPago SET NOT NULL,       
    ADD CONSTRAINT clienteDominio01 CHECK (idCliente > 0),
    ADD CONSTRAINT clienteDominio02 CHECK (numExterior >= 0),
    ADD CONSTRAINT clienteDominio03 CHECK (numInterior >= 0),
    ADD CONSTRAINT clienteDominio04 CHECK (numTarjeta ~ '[0-9]{14,16}'),
    ADD CONSTRAINT clienteDominio05 CHECK (cvv SIMILAR TO '[0-9]{3}'),
    ADD CONSTRAINT clienteDominio06 CHECK (vencimiento > CURRENT_DATE);
    COMMENT ON CONSTRAINT clienteDominio01 ON cliente IS 'Restriccion que verifica que el idCliente sea mayor a 0';
    COMMENT ON CONSTRAINT clienteDominio02 ON cliente IS 'Restriccion que verifica que el numero exterior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT clienteDominio03 ON cliente IS 'Restriccion que verifica que el numero interior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT clienteDominio04 ON cliente IS 'Restriccion que verifica que el numero de tarjeta tenga 16 digitos';
    COMMENT ON CONSTRAINT clienteDominio05 ON cliente IS 'Restriccion que verifica que el cvv tenga 3 digitos';
    COMMENT ON CONSTRAINT clienteDominio06 ON cliente IS 'Restriccion que verifica que la fecha de vencimiento sea mayor a la actual';

    --Reestricciones del negocio
ALTER TABLE negocio 
    ALTER COLUMN descripcion SET NOT NULL,
    ADD CONSTRAINT negocioDominio01 CHECK (CHAR_LENGTH(nombreNegocio) > 0),
    ADD CONSTRAINT negocioDominio02 CHECK (precioMasBajo  >= 0::money),
    ADD CONSTRAINT negocioDominio03 CHECK (precioMasAlto >= 0::money),
    ADD CONSTRAINT negocioDominio04 CHECK (precioMasBajo <= precioMasAlto);
    COMMENT ON CONSTRAINT negocioDominio01 ON negocio IS 'Restriccion que verifica que el nombreNegocio no sea vacio';
    COMMENT ON CONSTRAINT negocioDominio02 ON negocio IS 'Restriccion que verifica que el precioMasBajo sea mayor o igual a 0';
    COMMENT ON CONSTRAINT negocioDominio03 ON negocio IS 'Restriccion que verifica que el precioMasAlto sea mayor o igual a 0';
    COMMENT ON CONSTRAINT negocioDominio04 ON negocio IS 'Restriccion que verifica que el precioMasBajo sea menor o igual al precioMasAlto';

ALTER TABLE telefonoNegocio 
    ADD CONSTRAINT telefonoNegocioDominio01 CHECK (telefono ~ '[0-9]{10}');
    COMMENT ON CONSTRAINT telefonoNegocioDominio01 ON telefonoNegocio IS 'Restriccion que verifica que el telefono tenga entre 10 y 12 digitos';
ALTER TABLE correoNegocio 
    ADD CONSTRAINT correoNegocioDominio01 CHECK (correo SIMILAR TO '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}');
    COMMENT ON CONSTRAINT correoNegocioDominio01 ON correoNegocio IS 'Restriccion que verifica que el correo tenga el formato correcto';

ALTER TABLE tenerNegocio
    ALTER COLUMN idBazar SET NOT NULL,
    ALTER COLUMN nombreNegocio SET NOT NULL;

    --Reestricciones del bazar
ALTER TABLE bazar 
    ALTER COLUMN fechaInicio SET NOT NULL,
    ALTER COLUMN fechaFin SET NOT NULL,
    ALTER COLUMN calle SET NOT NULL,
    ALTER COLUMN colonia SET NOT NULL,
    ALTER COLUMN estado SET NOT NULL,
    ADD CONSTRAINT bazarDominio02 CHECK (numExterior >= 0),
    ADD CONSTRAINT bazarDominio03 CHECK (numInterior >= 0),
    ADD CONSTRAINT bazarDominio04 CHECK (fechaFin >= fechaInicio);
    COMMENT ON CONSTRAINT bazarDominio02 ON bazar IS 'Restriccion que verifica que el numero exterior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT bazarDominio03 ON bazar IS 'Restriccion que verifica que el numero interior sea mayor o igual a 0';
    COMMENT ON CONSTRAINT bazarDominio04 ON bazar IS 'Restriccion que verifica que el la fecha fin sea mayor o igual a la fecha inicio';

ALTER TABLE amenidades
    ADD CONSTRAINT amenidadesDominio01 CHECK (CHAR_LENGTH(amenidad) <= 50);
    COMMENT ON CONSTRAINT amenidadesDominio01 ON amenidades IS 'Restriccion que verifica que la amenidad no sea mayor a 50 caracteres';

    --Reestricciones de la agenda
ALTER TABLE agenda ALTER COLUMN fecha SET NOT NULL;

    --Reestricciones de la mercancia
ALTER TABLE mercanciaServicio 
    ALTER COLUMN duracion SET NOT NULL,
    ADD CONSTRAINT mercanciaServicioDominio01 CHECK (CHAR_LENGTH(nombre) <= 50),
    ADD CONSTRAINT mercanciaServicioDominio02 CHECK (CHAR_LENGTH(tipo) <= 50),
    ADD CONSTRAINT mercanciaServicioDominio03 CHECK (CHAR_LENGTH(descripcion) <= 100),
    ADD CONSTRAINT mercanciaServicioDominio04 CHECK (precio >= 0::money);
    COMMENT ON CONSTRAINT mercanciaServicioDominio01 ON mercanciaServicio IS 'Restriccion que verifica que el nombre no sea mayor a 50 caracteres';
    COMMENT ON CONSTRAINT mercanciaServicioDominio02 ON mercanciaServicio IS 'Restriccion que verifica que el tipo no sea mayor a 50 caracteres';
    COMMENT ON CONSTRAINT mercanciaServicioDominio03 ON mercanciaServicio IS 'Restriccion que verifica que la descripcion no sea mayor a 100 caracteres';
    COMMENT ON CONSTRAINT mercanciaServicioDominio04 ON mercanciaServicio IS 'Restriccion que verifica que el precio sea mayor o igual a 0';


ALTER TABLE mercanciaProductoPerecedero 
    ADD CONSTRAINT mercanciaProductoPerecederoDominio01 CHECK (CHAR_LENGTH(nombre) <= 50),
    ADD CONSTRAINT mercanciaProductoPerecederoDominio02 CHECK (CHAR_LENGTH(tipo) <= 50),
    ADD CONSTRAINT mercanciaProductoPerecederoDominio03 CHECK (CHAR_LENGTH(descripcion) <= 100),
    ADD CONSTRAINT mercanciaProductoPerecederoDominio04 CHECK (precio >= 0::money),
    ADD CONSTRAINT mercanciaProductoPerecederoDominio05 CHECK (cantidadInicial >= 0),
    ADD CONSTRAINT mercanciaProductoPerecederoDominio06 CHECK (fechaPreparacion <= fechaCaducidad);
    COMMENT ON CONSTRAINT mercanciaProductoPerecederoDominio01 ON mercanciaProductoPerecedero IS 'Restriccion que verifica que el nombre no sea mayor a 50 caracteres';
    COMMENT ON CONSTRAINT mercanciaProductoPerecederoDominio02 ON mercanciaProductoPerecedero IS 'Restriccion que verifica que el tipo no sea mayor a 50 caracteres';
    COMMENT ON CONSTRAINT mercanciaProductoPerecederoDominio03 ON mercanciaProductoPerecedero IS 'Restriccion que verifica que la descripcion no sea mayor a 100 caracteres';
    COMMENT ON CONSTRAINT mercanciaProductoPerecederoDominio04 ON mercanciaProductoPerecedero IS 'Restriccion que verifica que el precio sea mayor o igual a 0';
    COMMENT ON CONSTRAINT mercanciaProductoPerecederoDominio05 ON mercanciaProductoPerecedero IS 'Restriccion que verifica que la cantidad inicial sea mayor o igual a 0';
    COMMENT ON CONSTRAINT mercanciaProductoPerecederoDominio06 ON mercanciaProductoPerecedero IS 'Restriccion que verifica que la fecha de preparacion sea menor o igual a la fecha de caducidad';

ALTER TABLE mercanciaProductoNoPerecedero 
    ADD CONSTRAINT mercanciaProductoNoPerecederoDominio01 CHECK (CHAR_LENGTH(nombre) <= 50),
    ADD CONSTRAINT mercanciaProductoNoPerecederoDominio02 CHECK (CHAR_LENGTH(tipo) <= 50),
    ADD CONSTRAINT mercanciaProductoNoPerecederoDominio03 CHECK (CHAR_LENGTH(descripcion) <= 100),
    ADD CONSTRAINT mercanciaProductoNoPerecederoDominio04 CHECK (CHAR_LENGTH(presentacion) <= 50),
    ADD CONSTRAINT mercanciaProductoNoPerecederoDominio05 CHECK (precio >= 0::money),
    ADD CONSTRAINT mercanciaProductoNoPerecederoDominio06 CHECK (cantidadInicial >= 0);
    COMMENT ON CONSTRAINT mercanciaProductoNoPerecederoDominio01 ON mercanciaProductoNoPerecedero IS 'Restriccion que verifica que el nombre no sea mayor a 50 caracteres';
    COMMENT ON CONSTRAINT mercanciaProductoNoPerecederoDominio02 ON mercanciaProductoNoPerecedero IS 'Restriccion que verifica que el tipo no sea mayor a 50 caracteres';
    COMMENT ON CONSTRAINT mercanciaProductoNoPerecederoDominio03 ON mercanciaProductoNoPerecedero IS 'Restriccion que verifica que la descripcion no sea mayor a 100 caracteres';
    COMMENT ON CONSTRAINT mercanciaProductoNoPerecederoDominio04 ON mercanciaProductoNoPerecedero IS 'Restriccion que verifica que la presentacion no sea mayor a 50 caracteres';
    COMMENT ON CONSTRAINT mercanciaProductoNoPerecederoDominio05 ON mercanciaProductoNoPerecedero IS 'Restriccion que verifica que el precio sea mayor o igual a 0';
    COMMENT ON CONSTRAINT mercanciaProductoNoPerecederoDominio06 ON mercanciaProductoNoPerecedero IS 'Restriccion que verifica que la cantidad inicial sea mayor o igual a 0';

    --Reestricciones del ticket
ALTER TABLE ticket 
    ALTER COLUMN idCliente SET NOT NULL,
    ADD CONSTRAINT ticketDominio01 CHECK (CHAR_LENGTH(rfc) = 13);
    COMMENT ON CONSTRAINT ticketDominio01 ON ticket IS 'Restriccion que verifica que el rfc tenga 13 caracteres';

    --Reestricciones de estand
ALTER TABLE estand 
    ALTER COLUMN nombreNegocio SET NOT NULL,
    ALTER COLUMN esBasico SET NOT NULL,
    ALTER COLUMN esPremium SET NOT NULL,
    ALTER COLUMN esEmprendedor SET NOT NULL;

ALTER TABLE guardarEstand 
    ALTER COLUMN idAgenda SET NOT NULL,
    ALTER COLUMN idBazar SET NOT NULL,
    ALTER COLUMN numeroEstand SET NOT NULL;
