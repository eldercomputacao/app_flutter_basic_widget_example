import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_04_navegacao_transicao_dados/page_detalhe.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_04_navegacao_transicao_dados/pessoa.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  String _groupValueSexo = 'Masculino';
  List<String> linguagens = [];
  bool _javaValue = false;
  bool _dartValue = false;

  double _salarioPretendido = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            //color: Colors.red[100],
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Page Cadastro',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _nome,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _email,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Selecione seu sexo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Masculino',
                      groupValue: _groupValueSexo,
                      onChanged: (String value) {
                        setState(() {
                          _groupValueSexo = value;
                        });
                      },
                    ),
                    Text('Masculino'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Feminino',
                      groupValue: _groupValueSexo,
                      onChanged: (String value) {
                        setState(() {
                          _groupValueSexo = value;
                        });
                      },
                    ),
                    Text('Feminino'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Qual linguagem deseja usar para trabalhar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _javaValue,
                      onChanged: (bool value) {
                        setState(() {
                          _javaValue = value;
                        });
                      },
                    ),
                    Text('Java'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _dartValue,
                      onChanged: (bool value) {
                        setState(() {
                          _dartValue = value;
                        });
                      },
                    ),
                    Text('Dart'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Selecione a faixa de salá pretendidorio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  min: 1000,
                  max: 5000,
                  divisions: 10,
                  value: _salarioPretendido,
                  label: _salarioPretendido.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _salarioPretendido = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text('Ver Detalhes'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    linguagens.clear();
                    if (_dartValue) {
                      linguagens.add('Dart');
                    }
                    if (_javaValue) {
                      linguagens.add('Java');
                    }

                    Pessoa pessoa = Pessoa(
                      nome: _nome.text,
                      email: _email.text,
                      salario: _salarioPretendido,
                      linguagens: linguagens,
                      sexo: _groupValueSexo,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageDetalhe(
                          pessoa: pessoa,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
