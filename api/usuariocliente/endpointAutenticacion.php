<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once('../../config/conexion.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data['usuario']) && isset($data['contrasena'])) {
        $usuario = $data['usuario'];
        $contrasena = $data['contrasena'];

        $stmt = $conn->prepare("SELECT * FROM `registrousuariointranet` WHERE `usuario` = ? LIMIT 1");
        $stmt->bind_param("s", $usuario);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            
            if (password_verify($contrasena, $row['contrasena'])) {
                echo json_encode(["success" => true, "message" => "Inicio de sesión exitoso", "user" => $row]);
            } else {
                echo json_encode([
                    "success" => false, 
                    "error" => "Contraseña Inválida",
                    "errorType" => "password",
                    "errorMessage" => "La contraseña ingresada es incorrecta. Por favor, inténtelo de nuevo."
                ]);
            }
        } else {
            echo json_encode([
                "success" => false, 
                "error" => "Usuario inválido",
                "errorType" => "user",
                "errorMessage" => "El usuario ingresado no existe en nuestro sistema. Verifique el nombre de usuario o regístrese si aun no es un usuario."
            ]);
        }

        $stmt->close();
    } else {
        echo json_encode([
            "success" => false, 
            "error" => "Datos incompletos",
            "errorType" => "incomplete",
            "errorMessage" => "Por favor, complete todos los campos requeridos."
        ]);
    }
} else {
    echo json_encode([
        "success" => false, 
        "error" => "Método no permitido",
        "errorType" => "method",
        "errorMessage" => "El método de solicitud no está permitido. Use POST para iniciar sesión."
    ]);
}

$conn->close();
?>