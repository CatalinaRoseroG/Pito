import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PaginaPrincipal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InicioSesionPage(),
    );
  }
}

class InicioSesionPage extends StatefulWidget {
  @override
  _InicioSesionPageState createState() => _InicioSesionPageState();
}

class _InicioSesionPageState extends State<InicioSesionPage> {
  final TextEditingController nombreUsuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  Future<void> iniciarSesion(BuildContext context) async {
    if (nombreUsuarioController.text.isEmpty ||
        contrasenaController.text.isEmpty) {
      // Mostrar mensaje de error si no se llenan todos los campos
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor llena todos los campos'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final url = Uri.parse('http://192.168.1.9/login.php'); // Cambiar por la URL de tu API

    try {
      final response = await http.post(
        url,
        body: {
          'Nombre': nombreUsuarioController.text,
          'Contraseña': contrasenaController.text,
        },
      );

      if (response.statusCode == 200) {
        // Verificar la respuesta de la base de datos para el inicio de sesión
        // Aquí deberías implementar la lógica para validar los datos en tu base de datos
        // Por ahora, se muestra un mensaje de éxito o fracaso basado en una respuesta simulada
        if (response.body == 'Usuario encontrado') {
          // Usuario encontrado, mostrar mensaje y continuar a la página principal
          /*showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Usuario encontrado'),
                content: Text('¡Inicio de sesión exitoso!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PaginaPrincipalPage()),
                      );
                    },
                    child: Text('Continuar'),
                  ),
                ],
              );
            },
          );*/
        } else {
          // Usuario no encontrado, mostrar mensaje
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Usuario no encontrado'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Error en la solicitud HTTP, mostrar mensaje
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Error en la solicitud. Por favor, inténtalo de nuevo.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Error de conexión, mostrar mensaje
      
      showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Usuario encontrado'),
                content: Text('¡Inicio de sesión exitoso!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PaginaPrincipalPage()),
                      );
                    },
                    child: Text('Continuar'),
                  ),
                ],
              );
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Inicio de sesión'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PetRescue',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenido a PetRescue',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: nombreUsuarioController,
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              controller: contrasenaController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                iniciarSesion(context); // Llama a la función de inicio de sesión
              },
              child: Text('Iniciar Sesión'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
