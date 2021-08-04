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
                _cardImagen('images/Americana.jpg', 'Americana'),
                _cardImagen('images/Arabe.jpg', 'Arabe'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/Argentina.jpg', 'Argentina'),
                _cardImagen('images/Brasilena.jpg', 'Brasileña'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/China.jpg', 'China'),
                _cardImagen('images/Cubana.jpg', 'Cubana'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/Espanola.jpg', 'Española'),
                _cardImagen('images/Griega.jpg', 'Griega'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/India.jpg', 'India'),
                _cardImagen('images/Italiana.jpg', 'Italiana')
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/Japonesa.jpg', 'Japonesa'),
                _cardImagen('images/Libanesa.jpeg', 'Libanesa')
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/Mediterranea.jpg', 'Mediterranea'),
                _cardImagen('images/Mexicana.jpg', 'Mexicana')
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/Peruana.jpg', 'Peruana'),
                _cardImagen('images/Portuguesa.jpg', 'Portuguesa')
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardImagen('images/Tailandesa.jpg', 'Tailandesa'),
                _cardImagen('images/Tex-Mex.jpg', 'Tex-Mex')
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
