<?php
header("Access-Control-Allow-Origin: *"); // Allow your frontend origin
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allow specific methods
header("Access-Control-Allow-Headers: Content-Type"); // Allow specific headers

require_once('../../config/conexion.php');

// Consulta para obtener registrousuariointranet
$sql = "SELECT * FROM `registrousuariointranet`";

$result = $conn->query($sql);

$registrousuariointranet = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $registrousuariointranet[] = $row;
    }
}

echo json_encode($registrousuariointranet);
$conn->close();
?>