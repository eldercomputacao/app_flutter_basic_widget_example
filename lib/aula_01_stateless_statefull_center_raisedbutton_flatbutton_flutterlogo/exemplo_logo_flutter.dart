import 'package:flutter/material.dart';

class ExemploLogoFluuter extends StatefulWidget {
  @override
  _ExemploLogoFluuterState createState() => _ExemploLogoFluuterState();
}

class _ExemploLogoFluuterState extends State<ExemploLogoFluuter> {
  double _size = 60;
  _aumentarImagem() {
    setState(() {
      _size = _size + 10;
    });
  }

  _diminuirImagem() {
    setState(() {
      _size = _size - 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        //color: Colors.red,
        //width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: _size,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text('+'),
                  onPressed: () {
                    _aumentarImagem();
                  },
                ),
                RaisedButton(
                  child: Text('-'),
                  onPressed: () {
                    _diminuirImagem();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
