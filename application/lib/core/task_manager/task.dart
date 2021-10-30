import 'dart:async';

class Task {
  Task({
    required this.closure,
    required this.completer,
    this.onComplete,
  });

  final Future Function() closure;
  final Completer completer;
  Function()? onComplete;

  Future execute() async {
    await closure();
    completer.complete();
    onComplete?.call();
    await Future.microtask(() {});
  }
}
