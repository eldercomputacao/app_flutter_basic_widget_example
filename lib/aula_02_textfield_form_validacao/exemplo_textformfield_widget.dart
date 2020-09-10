import 'package:flutter/material.dart';

class ExemploTextFormFieldWidget extends StatefulWidget {
  @override
  _ExemploTextFormFieldWidgetState createState() =>
      _ExemploTextFormFieldWidgetState();
}

class _ExemploTextFormFieldWidgetState
    extends State<ExemploTextFormFieldWidget> {
  GlobalKey<FormState> _keyGlobal = GlobalKey();
  String _nome;
  String _email;
  String _celular;
  bool _autovalida = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _keyGlobal,
          autovalidate: _autovalida,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value.length == 0) {
                    return 'Nome invalido';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _nome = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value.length == 0) {
                    return 'Email invalido';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Celular',
                ),
                validator: (value) {
                  if (value.length == 0) {
                    return 'Celular invalido';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _celular = value;
                },
              ),
              RaisedButton.icon(
                label: Text('Inserir'),
                icon: Icon(Icons.save),
                onPressed: () {
                  if (_keyGlobal.currentState.validate()) {
                    _keyGlobal.currentState.save();
                    print('Nome: $_nome');
                    print('E-mail: $_email');
                    print('Celular: $_celular');
                  } else {
                    setState(() {
                      _autovalida = true;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
