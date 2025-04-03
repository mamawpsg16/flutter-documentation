import 'package:flutter/material.dart';
class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class NotifierWidget extends StatelessWidget {
  NotifierWidget({super.key});

  CounterNotifier counterNotifier = CounterNotifier();
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      ListenableBuilder(
        listenable: counterNotifier,
        builder: (context, child) {
          return Text('counter: ${counterNotifier.count}');
        },
      ),
      TextButton(
        child: Text('Increment'),
        onPressed: () {
          counterNotifier.increment();
        },
      ),
    ],
  );
  }
}