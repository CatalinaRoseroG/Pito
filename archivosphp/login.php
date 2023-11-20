<?php
// Datos de conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "petrescue"; 

// Obtener los datos del formulario de inicio de sesión
$nombreUsuario = $_POST['Nombre'];
$contrasena = $_POST['Contraseña'];

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consulta SQL para verificar los datos de inicio de sesión
$sql = "SELECT * FROM usuarios WHERE Nombre = '$nombreUsuario' AND contraseña = '$contrasena'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Los datos de inicio de sesión son válidos
    echo "Usuario encontrado"; // O puedes retornar un mensaje en JSON o cualquier otro formato según tu aplicación
} else {
    // Los datos de inicio de sesión son inválidos
    echo "Usuario no encontrado"; // O el mensaje de error correspondiente
}

$conn->close();
?>


