<?php
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "petrescue";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtén datos del formulario
$nombreMascota = $_POST['Nombre'];
$especie = $_POST['Especie'];
$raza = $_POST['Raza'];
$edad = $_POST['Edad'];
$genero = $_POST['Genero'];
$descripcion = $_POST['Descripcion']; // Corregir la referencia a 'Descripcion'

// Inserta datos en la tabla animales
$sql = "INSERT INTO animales (Nombre, Especie, Raza, Edad, Genero, Descripcion) VALUES ('$nombreMascota', '$especie', '$raza', '$edad', '$genero', '$descripcion')"; // Corregir la concatenación de valores

if ($conn->query($sql) === TRUE) {
    echo "Registro exitoso";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
