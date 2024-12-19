<?php
header("Access-Control-Allow-Origin: *"); // Allow your frontend origin
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allow specific methods
header("Access-Control-Allow-Headers: Content-Type"); // Allow specific headers

require_once('../../config/conexion.php');

// Consulta para obtener medicamentos
$sql = "SELECT * FROM `entrada_medicamentos`";

$result = $conn->query($sql);

$medicamentos = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $medicamentos[] = $row;
    }
}

echo json_encode($medicamentos);
$conn->close();
?>