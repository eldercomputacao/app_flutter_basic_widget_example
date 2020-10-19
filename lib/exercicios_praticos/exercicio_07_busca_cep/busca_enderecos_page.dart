import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/endereco.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/endereco_api.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/enderecos_listview_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuscaEnderecosPage extends StatefulWidget {
  @override
  _BuscaEnderecosPageState createState() => _BuscaEnderecosPageState();
}

class _BuscaEnderecosPageState extends State<BuscaEnderecosPage> {
  // Chaves do scaffold e do form
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _keyForm = GlobalKey<FormState>();
  bool _ativaCircular = false;
  // Atributos para os dados da busca
  String _estado = 'PB';
  final _cidade = TextEditingController();
  final _logradouro = TextEditingController();

  @override
  void initState() {
    super.initState();
    _lendoDadosSharedPreferences();
  }

  _lendoDadosSharedPreferences() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    _estado = instancia.getString('key-estado') ?? 'PB';
    _cidade.text = instancia.getString('key-cidade') ?? '';
    _logradouro.text = instancia.getString('key-logradouro') ?? '';
  }

  _gravandoDadosSharedPreferences() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    instancia.setString('key-estado', _estado);
    instancia.setString('key-cidade', _cidade.text);
    instancia.setString('key-logradouro', _logradouro.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text(
          'Busca CEP',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: 20),
            Text(
              'Selecione um estado',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            _buildDropdownButtonEstados(),
            SizedBox(height: 20),
            Text(
              'Digite uma cidade',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            TextFormField(
              controller: _cidade,
              style: TextStyle(
                fontSize: 20,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo não pode ser vazio.';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Digite um logradouro',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            TextFormField(
              controller: _logradouro,
              style: TextStyle(
                fontSize: 20,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo não pode ser vazio.';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: RaisedButton.icon(
                icon: _buildContainerCircularProgress(),
                label: Text(
                  'Buscar',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () async {
                  if (_keyForm.currentState.validate()) {
                    setState(() {
                      _ativaCircular = true;
                    });

                    List<Endereco> enderecos = await EnderecoApi.todos(
                      _estado,
                      _cidade.text,
                      _logradouro.text,
                    );

                    // await Future.delayed(Duration(seconds: 10));

                    setState(() {
                      _ativaCircular = false;
                    });

                    if (enderecos.length != 0) {
                      // Gravando dados
                      _gravandoDadosSharedPreferences();
                      // Levando os dados para a proxíma tela.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EnderecosListViewPage(
                              cidade: _cidade.text,
                              estado: _estado,
                              enderecos: enderecos,
                            );
                          },
                        ),
                      );
                    } else {
                      _buildSnackBar();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildContainerCircularProgress() {
    return _ativaCircular == false
        ? Icon(
            Icons.search,
            color: Colors.blue,
            size: 35,
          )
        : SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          );
  }

  _buildSnackBar() {
    _keyScaffold.currentState.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              'Sem endereços',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  _buildDropdownButtonEstados() {
    return DropdownButton<String>(
      value: _estado,
      isExpanded: true,
      items: [
        DropdownMenuItem(
          child: Text(
            'Paraiba',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          value: 'PB',
        ),
        DropdownMenuItem(
          child: Text(
            'Pernambuco',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          value: 'PE',
        ),
        DropdownMenuItem(
          child: Text(
            'Ceara',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          value: 'CE',
        ),
      ],
      onChanged: (value) {
        setState(() {
          _estado = value;
        });
      },
    );
  }
}
