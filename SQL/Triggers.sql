-- Archivo: Triggers.sql


--Seccion de triggers


-- Trigger para tabla cliente respecto a clientes en linea, impidiendo la presencia de NULL en numTarjeta, vencimiento y cvv:
CREATE OR REPLACE FUNCTION verificar_datos_cliente_linea()
RETURNS TRIGGER AS $$
BEGIN
    -- NEW se refiere a la nueva fila que se esta intentando insertar o actualizar
    IF NEW.esClienteLinea = TRUE THEN
        IF NEW.numTarjeta IS NULL THEN
            RAISE EXCEPTION 'El numero de tarjeta no puede ser NULL si esClienteLinea es TRUE.';
        END IF;
        IF NEW.vencimiento IS NULL THEN
            RAISE EXCEPTION 'La fecha de vencimiento no puede ser NULL si esClienteLinea es TRUE.';
        END IF;
        IF NEW.cvv IS NULL THEN
            RAISE EXCEPTION 'El CVV no puede ser NULL si esClienteLinea es TRUE.';
        END IF;
    END IF;
    RETURN NEW; -- Permite que la operacion continue si todo esta bien.
END;
$$ LANGUAGE plpgsql;

-- Documentación de la Función:
-- CREATE OR REPLACE FUNCTION verificar_datos_cliente_linea():
--   Define o reemplaza una función llamada "verificar_datos_cliente_linea".
-- RETURNS TRIGGER:
--   Especifica que esta función está destinada a ser usada como una función de trigger.
-- AS $$ ... $$:
--   Delimita el cuerpo de la función escrito en PL/pgSQL.
-- BEGIN ... END;:
--   Bloque principal de la lógica de la función.
-- IF NEW.esClienteLinea = TRUE THEN ... END IF;:
--   Verifica si la columna "esClienteLinea" de la fila que se va a insertar/actualizar (NEW) es TRUE.
-- IF NEW.columna IS NULL THEN RAISE EXCEPTION 'mensaje'; END IF;:
--   Si la condición anterior es verdadera, verifica si "numTarjeta", "vencimiento" o "cvv" son NULL.
--   Si alguna es NULL, lanza una excepción con el mensaje especificado, deteniendo la operación.
-- RETURN NEW;:
--   Si todas las validaciones pasan, la función retorna la fila (NEW), permitiendo que la operación de INSERT o UPDATE proceda.
-- LANGUAGE plpgsql;:
--   Especifica que el lenguaje utilizado para la función es PL/pgSQL.

-- Trigger que usa la funcion verificar_datos_cliente_linea():
CREATE TRIGGER trg_verificar_cliente_linea
BEFORE INSERT OR UPDATE ON Cliente
FOR EACH ROW
EXECUTE FUNCTION verificar_datos_cliente_linea();

-- Documentación del Trigger:
-- CREATE TRIGGER trg_verificar_cliente_linea:
--   Crea un nuevo trigger llamado "trg_verificar_cliente_linea".
-- BEFORE INSERT OR UPDATE ON Cliente:
--   Especifica que el trigger se activará antes de cualquier operación de INSERT o UPDATE en la tabla "Cliente".
-- FOR EACH ROW:
--   Indica que el trigger se ejecutará una vez por cada fila afectada por la operación.
-- EXECUTE FUNCTION verificar_datos_cliente_linea():
--   Define la función que se ejecutará cuando el trigger se active, en este caso, la que creamos anteriormente.


-- Trigger para verificar exlusividad en cuanto al paquete de estand.
CREATE OR REPLACE FUNCTION verificar_exclusividad_tipo_plan()
RETURNS TRIGGER AS $$
DECLARE
    conteo_true INTEGER;
BEGIN
    -- Si los tres campos son NULL, establecer esBasico en TRUE por defecto
    IF NEW.esEmprendedor IS NULL AND NEW.esPremium IS NULL AND NEW.esBasico IS NULL THEN
        NEW.esEmprendedor := FALSE;
        NEW.esPremium := FALSE;
        NEW.esBasico := TRUE;
    END IF;
    -- Convertimos los booleanos a enteros (TRUE=1, FALSE=0, NULL=0) y los sumamos
    conteo_true := COALESCE(NEW.esEmprendedor::INT, 0) +
                   COALESCE(NEW.esPremium::INT, 0) +
                   COALESCE(NEW.esBasico::INT, 0);

    -- Verificamos si exactamente una opción es TRUE
    IF conteo_true <> 1 THEN
        RAISE EXCEPTION 'Debe seleccionarse exactamente un tipo de plan (Emprendedor, Premium o Básico). Se encontraron % opciones marcadas como TRUE.', conteo_true;
    END IF;

    RETURN NEW; -- Permite que la operacion continue si todo esta bien.
END;
$$ LANGUAGE plpgsql;

-- Documentación de la Función:
-- CREATE OR REPLACE FUNCTION verificar_exclusividad_tipo_plan():
--   Define o reemplaza una función llamada "verificar_exclusividad_tipo_plan".
-- RETURNS TRIGGER:
--   Especifica que esta función está destinada a ser usada como una función de trigger.
-- AS $$ ... $$:
--   Delimita el cuerpo de la función escrito en PL/pgSQL.
-- DECLARE conteo_true INTEGER;:
--   Declara una variable local para almacenar el número de opciones verdaderas.
-- BEGIN ... END;:
--   Bloque principal de la lógica de la función.
-- conteo_true := COALESCE(NEW.esEmprendedor::INT, 0) + ...:
--   Suma los valores de las columnas booleanas.
--   NEW.columna se refiere al valor de la columna en la fila que se está insertando o actualizando.
--   ::INT convierte el booleano a entero (TRUE a 1, FALSE a 0).
--   COALESCE(..., 0) maneja el caso de que la columna sea NULL, tratándola como FALSE (0) para la suma.
-- IF conteo_true <> 1 THEN RAISE EXCEPTION ...:
--   Si el número de opciones verdaderas no es exactamente 1, lanza una excepción
--   con un mensaje descriptivo, deteniendo la operación.
-- RETURN NEW;:
--   Si la validación pasa, la función retorna la fila (NEW), permitiendo que la operación continúe.
-- LANGUAGE plpgsql;:
--   Especifica que el lenguaje utilizado para la función es PL/pgSQL.


-- Trigger que usa la funcion verificar_exclusividad_tipo_plan()
CREATE TRIGGER trg_verificar_exclusividad_plan
BEFORE INSERT OR UPDATE ON estand
FOR EACH ROW
EXECUTE FUNCTION verificar_exclusividad_tipo_plan();

-- Documentación del Trigger:
-- CREATE TRIGGER trg_verificar_exclusividad_plan:
--   Crea un nuevo trigger llamado "trg_verificar_exclusividad_plan".
-- BEFORE INSERT OR UPDATE ON estand:
--   Especifica que el trigger se activará antes de cualquier operación de INSERT o UPDATE en estand.
-- FOR EACH ROW:
--   Indica que el trigger se ejecutará una vez por cada fila afectada por la operación.
-- EXECUTE FUNCTION verificar_exclusividad_tipo_plan():
--   Define la función que se ejecutará cuando el trigger se active.


-- Trigger para validar el metodoPago de clientes en línea que no son físicos
-- Este trigger se asegura de que los clientes en línea que no son físicos no utilicen 'Efectivo' o 'Cheque' como método de pago.
CREATE OR REPLACE FUNCTION validar_metodo_pago_cliente_linea_no_fisico()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar si esClienteLinea es TRUE y esClienteFisico es FALSE
    IF NEW.esClienteLinea = TRUE AND NEW.esClienteFisico = FALSE THEN
        -- Si la condición anterior se cumple, verificar el metodoPago
        IF LOWER(NEW.metodoPago) IN ('efectivo', 'cheque') THEN
            RAISE EXCEPTION 'Para clientes en línea que no son físicos, el método de pago no puede ser "Efectivo" ni "Cheque". Valor proporcionado: %', NEW.metodoPago;
        END IF;
    END IF;

    RETURN NEW; -- Si todas las validaciones son correctas, permitir la operación
END;
$$ LANGUAGE plpgsql;

-- Documentación de la Función:
-- CREATE OR REPLACE FUNCTION validar_metodo_pago_cliente_linea_no_fisico():
--   Define o reemplaza una función con el nombre especificado.
-- RETURNS TRIGGER:
--   Indica que esta función se usará como un trigger.
-- AS $$ ... $$:
--   Delimita el cuerpo de la función en PL/pgSQL.
-- BEGIN ... END;:
--   Bloque principal de la lógica.
-- IF NEW.esClienteLinea = TRUE AND NEW.esClienteFisico = FALSE THEN ... END IF;:
--   Verifica la condición principal: que el cliente sea de línea y no físico.
--   NEW hace referencia a la fila que se está intentando insertar o actualizar.
-- IF LOWER(NEW.metodoPago) IN ('efectivo', 'cheque') THEN ... END IF;:
--   Si la condición principal es verdadera, verifica si el metodoPago es 'Efectivo' o 'Cheque' sin importar mayusculas o minusculas.
--   La cláusula IN es una forma concisa de verificar si un valor está presente en una lista.
-- RAISE EXCEPTION 'mensaje', NEW.metodoPago;:
--   Si se cumplen ambas condiciones (cliente en línea no físico Y método de pago no permitido),
--   se lanza una excepción, deteniendo la operación (INSERT/UPDATE) y mostrando el mensaje.
--   % en el mensaje es un marcador de posición para el valor de NEW.metodoPago.
-- RETURN NEW;:
--   Si no se lanza ninguna excepción, se retorna la fila NEW, permitiendo que la operación continúe.
-- LANGUAGE plpgsql;:
--   Especifica que el lenguaje de la función es PL/pgSQL.

-- Trigger que usa la funcion validar_metodo_pago_cliente_linea_no_fisico()
CREATE TRIGGER trg_validar_pago_cliente_linea
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION validar_metodo_pago_cliente_linea_no_fisico();

-- Documentación del Trigger:
-- CREATE TRIGGER trg_validar_pago_cliente_linea:
--   Crea un nuevo trigger con el nombre especificado.
-- BEFORE INSERT OR UPDATE ON cliente:
--   El trigger se ejecutará ANTES de cada operación de INSERT o UPDATE en la tabla "cliente".
-- FOR EACH ROW:
--   El trigger se ejecutará para cada fila individual afectada por la instrucción.
-- EXECUTE FUNCTION validar_metodo_pago_cliente_linea_no_fisico():
--   Especifica la función que el trigger debe ejecutar.

-- Trigger para verificar exlusividad en cuanto al paquete de estand.
CREATE OR REPLACE FUNCTION verificar_tipo_cliente()
RETURNS TRIGGER AS $$
DECLARE
    conteo_true INTEGER;
BEGIN
    -- Convertimos los booleanos a enteros (TRUE=1, FALSE=0, NULL=0) y los sumamos
    conteo_true := COALESCE(NEW.esClienteFisico::INT, 0) +
                   COALESCE(NEW.esClienteLinea::INT, 0);

    -- Verificamos si exactamente una opción es TRUE
    IF conteo_true < 1 THEN
        RAISE EXCEPTION 'Debe seleccionarse al menos un tipo de cliente (Linea y/o Fisico). Se encontraron % opciones marcadas como TRUE.', conteo_true;
    END IF;

    RETURN NEW; -- Permite que la operacion continue si todo esta bien.
END;
$$ LANGUAGE plpgsql;

-- Documentación de la Función:
-- CREATE OR REPLACE FUNCTION verificar_tipo_cliente():
--   Define o reemplaza una función llamada "verificar_tipo_cliente".
-- RETURNS TRIGGER:
--   Especifica que esta función está destinada a ser usada como una función de trigger.
-- AS $$ ... $$:
--   Delimita el cuerpo de la función escrito en PL/pgSQL.
-- DECLARE conteo_true INTEGER;:
--   Declara una variable local para almacenar el número de opciones verdaderas.
-- BEGIN ... END;:
--   Bloque principal de la lógica de la función.
-- conteo_true := COALESCE(NEW.esClienteFisico::INT, 0) + ...:
--   Suma los valores de las columnas booleanas.
--   NEW.columna se refiere al valor de la columna en la fila que se está insertando o actualizando.
--   ::INT convierte el booleano a entero (TRUE a 1, FALSE a 0).
--   COALESCE(..., 0) maneja el caso de que la columna sea NULL, tratándola como FALSE (0) para la suma.
-- IF conteo_true < 1 THEN RAISE EXCEPTION ...:
--   Si el número de opciones verdaderas es menor a 1, lanza una excepción
--   con un mensaje descriptivo, deteniendo la operación.
-- RETURN NEW;:
--   Si la validación pasa, la función retorna la fila (NEW), permitiendo que la operación continúe.
-- LANGUAGE plpgsql;:
--   Especifica que el lenguaje utilizado para la función es PL/pgSQL.


-- Trigger que usa la funcion verificar_tipo_cliente()
CREATE TRIGGER verificar_tipo_cliente
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION verificar_tipo_cliente();
-- Documentación del Trigger:
-- CREATE TRIGGER verificar_tipo_cliente:
--   Crea un nuevo trigger llamado "verificar_tipo_cliente".
-- BEFORE INSERT OR UPDATE ON estand:
--   Especifica que el trigger se activará antes de cualquier operación de INSERT o UPDATE en cliente.
-- FOR EACH ROW:
--   Indica que el trigger se ejecutará una vez por cada fila afectada por la operación.
-- EXECUTE FUNCTION verificar_tipo_cliente():
--   Define la función que se ejecutará cuando el trigger se active.

--Trigger para verificar que no se compren mas productos no precederos de los que se tiene en stock 
CREATE OR REPLACE FUNCTION validar_stock_no_perecedero()
RETURNS TRIGGER AS $$
DECLARE
    stock_inicial INT;
    total_comprado INT;
BEGIN
    -- Obtener la cantidad inicial del producto
    SELECT cantidadInicial INTO stock_inicial
    FROM mercanciaProductoNoPerecedero
    WHERE nombre = NEW.nombre AND tipo = NEW.tipo;

    IF stock_inicial IS NULL THEN
        RAISE EXCEPTION 'El producto % de tipo % no existe en la tabla de productos no perecederos.', NEW.nombre, NEW.tipo;
    END IF;

    -- Sumar la cantidad ya comprada de ese producto
    SELECT COALESCE(SUM(cantidadComprada), 0) INTO total_comprado
    FROM registrarCompraNoPerecedero
    WHERE nombre = NEW.nombre AND tipo = NEW.tipo;

    -- Verificar si hay suficiente stock
    IF total_comprado + NEW.cantidadComprada > stock_inicial THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto %. Stock: %, Intentado: %.',
            NEW.nombre, stock_inicial - total_comprado, NEW.cantidadComprada;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger para verificar que no se compren mas productos precederos de los que se tiene en stock 
CREATE OR REPLACE FUNCTION validar_stock_perecedero()
RETURNS TRIGGER AS $$
DECLARE
    stock_inicial INT;
    total_comprado INT;
BEGIN
    -- Obtener la cantidad inicial del producto
    SELECT cantidadInicial INTO stock_inicial
    FROM mercanciaProductoPerecedero
    WHERE nombre = NEW.nombre AND tipo = NEW.tipo;

    IF stock_inicial IS NULL THEN
        RAISE EXCEPTION 'El producto % de tipo % no existe en la tabla de productos perecederos.', NEW.nombre, NEW.tipo;
    END IF;

    -- Sumar la cantidad ya comprada de ese producto
    SELECT COALESCE(SUM(cantidadComprada), 0) INTO total_comprado
    FROM registrarCompraPerecedero
    WHERE nombre = NEW.nombre AND tipo = NEW.tipo;

    -- Verificar si hay suficiente stock
    IF total_comprado + NEW.cantidadComprada > stock_inicial THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto %. Stock: %, Intentado: %.',
            NEW.nombre, stock_inicial - total_comprado, NEW.cantidadComprada;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger que usa la funcion validar_stock_no_perecedero()
CREATE TRIGGER trg_validar_stock_no_perecedero
BEFORE INSERT OR UPDATE ON registrarCompraNoPerecedero
FOR EACH ROW
EXECUTE FUNCTION validar_stock_no_perecedero();

--Trigger que usa la funcion validar_stock_perecedero()
CREATE TRIGGER trg_validar_stock_perecedero
BEFORE INSERT OR UPDATE ON registrarCompraPerecedero
FOR EACH ROW
EXECUTE FUNCTION validar_stock_perecedero();

--Trigger que verifica que solo se guarden a los mas 20 negocios por dia 
CREATE OR REPLACE FUNCTION limitar_estands_por_agenda()
RETURNS TRIGGER AS $$
DECLARE
    total_estands INTEGER;
BEGIN
    -- Contamos cuántos estands hay ya en la misma agenda y bazar
    SELECT COUNT(*) INTO total_estands
    FROM guardarEstand
    WHERE idAgenda = NEW.idAgenda AND idBazar = NEW.idBazar;

    -- Si ya hay 20, no permitimos insertar otro
    IF total_estands >= 20 THEN
        RAISE EXCEPTION 'No se pueden asignar más de 20 estands en una misma agenda (idAgenda=% y idBazar=%).', NEW.idAgenda, NEW.idBazar;
    END IF;

    RETURN NEW; -- Todo bien, permitimos la inserción
END;
$$ LANGUAGE plpgsql;

--Trigger que usa la funcion limitar_estands_por_agenda()
CREATE TRIGGER trg_limitar_estands_por_agenda
BEFORE INSERT OR UPDATE ON guardarEstand
FOR EACH ROW
EXECUTE FUNCTION limitar_estands_por_agenda();

--Trigger que verifica que un personal medico solo sea personal medico
CREATE OR REPLACE FUNCTION verificar_unicidad_personal_medico()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica si el RFC ya existe en las otras dos tablas
    IF EXISTS (SELECT 1 FROM personalSeguridad WHERE rfc = NEW.rfc)
        OR EXISTS (SELECT 1 FROM personalLimpieza WHERE rfc = NEW.rfc) THEN
        RAISE EXCEPTION 'El RFC % ya está registrado en otra categoría de personal.', NEW.rfc;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger que usa la funcion verificar_unicidad_personal_medico()
CREATE TRIGGER trg_unicidad_personal_medico
BEFORE INSERT OR UPDATE ON personalMedico
FOR EACH ROW
EXECUTE FUNCTION verificar_unicidad_personal_medico();

--Trigger que verifica que un personal de seguridad solo sea personal de seguridad
CREATE OR REPLACE FUNCTION verificar_unicidad_personal_seguridad()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM personalMedico WHERE rfc = NEW.rfc)
        OR EXISTS (SELECT 1 FROM personalLimpieza WHERE rfc = NEW.rfc) THEN
        RAISE EXCEPTION 'El RFC % ya está registrado en otra categoría de personal.', NEW.rfc;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger que usa la funcion verificar_unicidad_personal_seguridad()
CREATE TRIGGER trg_unicidad_personal_seguridad
BEFORE INSERT OR UPDATE ON personalSeguridad
FOR EACH ROW
EXECUTE FUNCTION verificar_unicidad_personal_seguridad();

--Trigger que verifica que un personal de limpieza solo sea personal de limpieza
CREATE OR REPLACE FUNCTION verificar_unicidad_personal_limpieza()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM personalMedico WHERE rfc = NEW.rfc)
        OR EXISTS (SELECT 1 FROM personalSeguridad WHERE rfc = NEW.rfc) THEN
        RAISE EXCEPTION 'El RFC % ya está registrado en otra categoría de personal.', NEW.rfc;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger que usa la funcion verificar_unicidad_personal_limpieza()
CREATE TRIGGER trg_unicidad_personal_limpieza
BEFORE INSERT OR UPDATE ON personalLimpieza
FOR EACH ROW
EXECUTE FUNCTION verificar_unicidad_personal_limpieza();

--Trigger que verifica que el horario de un personal sea valido
CREATE OR REPLACE FUNCTION verificar_turno_valido()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT (
        (NEW.horaInicio = TIME '08:00:00' AND NEW.horaFinal = TIME '12:00:00') OR
        (NEW.horaInicio = TIME '12:00:00' AND NEW.horaFinal = TIME '16:00:00') OR
        (NEW.horaInicio = TIME '16:00:00' AND NEW.horaFinal = TIME '20:00:00')
    ) THEN
        RAISE EXCEPTION 'El horario ingresado (de % a %) no es válido. Solo se permiten los turnos: 08-12, 12-16, o 16-20.', NEW.horaInicio, NEW.horaFinal;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger que usa la funcion verificar_turno_valido para personal Medico
CREATE TRIGGER validar_turno_medico
BEFORE INSERT OR UPDATE ON personalMedico
FOR EACH ROW EXECUTE FUNCTION verificar_turno_valido();

--Trigger que usa la funcion verificar_turno_valido para personal Seguridad
CREATE TRIGGER validar_turno_seguridad
BEFORE INSERT OR UPDATE ON personalSeguridad
FOR EACH ROW EXECUTE FUNCTION verificar_turno_valido();

--Trigger que usa la funcion verificar_turno_valido para personal Limpieza
CREATE TRIGGER validar_turno_limpieza
BEFORE INSERT OR UPDATE ON personalLimpieza
FOR EACH ROW EXECUTE FUNCTION verificar_turno_valido();

--Trigger que verifica que cada negocio solo tenga 2 emprendedores
CREATE OR REPLACE FUNCTION verificar_maximo_emprendedores()
RETURNS TRIGGER AS $$
DECLARE
    total_emprendedores INT;
BEGIN
    -- Contar cuántos emprendedores ya existen para ese negocio (excluyendo al que se actualiza si aplica)
    SELECT COUNT(*) INTO total_emprendedores
    FROM emprendedor
    WHERE nombreNegocio = NEW.nombreNegocio
    AND rfc <> NEW.rfc;  -- para UPDATE, evita contarse a sí mismo

    IF (TG_OP = 'INSERT' AND total_emprendedores >= 2)
        OR (TG_OP = 'UPDATE' AND total_emprendedores >= 2) THEN
        RAISE EXCEPTION 'El negocio "%" ya tiene el número máximo de emprendedores (2).', NEW.nombreNegocio;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Trigger que usa la funcion  verificar_maximo_emprendedores()
CREATE TRIGGER trigger_verificar_maximo_emprendedores
BEFORE INSERT OR UPDATE ON emprendedor
FOR EACH ROW
EXECUTE FUNCTION verificar_maximo_emprendedores();

--Verifica que una compra de un servicio incluya servicios proporcionados por el emprendedor
CREATE OR REPLACE FUNCTION verificar_proveedor_servicio()
RETURNS TRIGGER AS $$
DECLARE
    negocio VARCHAR(50);
    existe_servicio BOOLEAN;
BEGIN
    -- Obtener el nombre del negocio del emprendedor
    SELECT e.nombreNegocio INTO negocio
    FROM ticket t
    JOIN emprendedor e ON t.rfc = e.rfc
    WHERE t.idTicket = NEW.idTicket;

    -- Validar si el servicio pertenece al negocio
    SELECT EXISTS (
        SELECT 1
        FROM proporcionarServicio ps
        WHERE ps.nombreNegocio = negocio
        AND ps.nombre = NEW.nombre
        AND ps.tipo = NEW.tipo
    ) INTO existe_servicio;

    IF NOT existe_servicio THEN
        RAISE EXCEPTION 'El servicio % (%), no está registrado en el negocio del emprendedor', NEW.nombre, NEW.tipo;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_servicio_en_negocio
BEFORE INSERT OR UPDATE ON registrarCompraServicio
FOR EACH ROW
EXECUTE FUNCTION verificar_proveedor_servicio();


--Verifica que una compra incluya productos precederos proporcionados por el emprendedor
CREATE OR REPLACE FUNCTION verificar_proveedor_perecedero()
RETURNS TRIGGER AS $$
DECLARE
    negocio VARCHAR(50);
    existe_perecedero BOOLEAN;
BEGIN
    -- Obtener el nombre del negocio del emprendedor
    SELECT e.nombreNegocio INTO negocio
    FROM ticket t
    JOIN emprendedor e ON t.rfc = e.rfc
    WHERE t.idTicket = NEW.idTicket;

    -- Validar si el servicio pertenece al negocio
    IF NOT EXISTS (
        SELECT 1
        FROM proporcionarProductoPerecedero ppp
        WHERE ppp.nombreNegocio = negocio
          AND ppp.nombre = NEW.nombre
          AND ppp.tipo = NEW.tipo
    ) THEN
        RAISE EXCEPTION 'El producto % (%), no está registrado en el negocio del emprendedor', NEW.nombre, NEW.tipo;
    END IF; 

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--DROP TRIGGER IF EXISTS trigger_verificar_proveedor_perecedero ON registrarCompraPerecedero;

CREATE TRIGGER trigger_verificar_proveedor_perecedero
BEFORE INSERT ON registrarCompraPerecedero
FOR EACH ROW
EXECUTE FUNCTION verificar_proveedor_perecedero();

--Verifica que una compra incluya productos no precederos proporcionados por el emprendedor
CREATE OR REPLACE FUNCTION verificar_proveedor_no_perecedero()
RETURNS TRIGGER AS $$
DECLARE
    negocio TEXT;
    existe_producto BOOLEAN;
    existe_nombre BOOLEAN;
    es_emprendedor_proveedor BOOLEAN;
BEGIN
    -- Si no es del tipo 'No Perecedero', no aplicar esta validación
    IF NEW.tipo <> 'No Perecedero' THEN
        RETURN NEW;
    END IF;

    -- Obtener el nombre del negocio a partir del idTicket
    SELECT e.nombreNegocio
    INTO negocio
    FROM ticket t
    JOIN emprendedor e ON t.rfc = e.rfc
    WHERE t.idTicket = NEW.idTicket;

    -- Verificar si el negocio siquiera aparece en la tabla de proveedores
    SELECT EXISTS (
        SELECT 1
        FROM proporcionarProductoNoPerecedero pnp
        WHERE pnp.nombreNegocio = negocio
    ) INTO es_emprendedor_proveedor;

    -- Si no es proveedor de productos no perecederos, no se valida nada
    IF NOT es_emprendedor_proveedor THEN
        RETURN NEW;
    END IF;

    -- Verificar si el producto y tipo están registrados
    SELECT EXISTS (
        SELECT 1
        FROM proporcionarProductoNoPerecedero pnp
        WHERE pnp.nombreNegocio = negocio
          AND pnp.nombre = NEW.nombre
          AND pnp.tipo = NEW.tipo
    ) INTO existe_producto;

    -- Verificar si al menos el nombre existe (pero con otro tipo)
    SELECT EXISTS (
        SELECT 1
        FROM proporcionarProductoNoPerecedero pnp
        WHERE pnp.nombreNegocio = negocio
          AND pnp.nombre = NEW.nombre
    ) INTO existe_nombre;

    IF NOT existe_producto THEN
        IF existe_nombre THEN
            RAISE EXCEPTION 'El producto % existe en el negocio %, pero con un tipo diferente. Revisa el campo "tipo".', NEW.nombre, negocio;
        ELSE
            RAISE EXCEPTION 'El producto % de tipo % no está registrado en el negocio del emprendedor (%).', NEW.nombre, NEW.tipo, negocio;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER validar_no_perecedero_en_negocio
BEFORE INSERT OR UPDATE ON registrarCompraServicio
FOR EACH ROW
EXECUTE FUNCTION verificar_proveedor_no_perecedero();


--Seccion de procedimeintos de almacenamiento 


--Muestra datos de los estand (precio y amenidades)
CREATE OR REPLACE PROCEDURE obtenerDatosEstand(OUT resultado REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN resultado FOR
    SELECT
        e.numeroEstand,
        e.nombreNegocio,
        CASE
            WHEN e.esEmprendedor THEN 'emprendedor'
            WHEN e.esPremium THEN 'premium'
            WHEN e.esBasico THEN 'basico'
        END AS paquete,
        CASE
            WHEN e.esEmprendedor THEN 750 * 1.3
            WHEN e.esPremium THEN 750 * 1.1
            WHEN e.esBasico THEN 750
        END::MONEY AS precio,
        CASE
            WHEN e.esEmprendedor THEN 6
            WHEN e.esPremium THEN 4
            WHEN e.esBasico THEN 2
        END AS numeroSillas,
        CASE
            WHEN e.esEmprendedor THEN 3
            WHEN e.esPremium THEN 2
            WHEN e.esBasico THEN 1
        END AS numeroMesas,
        e.esEmprendedor AS pantallaTactil,
        e.esEmprendedor AS tomaDeCorriente
    FROM estand e;
END;
$$;



--Muestra el precio total y final de los tickets
CREATE OR REPLACE PROCEDURE obtenerGananciasTicket(OUT resultado REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN resultado FOR
    SELECT
        t.idTicket,
    --Suma para obtener el precio total
    -- suma mercanciaServicio con CASE para NULL
    (
        SELECT CASE WHEN SUM(m.precio) IS NULL THEN 0::MONEY ELSE SUM(m.precio) END
        FROM registrarCompraServicio r
        JOIN mercanciaServicio m ON r.nombre = m.nombre AND r.tipo = m.tipo
        WHERE r.idTicket = t.idTicket
    ) +
    -- suma mercanciaPerecedero (precio * cantidad) con CASE para NULL
    (
        SELECT CASE WHEN SUM(m.precio * r.cantidadComprada) IS NULL THEN 0::MONEY ELSE SUM(m.precio * r.cantidadComprada) END
        FROM registrarCompraPerecedero r
        JOIN mercanciaPerecedero m ON r.nombre = m.nombre AND r.tipo = m.tipo
        WHERE r.idTicket = t.idTicket
    ) +
    -- suma mercancianNoPerecedero (precio * cantidad) con CASE para NULL
    (
        SELECT CASE WHEN SUM(m.precio * r.cantidadComprada) IS NULL THEN 0::MONEY ELSE SUM(m.precio * r.cantidadComprada) END
        FROM registrarCompraNoPerecedero r
        JOIN mercanciaNoPerecedero m ON r.nombre = m.nombre AND r.tipo = m.tipo
        WHERE r.idTicket = t.idTicket
    ) AS precioTotal,
    -- Suma el precio con 20% impuesto
    (
        (
            SELECT CASE WHEN SUM(m.precio) IS NULL THEN 0::MONEY ELSE SUM(m.precio) END
            FROM registrarCompraServicio r
            JOIN mercanciaServicio m ON r.nombre = m.nombre AND r.tipo = m.tipo
            WHERE r.idTicket = t.idTicket
        ) +
        (
            SELECT CASE WHEN SUM(m.precio * r.cantidadComprada) IS NULL THEN 0::MONEY ELSE SUM(m.precio * r.cantidadComprada) END
            FROM registrarCompraPerecedero r
            JOIN mercanciaPerecedero m ON r.nombre = m.nombre AND r.tipo = m.tipo
            WHERE r.idTicket = t.idTicket
        ) + 
        (
            SELECT CASE WHEN SUM(m.precio * r.cantidadComprada) IS NULL THEN 0::MONEY ELSE SUM(m.precio * r.cantidadComprada) END
            FROM registrarCompraNoPerecedero r
            JOIN mercanciaNoPerecedero m ON r.nombre = m.nombre AND r.tipo = m.tipo
            WHERE r.idTicket = t.idTicket
        ) 
    ) * 1.20 AS precioFinal
FROM ticket t
ORDER BY t.idTicket;
END;
$$;


--Muestra el stock de todos los negocios
CREATE OR REPLACE PROCEDURE obtenerStockNegocios(OUT resultado REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN resultado FOR
    (
    SELECT
        pnp.nombreNegocio,
        mpnp.nombre,
        mpnp.tipo,
        mpnp.categoria,
        mpnp.cantidadInicial
        -
        COALESCE(
        (SELECT SUM(rcnp.cantidadComprada)
        FROM registrarCompraNoPerecedero rcnp
        WHERE rcnp.nombre = mpnp.nombre AND rcnp.tipo = mpnp.tipo), 0
        ) AS stock,
        mpnp.precio
    FROM proporcionarProductoNoPerecedero pnp
    JOIN mercanciaProductoNoPerecedero mpnp
      ON pnp.nombre = mpnp.nombre AND pnp.tipo = mpnp.tipo
    UNION
    SELECT
        pp.nombreNegocio,
        mpp.nombre,
        mpp.tipo,
        mpp.categoria,
        mpp.cantidadInicial
        -
        COALESCE(
        (SELECT SUM(rcp.cantidadComprada)
        FROM registrarCompraPerecedero rcp
        WHERE rcp.nombre = mpp.nombre AND rcp.tipo = mpp.tipo), 0
        ) AS stock,
        mpp.precio
    FROM proporcionarProductoPerecedero pp
    JOIN mercanciaProductoPerecedero mpp
      ON pp.nombre = mpp.nombre AND pp.tipo = mpp.tipo
    );
END;
$$;