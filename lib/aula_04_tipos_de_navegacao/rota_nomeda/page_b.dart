import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page B'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page B'),
            RaisedButton(
              child: Text('Voltar'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
