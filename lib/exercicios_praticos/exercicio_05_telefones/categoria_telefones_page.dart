import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_05_telefones/categoria_telefones.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_05_telefones/categoria_telefones_api.dart';
import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_05_telefones/detalhe_telefones.dart';
import 'package:flutter/material.dart';

class CategoriaTelefonesWidget extends StatefulWidget {
  @override
  _CategoriaTelefonesWidgetState createState() =>
      _CategoriaTelefonesWidgetState();
}

class _CategoriaTelefonesWidgetState extends State<CategoriaTelefonesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telefones CZ"),
        centerTitle: true,
      ),
      body: _buildFutureBuilder(),
    );
  }

  FutureBuilder<List<Categoria>> _buildFutureBuilder() {
    return FutureBuilder(
      future: CategoriaTelefonesApi.getCategoriaTelefonesJsonLocal(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          // 2
          return _buildListView(snapshot.data);
        } else if (snapshot.hasError) {
          // 3
          return _buildErroDados();
        }
        // 1
        return _buildProgressCircular();
      },
    );
  }

  Container _buildErroDados() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 80,
            color: Colors.red,
          ),
          Divider(
            color: Colors.transparent,
            height: 30,
          ),
          Text(
            'Erro ao ler os DADOS',
            style: TextStyle(
              fontSize: 25,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProgressCircular() {
    return Container(
      //color: Colors.red[200],
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: CircularProgressIndicator(),
            width: 80,
            height: 80,
          ),
          Divider(
            color: Colors.transparent,
            height: 40,
          ),
          Text(
            'Carregando',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildListView(List<Categoria> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text('${lista[i].categoria}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext contexti) {
                  return DetalheTelefones(categoria: lista[i]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
