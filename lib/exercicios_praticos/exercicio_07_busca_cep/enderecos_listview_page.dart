import 'package:app_flutter_basic_widget_example/exercicios_praticos/exercicio_07_busca_cep/endereco.dart';
import 'package:flutter/material.dart';

class EnderecosListViewPage extends StatefulWidget {
  String cidade;
  String estado;
  List<Endereco> enderecos;

  EnderecosListViewPage({
    this.cidade,
    this.estado,
    this.enderecos,
  });

  @override
  _EnderecosListViewPageState createState() => _EnderecosListViewPageState();
}

class _EnderecosListViewPageState extends State<EnderecosListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.cidade}, ${widget.estado}',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.enderecos.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
              'Cep: ${widget.enderecos[i].cep}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Logradouro: ${widget.enderecos[i].logradouro}',
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
