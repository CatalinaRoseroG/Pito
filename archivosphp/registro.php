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
$nombreUsuario = $_POST['Nombre'];
$correo = $_POST['Email'];
$contrasena = $_POST['Contraseña'];

// Inserta datos en la tabla usuarios
$sql = "INSERT INTO usuarios (Nombre, Email, Contraseña) VALUES ('$nombreUsuario', '$correo', '$contrasena')";

if ($conn->query($sql) === TRUE) {
    echo "Registro exitoso";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
