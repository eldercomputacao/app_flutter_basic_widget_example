import 'package:flutter/material.dart';

class ExemloSnackbar extends StatefulWidget {
  @override
  _ExemloSnackbarState createState() => _ExemloSnackbarState();
}

class _ExemloSnackbarState extends State<ExemloSnackbar> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(title: Text('Exemplo Snackbar')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _snackbar();
            // Scaffold.of(context).showSnackBar(
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

  _snackbar() {
    _key.currentState.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.save),
            SizedBox(width: 25),
            Text(
              'Savando...',
              style: TextStyle(),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'Botão',
          onPressed: () {
            print('botao ativado');
          },
          textColor: Colors.white,
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('SnackBar'),
            ),
          );
        },
      ),
    );
  }
}
