import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExemploAlertDialogWidget extends StatefulWidget {
  @override
  _ExemploAlertDialogWidgetState createState() =>
      _ExemploAlertDialogWidgetState();
}

class _ExemploAlertDialogWidgetState extends State<ExemploAlertDialogWidget> {
  List<String> _cidades = [
    'Patos',
    'Cajazeiras',
    'Campina',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Campina',
    'Jampa',
    'Patos',
    'Cajazeiras',
    'Campina',
    'Jampa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo AlertDialog'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Exemplo 1 - AlertDialog'),
              onPressed: () {
                _exemploAlertDialog(context);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cidades.length,
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    title: Text('${_cidades[i]}'),
                    onTap: () {
                      _exemploAlertDialog2(context, i);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _exemploAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Título'),
          content: Text('Conteudo Conteudo Conteudo Conteudo'),
          actions: [
            FlatButton(
              child: Text('Sair'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  _exemploAlertDialog2(BuildContext context, int i) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Deletar'),
          content: Text('Deseja deletar a ${_cidades[i]} ?'),
          actions: [
            FlatButton(
              child: Text('Sim'),
              onPressed: () {
                setState(() {
                  _cidades.removeAt(i);
                });
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
