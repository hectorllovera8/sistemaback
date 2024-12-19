<?php
header("Access-Control-Allow-Origin: *"); // Permitir cualquier origen
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Permitir métodos específicos
header("Access-Control-Allow-Headers: Content-Type"); // Permitir encabezados específicos

require_once('../../config/conexion.php');

// Obtener el código del medicamento de la solicitud GET
$id = isset($_GET['codigo']) ? intval($_GET['codigo']) : 0;

if ($id > 0) {
    // Consulta para obtener medicamentos
    $sql = "SELECT * FROM `medicamentos` WHERE codigo = ?;";

    // Preparar la declaración
    if ($stmt = $conn->prepare($sql)) {
        // Vincular parámetros
        $stmt->bind_param("i", $id);

        // Ejecutar la consulta
        $stmt->execute();
        
        // Obtener el resultado 
        $result = $stmt->get_result();

        // Inicializar array para medicamentos
        $medicamentos = [];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $medicamentos[] = $row;
            }
        }

        // Liberar resultados
        $result->free();

        // Devolver resultados como JSON
        echo json_encode($medicamentos, JSON_UNESCAPED_UNICODE);
        
        // Cerrar la declaración 
        $stmt->close();
    } else {
        echo json_encode(['error' => 'Error en la consulta']);
    }
} else {
    echo json_encode(['error' => 'CÓDIGO de medicamento no válido']);
}

// Cerrar conexión
$conn->close();
?>