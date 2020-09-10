import 'package:flutter/material.dart';

class ExemploStatelessWidget extends StatelessWidget {
  double _valor = 0;

  _acrescentar() {
    _valor += 100;
    debugPrint('R\$ $_valor');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'R\$ $_valor',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            RaisedButton(
              child: Text(
                'Clique do Botão',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                //debugPrint('clique do botão');
                _acrescentar();
              },
            ),
          ],
        ),
      ),
    );
  }
}
