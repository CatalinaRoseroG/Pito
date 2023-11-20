import 'package:flutter/material.dart';
import 'AgregarMascota.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PerfilUsuarioPage(),
    );
  }
}

class PerfilUsuarioPage extends StatefulWidget {
  @override
  _PerfilUsuarioPageState createState() => _PerfilUsuarioPageState();
}

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  bool _isAdopcionSelected = true; // Estado para controlar la opción seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Nombre del Usuario'), // Nombre del usuario ingresado
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.lightBlue, // Fondo azul cielo
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.grey[300], // Barra gris
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isAdopcionSelected = true;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Mis mascotas en adopción',
                        style: TextStyle(
                          color: _isAdopcionSelected ? Colors.lightBlue : Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 2,
                        width: 50,
                        color: _isAdopcionSelected ? Colors.lightBlue : Colors.transparent,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isAdopcionSelected = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Mascotas apadrinadas',
                        style: TextStyle(
                          color: !_isAdopcionSelected ? Colors.lightBlue : Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 2,
                        width: 50,
                        color: !_isAdopcionSelected ? Colors.lightBlue : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isAdopcionSelected) ...[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AgregarMascotaPage()),
                );
                // Lógica para "Añadir mascotas"
              },
              child: Text('Añadir mascotas'),
            ),
          ],
        ],
      ),
    );
  }
}
