import 'package:flutter/material.dart';

class ExemploDropdownButtonWidget extends StatefulWidget {
  @override
  _ExemploDropdownButtonWidgetState createState() =>
      _ExemploDropdownButtonWidgetState();
}

class _ExemploDropdownButtonWidgetState
    extends State<ExemploDropdownButtonWidget> {
  String _cidadeSelecionada = 'João Pessoa/PB';
  List<String> _cidades = [
    'Patos/PB',
    'Cajazeiras/PB',
    'Campina Grande/PB',
    'João Pessoa/PB',
    'Texeira/PB',
  ];

  int _numeroSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //body: _buildDropdownEstatico(),
      //body: _buildDropdownDinamico(),
      body: _buildDropdownDinamicoNumero(),
    );
  }

  Container _buildDropdownDinamicoNumero() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selecione Número',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              DropdownButton<int>(
                value: _numeroSelecionado,
                items: List<int>.generate(10, (i) => i)
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(
                          '$e',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (int value) {
                  print(value);
                  setState(() {
                    _numeroSelecionado = value;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildDropdownDinamico() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            'Selecione uma cidade',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          DropdownButton<String>(
            value: _cidadeSelecionada,
            //iconSize: 30,
            //dropdownColor: Colors.red,
            isExpanded: true,
            items: _cidades
                .map((e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ))
                .toList(),
            onChanged: (String value) {
              print(value);
              setState(() {
                _cidadeSelecionada = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Container _buildDropdownEstatico() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            'Selecione uma cidade',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          DropdownButton<String>(
            value: _cidadeSelecionada, //_cidadeSelecionada,
            isExpanded: true,
            // icon: Icon(
            //   Icons.arrow_drop_down,
            //   size: 30,
            //   color: Colors.red,
            // ),
            // underline: Container(
            //   height: 2,
            //   color: Colors.red,
            // ),
            items: [
              DropdownMenuItem(
                child: Text('Patos/PB'),
                value: 'Patos/PB',
              ),
              DropdownMenuItem(
                child: Text('João Pessoa/PB'),
                value: 'João Pessoa/PB',
              ),
              DropdownMenuItem(
                child: Text('Campina Grande/PB'),
                value: 'Campina Grande/PB',
              ),
              DropdownMenuItem(
                child: Text('Cajazeiras/PB'),
                value: 'Cajazeiras/PB',
              ),
            ],
            onChanged: (String value) {
              print(value);
              setState(() {
                _cidadeSelecionada = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
