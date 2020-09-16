import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_05_telefones/categoria_telefones.dart';
import 'package:flutter/material.dart';

class DetalheTelefones extends StatelessWidget {
  Categoria _categoria;

  DetalheTelefones({Categoria categoria}) {
    this._categoria = categoria;
  }

  String _fones(List<Telefones> lista) {
    String fones = "";
    for (Telefones fone in lista) {
      fones += "Nome: ${fone.nome}\nNúmero: ${fone.numero}\n\n";
    }
    return fones;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categoira: ${_categoria.categoria}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _categoria.telefones.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text('${_categoria.telefones[i].nome}'),
            subtitle: Text('${_categoria.telefones[i].numero}'),
          );
        },
      ),
    );
  }
}
