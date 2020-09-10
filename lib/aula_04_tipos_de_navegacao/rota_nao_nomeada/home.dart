import 'package:app_flutter_basic_widget_example/aula_04_tipos_de_navegacao/rota_nao_nomeada/page_a.dart';
import 'package:app_flutter_basic_widget_example/aula_04_tipos_de_navegacao/rota_nao_nomeada/page_b.dart';
import 'package:app_flutter_basic_widget_example/aula_04_tipos_de_navegacao/rota_nao_nomeada/page_c.dart';
import 'package:app_flutter_basic_widget_example/aula_04_tipos_de_navegacao/rota_nao_nomeada/page_d.dart';
import 'package:app_flutter_basic_widget_example/aula_04_tipos_de_navegacao/rota_nao_nomeada/pessoa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _texto = '';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageA()),
                );
              },
            ),
            RaisedButton(
              child: Text('Page B'),
              onPressed: () {
                //Pessoa(nome: 'Maria', email: 'maria@gmail.com');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageB(
                        pessoa: Pessoa(nome: 'maria', email: ''),
                      );
                    },
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('Page C$_texto'),
              onPressed: () {
                _irPageC(context);
              },
            ),
            RaisedButton(
              child: Text('Page D'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageD();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _irPageC(BuildContext context) async {
    String valor = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (contex) {
          return PageC();
        },
      ),
    );
    setState(() {
      _texto = valor;
    });
  }
}
