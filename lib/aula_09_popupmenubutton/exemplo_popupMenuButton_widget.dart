import 'package:flutter/material.dart';

class ExemploPopupMenuButton extends StatefulWidget {
  @override
  _ExemploPopupMenuButtonState createState() => _ExemploPopupMenuButtonState();
}

class _ExemploPopupMenuButtonState extends State<ExemploPopupMenuButton> {
  List<String> _cidades = [
    'Patos/PB',
    'Cajazeiras/PB',
    'Campina Grande/PB',
    'João Pessoa/PB',
    'Texeira/PB',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton'),
        actions: [
          _exemplo2PopupMenuButton(),
        ],
      ),
      body: ListView.builder(
        itemCount: _cidades.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(_cidades[i]),
          );
        },
      ),
    );
  }

  PopupMenuButton<String> _exemplo1PopupMenuButton() {
    return PopupMenuButton(
      onSelected: (String value) {
        if (value == 'item1') {
          print('item 1 clicado');
        } else if (value == 'item2') {
          print('item 2 clicado');
        } else if (value == 'item3') {
          print('item 3 clicado');
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem(
            child: Text('Item 1'),
            value: 'item1',
          ),
          PopupMenuItem(
            child: Text('Item 2'),
            value: 'item2',
          ),
          PopupMenuItem(
            child: Text('Item 3'),
            value: 'item3',
          ),
        ];
      },
    );
  }

  PopupMenuButton<String> _exemplo2PopupMenuButton() {
    return PopupMenuButton(
      onSelected: (String value) {
        if (value == 'Order A-Z') {
          //print('item 1 clicado');
          setState(() {
            _cidades.sort((a, b) => a.compareTo(b));
          });
        } else if (value == 'Order Z-A') {
          //print('item 2 clicado');
          setState(() {
            _cidades.sort((b, a) => a.compareTo(b));
          });
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem(
            child: Text('Order A-Z'),
            value: 'Order A-Z',
          ),
          PopupMenuItem(
            child: Text('Order Z-A'),
            value: 'Order Z-A',
          ),
        ];
      },
    );
  }
}
