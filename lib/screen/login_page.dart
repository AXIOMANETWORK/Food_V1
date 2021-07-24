import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/screen/home_page.dart';
import 'package:foodapp/screen/sing_up.dart';
import 'package:foodapp/screen/widget/my_text_field.dart';
import 'package:foodapp/services/auth.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();
  String mensaje = '';
  RegExp regExp = RegExp(SignUp.pattern);
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  final authService = Auth();

  void validation() async {
    if (correo.text.trim().isEmpty || correo.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Favor de Ingresar su Correo Electronico",
          ),
        ),
      );
      return;
    } else if (!regExp.hasMatch(correo.text)) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Favor de Ingresar un correo valido",
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Favor de Ingresar su Contraseña",
          ),
        ),
      );
      return;
    }

    mensaje = await authService.iniciarSesion(correo.text, password.text);
    if (mensaje == '') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      globalKey.currentState.showSnackBar(SnackBar(
        content: Text(
          mensaje,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Login In',
          style: TextStyle(color: Colors.orange),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  child: Center(
                    child: Image.asset('images/logo.png',
                        height: 90, width: 90, color: Colors.orange.shade700),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                MyTextField(
                    controller: correo, obscureText: false, hintText: 'Correo'),
                SizedBox(
                  height: 25,
                ),
                MyTextField(
                    controller: password,
                    obscureText: true,
                    hintText: 'Contraseña'),
              ],
            ),
            Container(
              height: 50,
              width: 200,
              child: RaisedButton(
                color: Colors.orange.shade700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  validation();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () async {
                  try {
                    await authService.signInWithFacebook();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } on PlatformException catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  "Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              child: RaisedButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () async {
                  try {
                    await authService.signInWithGoogle();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } on PlatformException catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  "Google",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nuevo usuario?", style: TextStyle(color: Colors.grey)),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 15)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text('Registrate ahora',
                        style: TextStyle(color: Colors.red)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
