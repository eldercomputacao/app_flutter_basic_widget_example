import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ImcPage(),
  ));
}

class ImcPage extends StatefulWidget {
  @override
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  double peso = 0.0;
  double altura = 0.0;
  double imc = 0.0;

  void calcImc() {
    peso = double.parse(pesoController.text);
    altura = double.parse(alturaController.text);

    imc = peso / (altura * altura);
    print(imc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IMC"), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text("Digite seu peso (quilos)"),
          TextField(
            controller: pesoController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          Text("Digite sua altura (metros)"),
          TextField(
            controller: alturaController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              calcImc();
              setState(() {});
            },
            child: Text("Calcular"),
          ),
          ElevatedButton(
            onPressed: () {
              calcImc();
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Calcular"),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Plus One'),
            icon: Icon(Icons.person),
          ),
          SizedBox(height: 20),
          Text("IMC: ${imc.toStringAsFixed(2)}", textAlign: TextAlign.center),
          Text("Classificação: Normal", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
