<?php
header("Access-Control-Allow-Origin: *"); // Permitir tu origen frontend
header("Access-Control-Allow-Methods: DELETE, OPTIONS"); // Permitir métodos específicos
header("Access-Control-Allow-Headers: Content-Type"); // Permitir encabezados específicos

require_once('../../config/conexion.php');

// Verificar si la solicitud es de tipo DELETE
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Obtener los datos del cuerpo de la solicitud
    $data = json_decode(file_get_contents("php://input"), true);

    // Validar que se recibió el ID del medicamento
    if (isset($data['codigo'])) {
        // Escapar el ID para prevenir inyecciones SQL
        $codigo = $conn->real_escape_string($data['codigo']);

        // Consulta para obtener la ruta del archivo de imagen antes de eliminar el medicamento
        $sql = "SELECT `imagen` FROM `medicamentos` WHERE `codigo` = '$codigo'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $imagenPath = '../../img/' . basename($row['imagen']); // Ajusta esta ruta según tu estructura

            // Eliminar el registro del medicamento
            $sqlDelete = "DELETE FROM `medicamentos` WHERE `codigo` = '$codigo'";
            if ($conn->query($sqlDelete) === TRUE) {
                // Eliminar el archivo de imagen si existe
                if (file_exists($imagenPath)) {
                    unlink($imagenPath); // Eliminar archivo
                }
                echo json_encode(["message" => "Medicamento eliminado exitosamente"]);
            } else {
                echo json_encode(["error" => "Error al eliminar medicamento: " . $conn->error]);
            }
        } else {
            echo json_encode(["error" => "Medicamento no encontrado"]);
        }
    } else {
        echo json_encode(["error" => "ID del medicamento no proporcionado"]);
    }
} else {
    echo json_encode(["error" => "Método no permitido"]);
}

$conn->close();
?>
