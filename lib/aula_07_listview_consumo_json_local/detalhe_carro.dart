import 'package:app_flutter_basic_widget_example/aula_07_listview_consumo_json_local/carro.dart';
import 'package:flutter/material.dart';

class DetalheCarro extends StatelessWidget {
  Carro _carro;

  DetalheCarro({Carro carro}) {
    this._carro = carro;
  }

  String _fones(List<String> lista) {
    String fones = "";
    for (String fone in lista) {
      fones += "$fone\n";
    }
    return fones;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        //color: Colors.red[200],
        //height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Detalhes do Carro',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            //NetworkImage(_carro.image.toString()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(_carro.image),
            ),
            Text(
              'Nome',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${_carro.nome}',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Text(
              'Fones',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${_fones(_carro.fones)}',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(
                'Voltar',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
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
