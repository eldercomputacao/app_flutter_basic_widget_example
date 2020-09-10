import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page C'),
            RaisedButton(
              child: Text('Voltar e Retornar Valor'),
              onPressed: () {
                Navigator.pop(context, " - Olá, mundo");
              },
            )
          ],
        ),
      ),
    );
  }
}
