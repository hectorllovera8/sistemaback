<?php 

header('Content-Type: application/json');
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "control_de_inventario";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}


?>