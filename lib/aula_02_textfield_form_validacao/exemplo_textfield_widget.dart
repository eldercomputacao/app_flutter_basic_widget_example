import 'package:flutter/material.dart';

class ExemploTextFieldWidget2 extends StatelessWidget {
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _fone = TextEditingController();
  TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.yellow,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppBar(
                title: Text(
                  'Cadastrar',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                centerTitle: true,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.black26,
                  filled: true,
                ),
              ),
              TextField(
                keyboardType: TextInputType.name,
                controller: _nome,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: 'Digite seu nome',
                    helperText: '* Obrigatório',
                    helperStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder()),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 25),
                controller: _email,
                decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: 'Digite seu e-mail',
                    helperText: '* Obrigatório',
                    helperStyle: TextStyle(color: Colors.red),
                    focusedBorder: OutlineInputBorder()),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 25),
                controller: _fone,
                decoration: InputDecoration(
                  labelText: 'Fone',
                  labelStyle: TextStyle(color: Colors.green),
                  hintText: 'Digite seu fone',
                  helperText: '* Obrigatório',
                  helperStyle: TextStyle(color: Colors.red),
                ),
              ),
              RaisedButton(
                child: Text('OK'),
                onPressed: () {
                  print('Nome: ${_nome.text}');
                  print('Email: ${_email.text}');
                  print('Fone: ${_fone.text}');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
