import 'package:app_flutter_basic_widget_example/aula_02_textfield_form_validacao/exemplo_funcao_validacao.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'exemplo_funcao_validacao.dart' as va;

class ExemploTextFormFieldWidget extends StatefulWidget {
  @override
  _ExemploTextFormFieldWidgetState createState() =>
      _ExemploTextFormFieldWidgetState();
}

class _ExemploTextFormFieldWidgetState
    extends State<ExemploTextFormFieldWidget> {
  GlobalKey<FormState> _keyGlobal = GlobalKey();
  String _nome;
  int _idade;
  double _peso;
  String _email;
  String _fone;
  bool _autovalida = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _keyGlobal,
        //autovalidate: _autovalida,

        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Center(
              child: Text(
                'Cadastro Pessoa',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Compo não pode ser vazio';
                } else if (value.length <= 3) {
                  return "'Nome' deve ter acima de 3 letras";
                }
                return null;
              },
              onSaved: (value) => _nome = value,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Idade',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Compo não pode ser vazio';
                }

                try {
                  int.parse(value);
                } catch (e) {
                  return 'Digite um número inteiro';
                }

                if (int.parse(value) <= 17) {
                  return "'Idade' deve ser maior que 17";
                }

                return null;
              },
              onSaved: (value) => _idade = int.parse(value),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Compo não pode ser vazio';
                }

                try {
                  double.parse(value);
                } catch (e) {
                  return 'Digite um número real';
                }

                if (double.parse(value) <= 0.0) {
                  return "'Peso' deve ser maior que 0";
                }

                return null;
              },
              onSaved: (value) => _peso = double.parse(value),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              validator: (value) => va.validarEmail(value),
              // validator: (String value) {
              //   if (value.isEmpty) {
              //     return 'Compo não pode ser vazio';
              //   } else if (value.length <= 3) {
              //     return "'E-mail' deve ter acima de 3 letras";
              //   } else {
              //     return null;
              //   }
              // },
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Fone',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Compo não pode ser vazio';
                } else if (value.length <= 3) {
                  return "'Fone' deve ter acima de 3 letras";
                }
                return null;
              },
              onSaved: (value) => _fone = value,
            ),
            Divider(
              color: Colors.transparent,
            ),
            Container(
              height: 50,
              child: RaisedButton.icon(
                icon: Icon(Icons.save),
                label: Text('Save'),
                onPressed: _save,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save() {
    if (_keyGlobal.currentState.validate()) {
      _keyGlobal.currentState.save();
      print('Nome: $_nome');
      print('Idade: $_idade');
      print('Peso: $_peso');
      print('E-mail: $_email');
      print('Celular: $_fone');
    }
    // else {
    //   setState(() {
    //     _autovalida = true;
    //   });
    // }
  }
}
