import 'package:flutter/widgets.dart';
import 'package:todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> get alltasks => [..._tasks];

  void deleteTask(Task task) {
    _tasks.removeWhere((t) => t == task);
    notifyListeners();
  }

  void taskToggle(Task task) {
    int index = _tasks.indexWhere((element) => element == task);
    Task ta = _tasks[index];
    ta.toggleDone();
    notifyListeners();
  }
}
