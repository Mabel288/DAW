<?php

namespace App\Controllers;

use CodeIgniter\Controller;


class Home extends BaseController
{
    protected $db;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        // Llama al constructor de la clase padre
        parent::initController($request, $response, $logger);

        // Conexión a la base de datos
        $this->db = \Config\Database::connect();
    }
    
    public function consultarbasedatos()
    {
        
        //Consulta 1: Obtener el nombre, la descripción y el estado de todos los proyectos junto con el número de tareas asociadas
        $query_estadoProyecto = $this->db->query("
        SELECT 
        p.nombre AS nombre_proyecto,
        p.descripcion AS descripcion_proyecto,
        p.estado AS estado_proyecto,
        COUNT(t.id) AS numero_tareas_asociadas
        FROM proyectos p
        LEFT JOIN tareas t ON p.id = t.id
        GROUP BY p.id");
        $estadoProyecto = $query_estadoProyecto->getResultArray();

        //Consulta 2: Encontrar el nombre, la descripción y la fecha de inicio de los proyectos que tienen tareas pendientes
        $query_tareasPendientes = $this->db->query("
        SELECT 
        p.nombre AS nombre_proyecto,
        p.descripcion AS descripcion_proyecto,
        p.fecha_inicio AS fecha_inicio_proyecto
        FROM proyectos p
        INNER JOIN tareas t ON p.id = t.id
        WHERE t.estado = 'Pendiente';");
        $tareasPendientes = $query_tareasPendientes->getResultArray();




        //Array para devolver los datos en formato JSON Todas las Consultas
        $resultados = [
        'consulta1' => $estadoProyecto,
        'consulta2' => $tareasPendientes,
        ];

        // Devolver resultados en formato JSON
        return $this->response->setJSON($resultados);    
        
    }

    public function index(): string
    {
        return view('welcome_message');
    }
}
