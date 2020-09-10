import 'package:flutter/material.dart';

class AppRicoOuPobre extends StatefulWidget {
  @override
  _AppRicoOuPobreState createState() => _AppRicoOuPobreState();
}

class _AppRicoOuPobreState extends State<AppRicoOuPobre> {
  double _valor = 0;
  String _situacao = 'Normal';

  _maisRico() {
    setState(() {
      _valor += 100;
      if (_valor < 0) {
        _situacao = 'Pobre';
      } else if (_valor > 1000) {
        _situacao = 'Rico';
      } else {
        _situacao = 'Normal';
      }
    });
  }

  _menosRico() {
    setState(() {
      _valor -= 100;
      if (_valor < 0) {
        _situacao = 'Pobre';
      } else if (_valor > 1000) {
        _situacao = 'Rico';
      } else {
        _situacao = 'Normal';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.amber,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(
              elevation: 20,
            ),
            Text(
              'R\$ $_valor',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text(
                    '+ 100',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () => _maisRico(),
                ),
                RaisedButton(
                  child: Text(
                    '- 100',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.redAccent,
                  onPressed: () => _menosRico(),
                ),
              ],
            ),
            Text(
              '$_situacao',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  title: Text('home'),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
