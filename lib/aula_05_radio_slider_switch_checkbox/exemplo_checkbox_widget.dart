import 'package:flutter/material.dart';

class ExemploCheckBoxWidget extends StatefulWidget {
  @override
  _ExemploCheckBoxWidgetState createState() => _ExemploCheckBoxWidgetState();
}

class _ExemploCheckBoxWidgetState extends State<ExemploCheckBoxWidget> {
  bool _javaValue = false;
  bool _phpValue = false;
  bool _dartValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //body: _buildCheckBoxSimples(),
      body: _buildCheckBoxListTile(),
    );
  }

  Container _buildCheckBoxListTile() {
    return Container(
      child: Column(
        children: [
          CheckboxListTile(
            value: _javaValue,
            onChanged: (bool value) {
              setState(() {
                _javaValue = value;
              });
            },
            title: Text('Java'),
            subtitle: Text('Uma linguagem top'),
            //secondary: Icon(Icons.language),
            //checkColor: Colors.red,
            //activeColor: Colors.black,
            //dense: true,
          ),
          CheckboxListTile(
            value: _dartValue,
            onChanged: (bool value) {
              setState(() {
                _dartValue = value;
              });
            },
            title: Text('Dart'),
            subtitle: Text('Outra linguagem'),
          ),
          CheckboxListTile(
            value: _phpValue,
            onChanged: (bool value) {
              setState(() {
                _phpValue = value;
              });
            },
            title: Text('PHP'),
            subtitle: Text('Outra linguagem'),
          )
        ],
      ),
    );
  }

  Container _buildCheckBoxSimples() {
    return Container(
      //color: Colors.red[200],
      //width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              //Icon(Icons.save),
              Checkbox(
                value: _javaValue,
                onChanged: (bool value) {
                  setState(() {
                    _javaValue = value;
                  });
                },
              ),
              Text('Java'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _phpValue,
                onChanged: (bool value) {
                  setState(() {
                    _phpValue = value;
                  });
                },
              ),
              Text('PHP'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _dartValue,
                onChanged: (bool value) {
                  setState(() {
                    _dartValue = value;
                  });
                },
              ),
              Text('Dart'),
            ],
          )
        ],
      ),
    );
  }
}
