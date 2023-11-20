import 'package:flutter/material.dart';
import 'package:inicio/AgregarMascota.dart';
import 'PerfilUsuario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaPrincipalPage(),
    );
  }
}

class PaginaPrincipalPage extends StatefulWidget {
  @override
  _PaginaPrincipalPageState createState() => _PaginaPrincipalPageState();
}

class _PaginaPrincipalPageState extends State<PaginaPrincipalPage>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // Color de la barra superior
        title: Center(
          child: Icon(
            Icons.pets,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person), // Icono de usuario
            color: Colors.black,
            onPressed: () {
              // Acción al presionar el icono de usuario
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilUsuarioPage()),
              );    
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              // Acción al presionar "Añadir Mascota"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgregarMascotaPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue, // Color de fondo del botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Añadir Mascota',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


