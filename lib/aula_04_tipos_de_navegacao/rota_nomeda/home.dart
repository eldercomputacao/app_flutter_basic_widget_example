import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Menu'),
            RaisedButton(
              child: Text('Page A'),
              onPressed: () {
                Navigator.pushNamed(context, "page_a");
              },
            ),
            RaisedButton(
              child: Text('Page B'),
              onPressed: () {
                Navigator.pushNamed(context, "/rotas_nomeadas/page_b");
              },
            ),
            RaisedButton(
              child: Text('Page C'),
              onPressed: () {
                Navigator.pushNamed(context, "/rotas_nomeadas/page_c");
              },
            ),
          ],
        ),
      ),
    );
  }
}
