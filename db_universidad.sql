CREATE DATABASE db_universidad;

-- Tabla "proyectos"
CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_inicio DATE NOT NULL,
    estado VARCHAR(20) NOT NULL
);

-- Tabla "tareas"
CREATE TABLE tareas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_limite DATE NOT NULL,
    estado VARCHAR(20) NOT NULL
);

-- Datos para la Tabla "proyectos"
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, estado) VALUES
('Proyecto A', 'Desarrollo de una aplicación móvil', '2023-01-15', 'En curso'),
('Proyecto B', 'Implementación de un sistema de gestión de inventario', '2022-09-10', 'Completado'),
('Proyecto C', 'Diseño de una plataforma de e-learning', '2022-03-10', 'Pendiente'),
('Proyecto D', 'Investigación sobre inteligencia artificial', '2023-08-15', 'Pendiente'),
('Proyecto E', 'Creación de un sitio web corporativo', '2023-02-01', 'En curso'),
('Proyecto F', 'Desarrollo de un juego para dispositivos móviles', '2023-06-20', 'En curso'),
('Proyecto G', 'Implementación de un sistema de CRM', '2023-10-10', 'Completado'),
('Proyecto H', 'Diseño de una base de datos distribuida', '2022-05-01', 'Pendiente'),
('Proyecto I', 'Desarrollo de un sistema de gestión de proyectos', '2022-12-20', 'Pendiente'),
('Proyecto J', 'Investigación sobre nuevas tecnologías emergentes', '2023-03-10', 'En curso');


-- Datos para la Tabla "tareas"
INSERT INTO tareas (nombre, descripcion, fecha_limite, estado) VALUES
('Tarea 1', 'Implementar la funcionalidad de inicio de sesión', '2023-01-31', 'En proceso'),
('Tarea 2', 'Diseñar la interfaz de usuario principal', '2023-03-15', 'Pendiente'),
('Tarea 3', 'Desarrollar el módulo de gestión de usuarios', '2023-03-31', 'Pendiente'),
('Tarea 4', 'Realizar pruebas de rendimiento y seguridad', '2023-02-28', 'En proceso'),
('Tarea 5', 'Actualizar la documentación del proyecto', '2023-04-01', 'Pendiente'),
('Tarea 6', 'Optimizar el rendimiento del servidor', '2023-05-15', 'Completada'),
('Tarea 7', 'Agregar funcionalidad de carrito de compras', '2023-06-01', 'Pendiente'),
('Tarea 8', 'Realizar pruebas de integración con sistemas externos', '2023-03-20', 'Pendiente'),
('Tarea 9', 'Implementar el sistema de almacenamiento en la nube', '2023-02-15', 'Pendiente'),
('Tarea 10', 'Actualizar la interfaz de usuario con comentarios de los usuarios', '2023-04-20', 'Pendiente');

--Consulta 1

SELECT 
    p.nombre AS nombre_proyecto,
    p.descripcion AS descripcion_proyecto,
    p.estado AS estado_proyecto,
    COUNT(t.id) AS numero_tareas_asociadas
FROM proyectos p
LEFT JOIN tareas t ON p.id = t.id
GROUP BY p.id;

--Consulta 2

SELECT 
    p.nombre AS nombre_proyecto,
    p.descripcion AS descripcion_proyecto,
    p.fecha_inicio AS fecha_inicio_proyecto
FROM proyectos p
INNER JOIN tareas t ON p.id = t.id
WHERE t.estado = 'Pendiente';
