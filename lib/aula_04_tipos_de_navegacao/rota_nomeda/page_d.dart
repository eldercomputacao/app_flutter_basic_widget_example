import 'package:flutter/material.dart';

class PageD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nomePorParamentro = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Page D'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page D'),
            Text('Nome: $nomePorParamentro'),
            RaisedButton(
              child: Text('Voltar'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
