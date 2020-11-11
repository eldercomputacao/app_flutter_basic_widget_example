import 'package:mobx/mobx.dart';

class CountController {
  Observable _count = Observable(0);

  int get count => _count.value;
  set count(int newValue) => _count.value = newValue;

  Action increment;

  CountController() {
    increment = Action(() {
      crement();
    });
  }

  crement() {
    //_count.value = _count.value + 1;
    count++;
  }
}
