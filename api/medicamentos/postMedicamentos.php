<?php
header("Access-Control-Allow-Origin: http://localhost:5173"); // Cambia esto al origen correcto
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once('../../config/conexion.php');

// Manejar la solicitud OPTIONS
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit; // Termina la ejecución para evitar procesar la solicitud
}

// Verificar si la solicitud es de tipo POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Verificar si el archivo se recibió correctamente
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = '../../img/';
        $fileName = basename($_FILES['imagen']['name']);
        $targetFilePath = $uploadDir . $fileName;

        // Mover el archivo cargado a la carpeta especificada
        if (move_uploaded_file($_FILES['imagen']['tmp_name'], $targetFilePath)) {
            // Escapar los datos del formulario
            $nombre = $conn->real_escape_string($_POST['nombre']);
            $principio_activo = $conn->real_escape_string($_POST['principio_activo']);
            $marca = $conn->real_escape_string($_POST['marca']);
            $laboratorio = $conn->real_escape_string($_POST['laboratorio']);
            $funcion = $conn->real_escape_string($_POST['funcion']);
            $presentacion = $conn->real_escape_string($_POST['presentacion']);
            $descripcion = $conn->real_escape_string($_POST['descripcion']);
            $forma_empaque = $conn->real_escape_string($_POST['forma_empaque']);
            $cantidad_dosis = intval($_POST['cantidad_dosis']);
            $imagen = "http://localhost/Backendmedicamentos/img/" . $fileName;

            // Insertar en la base de datos
            $sql = "INSERT INTO medicamentos (nombre, principio_activo, marca, laboratorio, funcion, presentacion, descripcion, forma_empaque, cantidad_dosis, imagen) 
                    VALUES ('$nombre', '$principio_activo', '$marca', '$laboratorio', '$funcion', '$presentacion', '$descripcion', '$forma_empaque', '$cantidad_dosis', '$imagen')";

            if ($conn->query($sql) === TRUE) {
                echo json_encode(["message" => "Medicamento agregado exitosamente."]);
                http_response_code(201);
            } else {
                echo json_encode(["error" => "Error al agregar el medicamento: " . $conn->error]);
                http_response_code(500);
            }
        } else {
            echo json_encode(["error" => "Error al subir la imagen."]);
            http_response_code(500);
        }
    } else {
        echo json_encode(["error" => "No se recibió ninguna imagen o hubo un error al subirla."]);
        http_response_code(400);
    }
} else {
    echo json_encode(["error" => "Método no permitido."]);
    http_response_code(405);
}

$conn->close();
?>
