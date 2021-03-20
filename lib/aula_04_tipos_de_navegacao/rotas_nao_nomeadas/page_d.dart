import 'package:flutter/material.dart';

class PageD extends StatefulWidget {
  String nome = 'elder';

  @override
  _PageDState createState() => _PageDState();
}

class _PageDState extends State<PageD> {
  int valor = 0;

  _incremente() {
    setState(() {
      valor++;
      print('método - setState');
    });
  }

  @override
  void initState() {
    super.initState();
    print('método - initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('método - dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('método - build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Page D'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Valor: $valor'),
            ElevatedButton(
              child: Text('+ 1'),
              onPressed: () {
                _incremente();
              },
            ),
          ],
        ),
      ),
    );
  }
}
