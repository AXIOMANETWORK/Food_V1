import 'package:flutter/material.dart';
import 'package:foodapp/screen/login_page.dart';
import 'package:foodapp/screen/sing_up.dart';

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
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('images/logo.png',
                    height: 300, width: 300, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Bienvenido a FoodClic",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text("Ordena la comida que quieras desde nuestra APP",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 50,
                          width: 300,
                          child: RaisedButton(
                            color: Colors.orange.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Iniciar Sesion",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 50,
                          width: 300,
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Inscribete",
                              style: TextStyle(
                                  color: Colors.orange.shade700, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
