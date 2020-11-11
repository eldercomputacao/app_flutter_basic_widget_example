import 'package:mobx/mobx.dart';
//part 'count_controller_base.g.dart';

// Include generated file
//part 'todos.g.dart';

// This is the class used by rest of your codebase
//class Todo = TodoBase with _$Todo;
//class CountController = CountControllerBase with _$CountController;

abstract class CountControllerBase with Store {
  @observable
  int count = 0;

  @action
  increment() {
    count++;
  }
}
