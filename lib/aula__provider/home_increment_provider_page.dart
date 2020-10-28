import 'package:app_flutter_basic_widget_example/aula__provider/increment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeIncrementProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Provider')),
      body: Center(
        child: Consumer<IntrementProvider>(
            builder: (context, IntrementProvider value, _) {
          return Text('Você clicou ${value.count} vez.');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<IntrementProvider>(context, listen: true).increment();
        },
      ),
    );
  }
}
