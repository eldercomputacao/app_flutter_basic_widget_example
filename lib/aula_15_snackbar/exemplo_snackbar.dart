import 'package:flutter/material.dart';

class ExemloSnackbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Snackbar')),
      body: Center(
        child: ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            _snackbar(context);
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('SnackBar'),
            //   ),
            // );
          },
        ),
      ),
      // body: MySnackBar(),
    );
  }

  _snackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.save, color: Colors.white),
            SizedBox(width: 25),
            Text(
              'Savando...',
              style: TextStyle(),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Botão',
          onPressed: () {
            print('botao ativado');
          },
          textColor: Colors.white,
        ),
      ),
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Button SnackBar'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('SnackBar'),
            ),
          );
        },
      ),
    );
  }
}
