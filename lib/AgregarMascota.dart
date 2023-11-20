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
      home: AgregarMascotaPage(),
    );
  }
}

class AgregarMascotaPage extends StatefulWidget {
  @override
  _AgregarMascotaPageState createState() => _AgregarMascotaPageState();
}

class _AgregarMascotaPageState extends State<AgregarMascotaPage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController especieController = TextEditingController();
  final TextEditingController razaController = TextEditingController();
  final TextEditingController edadController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();

  Future<void> registrarMascota(BuildContext context) async {
    if (nombreController.text.isEmpty ||
        especieController.text.isEmpty ||
        razaController.text.isEmpty ||
        edadController.text.isEmpty ||
        generoController.text.isEmpty ||
        descripcionController.text.isEmpty) {
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

    final url = Uri.parse('http://192.168.1.9/guardar_mascota.php'); // Cambiar por la URL de tu API

    try {
      final response = await http.post(
        url,
        body: {
          'Nombre': nombreController.text,
          'Especie': especieController.text,
          'Raza': razaController.text,
          'Edad': edadController.text,
          'Genero': generoController.text,
          'Descripcion': descripcionController.text,
        },
      );

      if (response.statusCode == 200) {
        // Registro exitoso, mostrar mensaje y redirigir a la página principal

 

        
      } else {
        // Error en el registro, mostrar mensaje
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Error en el registro. Por favor, inténtalo de nuevo.'),
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
      print('Error: $e');
      // Error de conexión, mostrar mensaje
         showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registro exitoso'),
              content: Text('¡Tu registro ha sido exitoso!'),
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
        title: Text('Añadir Mascota'),
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
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: especieController,
              decoration: InputDecoration(labelText: 'Especie'),
            ),
            TextField(
              controller: razaController,
              decoration: InputDecoration(labelText: 'Raza'),
            ),
            TextField(
              controller: edadController,
              decoration: InputDecoration(labelText: 'Edad'),
            ),
            TextField(
              controller: generoController,
              decoration: InputDecoration(labelText: 'Genero'),
            ),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                registrarMascota(context); // Llama a la función de registro
              },
              child: Text('Guardar'),
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


