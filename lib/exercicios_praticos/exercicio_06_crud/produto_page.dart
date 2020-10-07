import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_06_crud/produto.dart';
import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  Produto _produto;

  ProdutoPage({Produto produto}) {
    this._produto = produto;
  }

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  String _titleApp = 'Novo Produto';
  final _key = GlobalKey<FormState>();

  final _marca = TextEditingController();
  final _nome = TextEditingController();
  final _preco = TextEditingController();
  final _quantidade = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget._produto != null) {
      _titleApp = 'Alterando Produto';
      _marca.text = widget._produto.marca;
      _nome.text = widget._produto.nome;
      _preco.text = widget._produto.preco.toString();
      _quantidade.text = widget._produto.quantidade.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleApp),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _marca,
              decoration: InputDecoration(
                labelText: "Marca",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo não pode ser vazio.';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _nome,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo não pode ser vazio.';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _preco,
              decoration: InputDecoration(
                labelText: "Preço",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo não pode ser vazio.';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _quantidade,
              decoration: InputDecoration(
                labelText: "Quantidade",
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo não pode ser vazio.';
                } else {
                  return null;
                }
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            Container(
              height: 50,
              child: RaisedButton(
                child: Text("Confirme"),
                onPressed: () {
                  if (_key.currentState.validate()) {
                    _key.currentState.save();
                    Navigator.pop(
                      context,
                      Produto(
                        marca: _marca.text,
                        nome: _nome.text,
                        preco: double.parse(_preco.text),
                        quantidade: int.parse(_quantidade.text),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
