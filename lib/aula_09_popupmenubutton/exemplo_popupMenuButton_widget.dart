import 'package:flutter/material.dart';

class ExemploPopupMenuButton extends StatefulWidget {
  @override
  _ExemploPopupMenuButtonState createState() => _ExemploPopupMenuButtonState();
}

class _ExemploPopupMenuButtonState extends State<ExemploPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton'),
        actions: [
          PopupMenuButton(
            onSelected: (String value) {
              if (value == 'item1') {
                print('item 1 clicado');
              } else if (value == 'item2') {
                print('item 2 clicado');
              } else if (value == 'item3') {
                print('item 3 clicado');
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
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
            ],
          ),
        ],
      ),
    );
  }
}
