import 'package:app_flutter_basic_widget_example/aula_13_shared_preference/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class ExemploSharedPreferences extends StatefulWidget {
  @override
  _ExemploSharedPreferencesState createState() =>
      _ExemploSharedPreferencesState();
}

class _ExemploSharedPreferencesState extends State<ExemploSharedPreferences> {
  _gravandoDados() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    instancia.setBool('key-bool', true);
    instancia.setInt('key-int', 10);
    instancia.setDouble('key-double', 3.4);
    instancia.setString('key-string', 'Maria Pereira');

    List<String> _cidades = ['Patos', 'Cajazeiras', 'Jampa', 'Campina'];
    instancia.setStringList('key-cidades', _cidades);

    print('Dados gravados com sucesso');
  }

  _lendoDados() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    print('key-bool --> ${instancia.getBool('key-bool')}');
    print('key-int --> ${instancia.getInt('key-int')}');
    print('key-double --> ${instancia.getDouble('key-double')}');
    print('key-string --> ${instancia.getString('key-string')}');
    print('key-cidades --> ${instancia.getStringList('key-cidades')}');

    print('------------------');
    instancia.getKeys().forEach((key) {
      print('$key - ${instancia.get(key)}');
    });

    print('Dados lidos com sucesso');
  }

  _gravandoPessoa() {
    Pessoa pessoa = Pessoa(nome: 'Maria', idade: 20, peso: 50, jovem: true);
    String pessoaEncode = convert.jsonEncode(pessoa.toJson());

    SharedPreferences.getInstance().then((instancia) {
      instancia.setString('key-pessoa', pessoaEncode);
      print('Pessoa foi codificada e gravada.');
    });
  }

  _lendoPessoa() {
    SharedPreferences.getInstance().then((instancia) {
      Pessoa pessoa =
          Pessoa.fromJson(convert.jsonDecode(instancia.get('key-pessoa')));
      print('Pessoa foi decodificada.');
      print(pessoa);
    });
  }

  _gravandoListPessoa() {
    List<Pessoa> pessoas = [
      Pessoa(nome: 'Maria', idade: 20, peso: 50, jovem: true),
      Pessoa(nome: 'Carlos', idade: 22, peso: 60, jovem: true),
      Pessoa(nome: 'João', idade: 70, peso: 80, jovem: false),
    ];

    List<String> pessoasEncode =
        pessoas.map((pessoa) => convert.jsonEncode(pessoa.toJson())).toList();

    SharedPreferences.getInstance().then((instancia) {
      instancia.setStringList('key-pessoas', pessoasEncode);
    });

    print('Pessoas codificadas e gravadas com sucesso');
  }

  _lendoListPessoas() {
    SharedPreferences.getInstance().then((instancia) {
      List<String> pessoasString = instancia.getStringList('key-pessoas');
      List<Pessoa> pessoas = pessoasString
          .map((p) => Pessoa.fromJson(convert.jsonDecode(p)))
          .toList();
      print('Lista decodificada com sucesso.');
      pessoas.forEach((p) => print(p));
    }).catchError((e) {
      print('Lista vazia.');
      //print(e);
    });
  }

  _limparDados() {
    SharedPreferences.getInstance().then((instancia) {
      instancia.clear();
      print('Preferences foi limpa com sucesso.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo SharedPreferences')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Granvado Dados'),
              onPressed: () {
                //_gravandoDados();
                //_gravandoPessoa();
                _gravandoListPessoa();
              },
            ),
            RaisedButton(
              child: Text('Lendo Dados'),
              onPressed: () {
                //_lendoDados();
                //_lendoPessoa();
                _lendoListPessoas();
              },
            ),
            RaisedButton(
              child: Text('Limpar Dados'),
              onPressed: () {
                _limparDados();
              },
            )
          ],
        ),
      ),
    );
  }
}
