<?php
header("Access-Control-Allow-Origin: http://localhost:5173"); // Cambia esto al origen correcto
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

require_once('../../config/conexion.php'); // Asegúrate de que este archivo esté configurado correctamente

// Manejar la solicitud OPTIONS
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Verificar si la solicitud es de tipo POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['codigo'])) {
        $codigo = $conn->real_escape_string($_POST['codigo']);
        $nombre = $conn->real_escape_string($_POST['nombre']);
        $principio_activo = $conn->real_escape_string($_POST['principio_activo']);
        $marca = $conn->real_escape_string($_POST['marca']);
        $laboratorio = $conn->real_escape_string($_POST['laboratorio']);
        $funcion = $conn->real_escape_string($_POST['funcion']);
        $presentacion = $conn->real_escape_string($_POST['presentacion']);
        $descripcion = $conn->real_escape_string($_POST['descripcion']);
        $forma_empaque = $conn->real_escape_string($_POST['forma_empaque']);
        $cantidad_dosis = intval($_POST['cantidad_dosis']);
        $imagen = null;

        // Verificar si se cargó una imagen
        if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
            $uploadDir = '../../img/';
            $fileName = basename($_FILES['imagen']['name']);
            $targetFilePath = $uploadDir . $fileName;

            if (move_uploaded_file($_FILES['imagen']['tmp_name'], $targetFilePath)) {
                $imagen = "http://localhost/Backendmedicamentos/img/" . $fileName;
            } else {
                echo json_encode(["error" => "Error al mover la imagen a la carpeta."]);
                http_response_code(500);
                exit;
            }
        }

        // Actualizar en la base de datos
        $sql = "UPDATE medicamentos SET 
                    nombre = '$nombre', 
                    principio_activo = '$principio_activo', 
                    marca = '$marca', 
                    laboratorio = '$laboratorio', 
                    funcion = '$funcion', 
                    presentacion = '$presentacion', 
                    descripcion = '$descripcion', 
                    forma_empaque = '$forma_empaque', 
                    cantidad_dosis = '$cantidad_dosis'";

        if ($imagen) {
            $sql .= ", imagen = '$imagen'";
        }

        $sql .= " WHERE codigo = '$codigo'";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Medicamento actualizado exitosamente."]);
            http_response_code(200);
        } else {
            echo json_encode(["error" => "Error al actualizar el medicamento: " . $conn->error]);
            http_response_code(500);
        }
    } else {
        echo json_encode(["error" => "Datos incompletos."]);
        http_response_code(400);
    }
} else {
    echo json_encode(["error" => "Método no permitido."]);
    http_response_code(405);
}
?>
