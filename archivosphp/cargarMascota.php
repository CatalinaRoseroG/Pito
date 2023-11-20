<?php
// Conexión a la base de datos en XAMPP

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: *");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "petrescue";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consulta para obtener los datos de la tabla "animales"
$sql = "SELECT Nombre, Especie, Raza, Edad, Genero, Descripcion FROM animales";
$result = $conn->query($sql);

// Verificar si hay resultados y devolver los datos en formato JSON
if ($result->num_rows > 0) {
    $mascotas = array();
    while($row = $result->fetch_assoc()) {
        $mascota = array(
            "Nombre" => $row["Nombre"],
            "Especie" => $row["especie"],
            "raza" => $row["raza"],
            "edad" => $row["edad"],
            "genero" => $row["genero"],
            "descripcion" => $row["descripcion"]
        );
        array_push($mascotas, $mascota);
    }
    echo json_encode($mascotas);
} else {
    echo "0 resultados";
}

$conn->close();
?>
