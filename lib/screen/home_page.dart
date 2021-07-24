import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Food & Clic', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {
                  print('Boton Search');
                }),
            IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  print('Menu Food & Clic');
                })
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/comida_argentina.jpg', 'ARGENTINA'),
                _cardImagen('images/comida_brasilena.jpg', 'BRASILEÑA'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/comida_china.jpg', 'CHINA'),
                _cardImagen('images/comida_espanola.jpg', 'ESPAÑOLA'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/comida_italiana.jpg', 'ITALIANA'),
                _cardImagen('images/comida_japonesa.jpg', 'JAPONESA'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/comida_libanesa.jpeg', 'LIBANESA'),
                _cardImagen('images/comida_mexicana.jpg', 'MEXICANA'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/comida_peruana.jpg', 'PERUANA'),
                _cardImagen('images/comida_usa.jpg', 'AMERICANA')
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          //selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
          selectedItemColor: Colors.white,
          //selectedLabelStyle: TextStyle(color: Colors.black),
          iconSize: 30,
          unselectedIconTheme: IconThemeData(color: Colors.white),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: '',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.thumb_up),
                label: '',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: '',
                backgroundColor: Colors.blue)
          ],
        ));
  }

  Widget _cardImagen(String url, String comida) {
    return InkWell(
      onTap: () {
        print('Clickeaste en $comida');
      },
      child: Card(
        elevation: 10.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("$url"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          height: 80,
          width: 170,
          child: Center(
            child: Stack(
              children: <Widget>[
                Text(
                  comida,
                  style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.black,
                  ),
                ),
                Text(
                  comida,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
