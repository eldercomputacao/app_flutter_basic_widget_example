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
  @override
  void initState() {
    super.initState();
    _gravandoDados();
    _gravandoListaPessoa();
  }

  _gravandoDados() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    instancia.setBool('key-bool', true);
    instancia.setInt('key-int', 10);
    instancia.setDouble('key-double', 3.4);
    instancia.setString('key-string', 'Maria Pereira');
    print('Dados gravados com sucesso');
  }

  _gravandoListaPessoa() async {
    List<Pessoa> pessoas = [
      Pessoa(nome: 'Maria', idade: 20, peso: 50, jovem: true),
      Pessoa(nome: 'Carlos', idade: 22, peso: 60, jovem: true),
      Pessoa(nome: 'João', idade: 70, peso: 80, jovem: false),
    ];

    //pessoas.forEach((pessoa) => print(pessoa));

    //print('--------');

    List<String> pessoasString =
        pessoas.map((pessoa) => convert.jsonEncode(pessoa.toJson())).toList();

    //pessoasString.forEach((element) => print(element));
    SharedPreferences instancia = await SharedPreferences.getInstance();
    instancia.setStringList('key-pessoas', pessoasString);
    print('Pessoas gravadas com sucesso');
  }

  _lendoListaPessoas() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    List<String> pessoasString = instancia.getStringList('key-pessoas');
    pessoasString.forEach((element) => print(element));

    print('-------------');

    List<Pessoa> pessoas = pessoasString
        .map((e) => Pessoa.fromJson(convert.jsonDecode(e)))
        .toList();

    pessoas.forEach((element) => print(element));
  }

  _lendoAsChavesDados() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    instancia.getKeys().forEach((chave) => print('chave -> $chave'));
    print('------------------');
    print('key-bool --> ${instancia.getBool('key-bool')}');
    print('key-int --> ${instancia.getInt('key-int')}');
    print('key-double --> ${instancia.getDouble('key-double')}');
    print('key-string --> ${instancia.getString('key-string')}');
    print('------------------');
    List<String> listString = instancia.get('key-pessoas');
    listString.add('{"nome":"kaka","idade":70,"peso":80.0,"jovem":false}');
    instancia
        .getKeys()
        .forEach((chave) => print('$chave - ${instancia.get(chave)}'));
    print('Dados lidos com sucesso');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo SharedPreferences')),
      body: Center(
        child: RaisedButton(
          child: Text('Ler os dados'),
          onPressed: () {
            _lendoAsChavesDados();
            _lendoListaPessoas();
          },
        ),
      ),
    );
  }
}
