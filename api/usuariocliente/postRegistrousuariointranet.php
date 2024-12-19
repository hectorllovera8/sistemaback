<?php
header("Access-Control-Allow-Origin: *"); // Permitir tu origen frontend
header("Access-Control-Allow-Methods: POST, OPTIONS"); // Permitir métodos específicos
header("Access-Control-Allow-Headers: Content-Type"); // Permitir encabezados específicos

require_once('../../config/conexion.php'); // Asegúrate de tener la conexión configurada

// Verificar si la solicitud es de tipo POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del cuerpo de la solicitud
    $data = json_decode(file_get_contents("php://input"), true);

    // Validar que se recibieron los datos necesarios
    if (isset($data['nombres']) && isset($data['apellidos']) &&
        isset($data['usuario']) && isset($data['correo']) &&
        isset($data['telefono']) && isset($data['perfil_usuario']) &&
        isset($data['contrasena'])) {

        // Escapar los datos para prevenir inyecciones SQL
        $nombres = $conn->real_escape_string($data['nombres']);
        $apellidos = $conn->real_escape_string($data['apellidos']);
        $usuario = $conn->real_escape_string($data['usuario']);
        $correo = $conn->real_escape_string($data['correo']);
        $telefono = $conn->real_escape_string($data['telefono']);
        $perfil_usuario = $conn->real_escape_string($data['perfil_usuario']);
        $contrasena = password_hash($conn->real_escape_string($data['contrasena']), PASSWORD_BCRYPT); // Encriptar contraseña

        // Consulta para insertar un nuevo usuario
        $sql = "INSERT INTO `registrousuariointranet` (`nombres`, `apellidos`, `usuario`, `correo`, `telefono`, `perfil_usuario`, `contrasena`) 
                VALUES ('$nombres', '$apellidos', '$usuario', '$correo', '$telefono', '$perfil_usuario', '$contrasena')";

        // Ejecutar consulta y responder
        if ($conn->query($sql) === TRUE) {
            echo json_encode(["success" => true, "message" => "Usuario registrado exitosamente"]);
        } else {
            echo json_encode(["success" => false, "error" => "Error al registrar usuario: " . $conn->error]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "Datos incompletos"]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Método no permitido"]);
}

// Cerrar conexión
$conn->close();
?>
