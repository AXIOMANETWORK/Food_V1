import 'package:flutter/material.dart';
import 'package:foodapp/screen/widget/my_text_field.dart';

class LoginPage extends StatelessWidget {
//  Widget textField(
//      {@required String hintText,
//      @required IconData icon,
//      @required Color iconColor}) {
//    return TextFormField(
//      decoration: InputDecoration(
//        prefixIcon: Icon(
//          icon,
//          color: iconColor,
//        ),
//        hintText: hintText,
//        hintStyle: TextStyle(color: Colors.orange.shade700),
//        enabledBorder: UnderlineInputBorder(
//          borderSide: BorderSide(color: Colors.grey),
//        ),
//    ),
//   );
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {}),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                "Login In",
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MyTextField(
                    controller: null, obscureText: false, hintText: 'Correo'),
                SizedBox(
                  height: 25,
                ),
                MyTextField(
                    controller: null,
                    obscureText: true,
                    hintText: 'Contraseña'),
              ],
            ),
            Container(
              height: 60,
              width: 200,
              child: RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nuevo usuario?",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Registrate ahora",
                  style: TextStyle(color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
