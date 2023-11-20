import 'package:flutter/material.dart';

class PerfilMascota extends StatelessWidget {
  final String nombre;
  final String especie;
  final String raza;
  final String edad;
  final String genero;
  final String descripcion;

  PerfilMascota({
    required this.nombre,
    required this.especie,
    required this.raza,
    required this.edad,
    required this.genero,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Mascota'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Acción al presionar el botón de añadir
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre: $nombre',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Especie: $especie'),
            SizedBox(height: 10),
            Text('Raza: $raza'),
            SizedBox(height: 10),
            Text('Edad: $edad'),
            SizedBox(height: 10),
            Text('Género: $genero'),
            SizedBox(height: 10),
            Text('Descripción: $descripcion'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PerfilMascota(
        nombre: 'Nombre de la mascota',
        especie: 'Especie',
        raza: 'Raza',
        edad: 'Edad',
        genero: 'Género',
        descripcion: 'Descripción',
      ),
    );
  }
}
