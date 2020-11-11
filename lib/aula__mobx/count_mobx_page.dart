import 'package:app_flutter_basic_widget_example/aula__mobx/count_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CountMobXPage extends StatelessWidget {
  final countController = CountController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Mobx')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return Text(
                '${countController.count}',
                style: TextStyle(
                  fontSize: 30,
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          countController.increment();
        },
      ),
    );
  }
}
