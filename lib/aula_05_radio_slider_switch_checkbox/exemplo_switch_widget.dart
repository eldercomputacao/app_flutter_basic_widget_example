import 'package:flutter/material.dart';

class ExemploSwitchWidget extends StatefulWidget {
  @override
  _ExemploSwitchWidgetState createState() => _ExemploSwitchWidgetState();
}

class _ExemploSwitchWidgetState extends State<ExemploSwitchWidget> {
  bool _javaValue = false;
  bool _dartValue = false;
  bool _phpValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildSwitchSimples(),
      //body: _buildSwitchListTile(),
    );
  }

  Container _buildSwitchListTile() {
    return Container(
      child: Column(
        children: [
          SwitchListTile(
            value: _javaValue,
            onChanged: (bool value) {
              setState(() {
                _javaValue = value;
              });
            },
            title: Text('Java'),
            subtitle: Text('Uma linguagem de programação'),
            secondary: Icon(Icons.ac_unit),
          ),
          SwitchListTile(
            value: _phpValue,
            onChanged: (bool value) {
              setState(() {
                _phpValue = value;
              });
            },
            title: Text('PHP'),
            subtitle: Text('ok ok ok ok ok'),
          ),
          SwitchListTile(
            value: _dartValue,
            onChanged: (bool value) {
              setState(() {
                _dartValue = value;
              });
            },
            title: Text('Dart'),
            subtitle: Text('ok ok ok ok ok'),
          ),
          //RaisedButton(onPressed: () {})
        ],
      ),
    );
  }

  Container _buildSwitchSimples() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text('Dart'),
              Switch(
                value: _dartValue,
                onChanged: (bool value) {
                  setState(() {
                    _dartValue = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('PHP'),
              Switch(
                value: _phpValue,
                onChanged: (bool value) {
                  setState(() {
                    _phpValue = value;
                  });
                },
              )
            ],
          ),
          Row(
            children: [
              Text('Java'),
              Switch(
                value: _javaValue,
                onChanged: (bool value) {
                  setState(() {
                    _javaValue = value;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
