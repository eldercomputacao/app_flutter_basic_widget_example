import 'package:flutter/material.dart';

class ExemploRadioWidget extends StatefulWidget {
  @override
  _ExemploRadioWidgetState createState() => _ExemploRadioWidgetState();
}

class _ExemploRadioWidgetState extends State<ExemploRadioWidget> {
  int _groupValueLanguage = 0;
  String _groupValueSexo = '';
  String _groupValueAnimal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //body: _buildRadioSimples(),
      //body: _buildRadioListTileSexo(),
      body: _buildRadioListTileAnimal(),
    );
  }

  Container _buildRadioListTileAnimal() {
    return Container(
      //color: Colors.amber,
      child: Column(
        children: [
          Text(
            'Qual animal você mais GOSTA?',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.red[200],
                child: Row(
                  children: [
                    Radio(
                      value: 'Cachorro',
                      groupValue: _groupValueAnimal,
                      onChanged: (String value) {
                        setState(() {
                          _groupValueAnimal = value;
                        });
                      },
                    ),
                    Text('Cachorro'),
                  ],
                ),
              ),
              Container(
                color: Colors.yellowAccent[200],
                child: Row(
                  children: [
                    Radio(
                      value: 'Gato',
                      groupValue: _groupValueAnimal,
                      onChanged: (String value) {
                        setState(() {
                          _groupValueAnimal = value;
                        });
                      },
                    ),
                    Text('Gato'),
                  ],
                ),
              ),
              Container(
                color: Colors.purple[200],
                child: Row(
                  children: [
                    Radio(
                      value: 'Macaco',
                      groupValue: _groupValueAnimal,
                      onChanged: (String value) {
                        setState(() {
                          _groupValueAnimal = value;
                        });
                      },
                    ),
                    Text('Macaco'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildRadioListTileSexo() {
    return Container(
      child: Column(
        children: [
          Text(
            'Qual SEXO?',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          RadioListTile(
            value: 'Masculino',
            groupValue: _groupValueSexo,
            onChanged: (String value) {
              setState(() {
                _groupValueSexo = value;
              });
            },
            title: Text('Masculino'),
            //subtitle: Text('sub masculino'),
          ),
          RadioListTile(
            value: 'Feminino',
            groupValue: _groupValueSexo,
            onChanged: (String value) {
              setState(() {
                _groupValueSexo = value;
              });
            },
            title: Text('Feminino'),
          ),
        ],
      ),
    );
  }

  Container _buildRadioSimples() {
    return Container(
      child: Column(
        children: [
          Text(
            'Qual linguagem?',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _groupValueLanguage,
                onChanged: (int value) {
                  setState(() {
                    print('valor -> $value');
                    _groupValueLanguage = value;
                  });
                },
              ),
              Text('Java'),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _groupValueLanguage,
                onChanged: (int value) {
                  setState(() {
                    print('valor -> $value');
                    _groupValueLanguage = value;
                  });
                },
              ),
              Text('Python'),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: _groupValueLanguage,
                onChanged: (int value) {
                  setState(() {
                    print('valor -> $value');
                    _groupValueLanguage = value;
                  });
                },
              ),
              Text('Dart')
            ],
          )
        ],
      ),
    );
  }
}
