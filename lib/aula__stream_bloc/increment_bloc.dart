import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class IncrementBloc extends BlocBase {
  int _count = 0;

  final _incrementController = StreamController<int>();
  Stream<int> get out => _incrementController.stream;
  Sink<int> get sink => _incrementController.sink;

  increment() {
    _count++;
    sink.add(_count);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
