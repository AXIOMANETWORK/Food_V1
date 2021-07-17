import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  Widget button({@required String name, Color color, Color textColor}) {
    return Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.orange.shade700),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset(
                  'images/logo.png',
                  height: 300,
                  width: 300,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenido a FoodClic",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  Column(
                    children: [
                      Text("Ordena la comida que quieras desde nuestra APP")
                    ],
                  ),
                  button(
                      name: 'Iniciar Sesion',
                      color: Colors.orange.shade700,
                      textColor: Colors.white),
                  button(
                      name: 'Inscribete',
                      color: Colors.white,
                      textColor: Colors.orange.shade700),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
