import 'package:flutter/material.dart';
////Tarea 2:
//Integrantes:
//Hernandes Esteban Daniel; danylechuga00@gmail.com
//Hernández Hernández Rodrigo; masterm7481@gmail.com
//Zarate Carvajal Rodrigo; rodrigozar7@gmail.com

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Tarea 2",
        ),
      ),
      body: Center(
          child: Container(
              height: 220,
              width: 220,
              color: Colors.red[900],
              transform: Matrix4.rotationZ(.8),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    //transform: Matrix4.rotationZ(-.8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Text("  Daniel   Rodrigo Rodrigo"),
                    height: 100,
                    width: 100,
                  )))),
    ));
  }
}

void main() {
  runApp(Screen());
}
