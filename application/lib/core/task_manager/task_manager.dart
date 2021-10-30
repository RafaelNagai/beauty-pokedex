import 'dart:async';

import 'task.dart';

class TaskManager {
  final List<Task> tasks = [];
  bool isRunning = false;

  Future add(Future Function() closure) {
    final Completer completer = Completer();
    tasks.add(Task(closure: closure, completer: completer));
    _process();
    return completer.future;
  }

  Future<void> _process() async {
    if (!isRunning) {
      _moveQueueToNext();
    }
  }

  _moveQueueToNext() {
    if (tasks.isNotEmpty) {
      isRunning = true;
      final task = tasks.first;
      tasks.remove(task);
      task.onComplete = () {
        isRunning = false;
        _moveQueueToNext();
      };
      task.execute();
    }
  }
}
