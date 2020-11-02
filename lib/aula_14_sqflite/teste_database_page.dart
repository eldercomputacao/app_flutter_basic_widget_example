import 'package:app_flutter_basic_widget_example/aula_14_sqflite/database_helper.dart';
import 'package:flutter/material.dart';

class TesteDatabasePage extends StatelessWidget {
  _testeCriacaoDatabase() async {
    await DatabaseHelper().getDatabase();
  }

  @override
  Widget build(BuildContext context) {
    _testeCriacaoDatabase();

    return Scaffold(
      appBar: AppBar(title: Text('Teste Database')),
      body: Container(),
    );
  }
}
