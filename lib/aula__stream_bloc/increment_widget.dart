import 'package:app_flutter_basic_widget_example/aula__stream_bloc/increment_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class IntrementWidget extends StatefulWidget {
  @override
  _IntrementWidgetState createState() => _IntrementWidgetState();
}

class _IntrementWidgetState extends State<IntrementWidget> {
  // int _count = 0;

  // _increment() {
  //   setState(() {
  //     _count++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print('build foi chamado');
    final bloc = BlocProvider.getBloc<IncrementBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Bloc'),
      ),
      body: StreamBuilder(
        stream: bloc.out,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Center(child: Text('Você clicou ${snapshot.data} vezes.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.increment();
        },
      ),
    );
  }
}
