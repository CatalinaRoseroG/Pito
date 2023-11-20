import 'package:flutter/material.dart';
import 'package:inicio/InicioSesion.dart';
import 'package:inicio/Registro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            Container(
              width: 100, 
              height: 100, 
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, 
              ),
              child: Center(
                child: Icon(
                  Icons.pets,
                  color: Colors.white,
                  size: 60, 
                ),
              ),
            ),
            SizedBox(height: 20), 

            
            Text(
              'PetRescue',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            SizedBox(height: 20), 

            // Botón "Iniciar Sesión" 
            ElevatedButton(
              onPressed: () {
                // Agregar acción al presionar el botón
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => InicioSesionPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ) 
              ),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(
                  color: Colors.black, 
                ),
              ),
            ),
            SizedBox(height: 10), 

            // Texto "No tienes una cuenta?" 
            Text(
              'No tienes una cuenta?',
              style: TextStyle(
                color: Colors.black, // Color negro
              ),
            ),
           
            TextButton(
              onPressed: () {
                // Agregar acción al presionar el botón de texto
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> RegistroPage()),
                  );
              },
              child: Text(
                'Registrarse',
                style: TextStyle(
                  color: Colors.white, 
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

