import 'package:flutter/material.dart';
import 'package:foodapp/screen/home_page.dart';
import 'package:foodapp/screen/widget/my_text_field.dart';
import 'package:foodapp/services/auth.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //UserCredential userCredential;
  String name = '';
  RegExp regExp = RegExp(SignUp.pattern);
  TextEditingController nombres = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  final authService = Auth();

  void validation() {
    if (nombres.text.trim().isEmpty || nombres.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Favor de Ingresar su Nombre(s)",
          ),
        ),
      );
      return;
    }
    if (apellidos.text.trim().isEmpty || apellidos.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Favor de Ingresar sus Apellidos",
          ),
        ),
      );
      return;
    }
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
  }

  Widget button(
      {@required String buttonName,
      @required Color color,
      @required Color textColor,
      @required Function ontap}) {
    return Container(
      width: 130,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
        onPressed: ontap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sign In',
          style: TextStyle(color: Colors.orange),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  "Food & Clic",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: nombres,
                      obscureText: false,
                      hintText: "Nombre(s)",
                    ),
                    MyTextField(
                      controller: apellidos,
                      obscureText: false,
                      hintText: "Apellidos",
                    ),
                    MyTextField(
                      controller: correo,
                      obscureText: false,
                      hintText: "Correo",
                    ),
                    MyTextField(
                      controller: password,
                      obscureText: true,
                      hintText: "Contraseña",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                      ontap: () {
                        Navigator.pop(context);
                      },
                      buttonName: "Cancelar",
                      color: Colors.grey,
                      textColor: Colors.black),
                  SizedBox(
                    width: 20,
                  ),
                  button(
                      ontap: () {
                        validation();
                        name = nombres.text + ' ' + apellidos.text;
                        print(name);
                        authService.registrar(correo.text, password.text, name);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      buttonName: "Registrar",
                      color: Colors.orange.shade700,
                      textColor: Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
