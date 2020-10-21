import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/endereco.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/endereco_api.dart';
import 'package:flutter/material.dart';

class FormEnderecoPage extends StatefulWidget {
  @override
  _FormEnderecoPageState createState() => _FormEnderecoPageState();
}

class _FormEnderecoPageState extends State<FormEnderecoPage> {
//   cep": "01001-000",
// "logradouro": "Praça da Sé",
// "complemento": "lado ímpar",
// "bairro": "Sé",
// "localidade": "São Paulo",
// "uf": "SP",
// "ibge": "3550308",
// "gia": "1004",
// "ddd": "11",
// "siafi": "7107"
  final _cep = TextEditingController();
  final _logradouro = TextEditingController();
  final _bairro = TextEditingController();
  final _localidade = TextEditingController();
  final _uf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preenche Endereço'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextField(
            controller: _cep,
            decoration: InputDecoration(
              labelText: 'CEP',
            ),
            onChanged: (value) {
              _preenchaCampos(value);
            },
          ),
          TextField(
            controller: _logradouro,
            decoration: InputDecoration(
              labelText: 'LOGRADOURO',
            ),
          ),
          TextField(
            controller: _bairro,
            decoration: InputDecoration(
              labelText: 'BAIRRO',
            ),
          ),
          TextField(
            controller: _localidade,
            decoration: InputDecoration(
              labelText: 'LOCALIDADE',
            ),
          ),
          TextField(
            controller: _uf,
            decoration: InputDecoration(
              labelText: 'UF',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _preenchaCampos(String cep) async {
    if (cep.length == 8) {
      Endereco endereco = await EnderecoApi.getEndereco(cep);
      _logradouro.text = endereco.logradouro;
      _bairro.text = endereco.bairro;
      _localidade.text = endereco.localidade;
      _uf.text = endereco.uf;
    }
  }
}
