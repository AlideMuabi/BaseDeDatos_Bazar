-- Query.sql

-- 1 Consultar el listado completo de productos disponibles en el bazar;

SELECT 'Perecedero' AS categoria, nombre, tipo
FROM mercanciaProductoPerecedero

UNION

SELECT 'No Perecedero' AS categoria, nombre, tipo
FROM mercanciaProductoNoPerecedero

UNION

SELECT 'Servicio' AS categoria, nombre, tipo
FROM mercanciaServicio

ORDER BY categoria, nombre;

-- 2 Consultar las ventas realizadas por un vendedor específico;

SELECT t.idTicket, t.idCliente, e.nombre, e.apellidoPaterno, e.apellidoMaterno
FROM ticket t
JOIN emprendedor e ON t.rfc = e.rfc
WHERE t.rfc = 'WHJN187638D2H'; -- Reemplazar si se desea probar con otro emprendedor

-- 3 Identificar los productos más vendidos

SELECT * FROM (
    -- Productos perecederos
    SELECT nombre, tipo, SUM(cantidadComprada) AS total_vendido
    FROM registrarCompraPerecedero
    GROUP BY nombre, tipo

    UNION ALL

    -- Productos no perecederos
    SELECT nombre, tipo, SUM(cantidadComprada) AS total_vendido
    FROM registrarCompraNoPerecedero
    GROUP BY nombre, tipo
) AS productos
ORDER BY total_vendido DESC LIMIT 30;

-- 4 Detectar productos con baja rotación

SELECT * FROM (
    -- Productos perecederos
    SELECT nombre, tipo, SUM(cantidadComprada) AS total_vendido
    FROM registrarCompraPerecedero
    GROUP BY nombre, tipo

    UNION ALL

    -- Productos no perecederos
    SELECT nombre, tipo, SUM(cantidadComprada) AS total_vendido
    FROM registrarCompraNoPerecedero
    GROUP BY nombre, tipo
) AS productos
ORDER BY total_vendido ASC
LIMIT 30;

-- 5 Identificar productos perecederos que están por vencer en los próximos 18 meses
SELECT 	
	nombre, 
	tipo, 
	fechacaducidad, 
	(fechacaducidad-CURRENT_DATE) as dias_restantes
FROM mercanciaProductoPerecedero 
WHERE fechaCaducidad BETWEEN CURRENT_DATE AND (CURRENT_DATE + INTERVAL '18 months')
ORDER BY dias_restantes ASC;

-- 6 Clientes con más compras

SELECT c.idCliente, c.nombre, c.apellidoPaterno, c.apellidoMaterno,
       COUNT(t.idTicket) AS total_compras
FROM cliente c
JOIN ticket t ON c.idCliente = t.idCliente
GROUP BY c.idCliente, c.nombre, c.apellidoPaterno, c.apellidoMaterno
ORDER BY total_compras DESC
LIMIT 30;

-- 7 Negocios con mas ingresos generados en Productos Perecederos

SELECT ppp.nombreNegocio, SUM(mp.precio * rcp.cantidadComprada) AS ingresos
FROM registrarCompraPerecedero rcp
JOIN mercanciaProductoPerecedero mp ON rcp.nombre = mp.nombre
JOIN proporcionarProductoPerecedero ppp ON rcp.nombre = ppp.nombre
GROUP BY ppp.nombreNegocio
ORDER BY ingresos DESC
LIMIT 45;

-- 8 Total Generado de Productos Perecederos vendidos por fechas de bazares

SELECT 
    b.idBazar,
    b.fechaInicio,
    b.fechaFin,
    SUM(mp.precio * r.cantidadComprada) AS total_generado
FROM registrarCompraPerecedero r
JOIN mercanciaProductoPerecedero mp 
    ON r.nombre = mp.nombre
JOIN tenerNegocio tn 
    ON tn.nombreNegocio IN (
        SELECT nombreNegocio 
        FROM proporcionarProductoPerecedero 
        WHERE nombre = r.nombre
    )
JOIN bazar b 
    ON tn.idBazar = b.idBazar
GROUP BY b.idBazar, b.fechaInicio, b.fechaFin
ORDER BY total_generado DESC;

-- 9 Asistencia de clientes a eventos del bazar

SELECT 
    c.nombre,
    c.apellidoPaterno,
    c.idCliente,
    COUNT(DISTINCT a.idBazar) AS veces_asistio
FROM asistir a
JOIN cliente c ON a.idCliente = c.idCliente
GROUP BY c.nombre, c.apellidoPaterno, c.idCliente
ORDER BY veces_asistio DESC;

-- 10 Personal del bazar con más eventos trabajados

-- Personal de Limpieza
SELECT 
    'Limpieza' AS tipo_personal,
    pl.nombre,
    pl.apellidoPaterno,
    pl.rfc,
    COUNT(tl.idBazar) AS veces_trabajadas
FROM trabajarLimpieza tl
JOIN personalLimpieza pl ON tl.rfc = pl.rfc
GROUP BY pl.nombre, pl.apellidoPaterno, pl.rfc
ORDER BY veces_trabajadas DESC
LIMIT 30;

-- Personal de Seguridad
SELECT 
    'Seguridad' AS tipo_personal,
    ps.nombre,
    ps.apellidoPaterno,
    ps.rfc,
    COUNT(ts.idBazar) AS veces_trabajadas
FROM trabajarSeguridad ts
JOIN personalSeguridad ps ON ts.rfc = ps.rfc
GROUP BY ps.nombre, ps.apellidoPaterno, ps.rfc
ORDER BY veces_trabajadas DESC
LIMIT 30;

-- Personal Médico
SELECT 
    'Médico' AS tipo_personal,
    pm.nombre,
    pm.apellidoPaterno,
    pm.rfc,
    COUNT(tm.idBazar) AS veces_trabajadas
FROM trabajarMedico tm
JOIN personalMedico pm ON tm.rfc = pm.rfc
GROUP BY pm.nombre, pm.apellidoPaterno, pm.rfc
ORDER BY veces_trabajadas DESC
LIMIT 30;

-- 11 Negocios con más variedad de productos ofrecidos

SELECT 
    nombreNegocio,
    SUM(cantidad_productos) AS total_productos
FROM (
    SELECT 
        nombreNegocio,
        COUNT(DISTINCT nombre) AS cantidad_productos
    FROM proporcionarProductoPerecedero
    GROUP BY nombreNegocio

    UNION ALL

    SELECT 
        nombreNegocio,
        COUNT(DISTINCT nombre) AS cantidad_productos
    FROM proporcionarProductoNoPerecedero
    GROUP BY nombreNegocio
) AS combinados
GROUP BY nombreNegocio
ORDER BY total_productos DESC
LIMIT 30;

-- 12 Bazares más concurridos por clientes

SELECT 
    b.idBazar,
    b.fechaInicio,
    b.fechaFin,
    COUNT(a.idCliente) AS total_clientes
FROM asistir a
JOIN bazar b ON a.idBazar = b.idBazar
GROUP BY b.idBazar, b.fechaInicio, b.fechaFin
ORDER BY total_clientes DESC
LIMIT 30;

-- 13 Clientes que no han realizado ninguna compra

SELECT c.idCliente, c.nombre, c.apellidoPaterno, c.apellidoMaterno
FROM cliente c
WHERE c.idCliente NOT IN (
    SELECT DISTINCT idCliente FROM ticket
);

-- 14 Productos vendidos más caros (Perecederos y No Perecederos)

SELECT 
    rcp.nombre,
    rcp.tipo,
    mp.precio,
    rcp.cantidadComprada,
    'Perecedero' AS categoria
FROM registrarCompraPerecedero rcp
JOIN mercanciaProductoPerecedero mp ON rcp.nombre = mp.nombre

UNION ALL

SELECT 
    rcnp.nombre,
    rcnp.tipo,
    mpnp.precio,
    rcnp.cantidadComprada,
    'No Perecedero' AS categoria
FROM registrarCompraNoPerecedero rcnp
JOIN mercanciaProductoNoPerecedero mpnp ON rcnp.nombre = mpnp.nombre

ORDER BY precio DESC
LIMIT 30;

-- 15 Mostrar información sobre las compras de productos de un cliente

SELECT 
    c.idCliente,
    c.nombre AS nombreCliente,
    t.idTicket,
    rcp.nombre AS nombreProducto,
    rcp.cantidadComprada,
    'Perecedero' AS tipoProducto
FROM cliente c
JOIN ticket t ON c.idCliente = t.idCliente
JOIN registrarCompraPerecedero rcp ON t.idTicket = rcp.idTicket
WHERE c.idCliente = 5

UNION ALL

SELECT 
    c.idCliente,
    c.nombre AS nombreCliente,
    t.idTicket,
    rcnp.nombre AS nombreProducto,
    rcnp.cantidadComprada,
    'No Perecedero' AS tipoProducto
FROM cliente c
JOIN ticket t ON c.idCliente = t.idCliente
JOIN registrarCompraNoPerecedero rcnp ON t.idTicket = rcnp.idTicket
WHERE c.idCliente = 5

ORDER BY idTicket;

--16 Muestra la cantidad de tickets de cada cliente

SELECT 
    c.idCliente, 
    c.nombre AS nombreCliente
FROM cliente c

UNION ALL 

SELECT COUNT(idTicket) AS total_tickets
FROM ticket

GROUP BY idCliente
HAVING COUNT(idTicket) >= 1
ORDER BY total_tickets DESC
LIMIT 30;


-- 17 Muestra la suma total de las ventas de los productos perecederos

SELECT 
  rcp.nombre, 
  rcp.tipo, 
  SUM(rcp.cantidadComprada) AS total_vendida,
  SUM(rcp.cantidadComprada * mpp.precio) AS total_dinero
FROM registrarCompraPerecedero rcp
JOIN mercanciaProductoPerecedero mpp 
  ON rcp.nombre = mpp.nombre AND rcp.tipo = mpp.tipo
GROUP BY rcp.nombre, rcp.tipo
ORDER BY total_dinero DESC
LIMIT 30;

-- 18 Muestra la suma total de las ventas de los productos no perecederos

SELECT 
  rcn.nombre, 
  rcn.tipo, 
  SUM(rcn.cantidadComprada) AS total_vendida,
  SUM(rcn.cantidadComprada * mpnp.precio) AS total_dinero
FROM registrarCompraNoPerecedero rcn
JOIN mercanciaProductoNoPerecedero mpnp 
  ON rcn.nombre = mpnp.nombre AND rcn.tipo = mpnp.tipo
GROUP BY rcn.nombre, rcn.tipo
ORDER BY total_dinero DESC
LIMIT 30;

-- 19 Muestra los tickets y dinero generados por cada emprendedor

SELECT 
  e.rfc,
  e.nombreNegocio,
  COUNT(t.idTicket) AS total_tickets,
  COALESCE(SUM(rcp.cantidadComprada * mpp.precio), 0::money) AS total_dinero
FROM ticket t
JOIN emprendedor e ON t.rfc = e.rfc
LEFT JOIN registrarCompraPerecedero rcp ON t.idTicket = rcp.idTicket
LEFT JOIN mercanciaProductoPerecedero mpp 
  ON rcp.nombre = mpp.nombre AND rcp.tipo = mpp.tipo
GROUP BY e.rfc, e.nombreNegocio
ORDER BY total_tickets DESC, total_dinero DESC
LIMIT 30;

-- 20 Muestra los bazares con más ventas

SELECT 
  b.idBazar,
  b.fechaInicio AS desde,
  b.fechaFin AS hasta,
  SUM(rcp.cantidadComprada * mpp.precio) AS total_vendido
FROM tenerNegocio tn
JOIN bazar b ON tn.idBazar = b.idBazar
JOIN emprendedor e ON tn.nombreNegocio = e.nombreNegocio
JOIN ticket t ON e.rfc = t.rfc
JOIN registrarCompraPerecedero rcp ON t.idTicket = rcp.idTicket
JOIN mercanciaProductoPerecedero mpp ON rcp.nombre = mpp.nombre AND rcp.tipo = mpp.tipo
GROUP BY b.idBazar, b.fechaInicio
ORDER BY total_vendido DESC
LIMIT 30;

