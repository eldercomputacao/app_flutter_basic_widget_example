import 'package:app_flutter_basic_widget_example/aula_04_tipos_de_navegacao/rota_nao_nomeada/pessoa.dart';
import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  //String valor;
  //PageB({this.valor});
  Pessoa pessoa;
  PageB({this.pessoa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page B -> ${pessoa.nome}'),
            RaisedButton(
              child: Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
