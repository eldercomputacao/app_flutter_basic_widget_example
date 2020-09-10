import 'package:flutter/material.dart';

class ExemploSliderWidget extends StatefulWidget {
  @override
  _ExemploSliderWidgetState createState() => _ExemploSliderWidgetState();
}

class _ExemploSliderWidgetState extends State<ExemploSliderWidget> {
  double _updateSlider = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Slider')),
      body: _buildSlider(),
    );
  }

  Container _buildSlider() {
    return Container(
      child: Center(
        child: Slider(
          min: 0.0,
          max: 10.0,
          divisions: 10,
          value: _updateSlider,
          label: _updateSlider.round().toString(),
          //activeColor: Colors.amber,
          //inactiveColor: Colors.red,
          onChanged: (double value) {
            print('$value');
            setState(() {
              _updateSlider = value;
            });
          },
          onChangeStart: (value) {
            print('start -> $value');
          },
          onChangeEnd: (value) {
            print('end -> $value');
          },
        ),
      ),
    );
  }
}
