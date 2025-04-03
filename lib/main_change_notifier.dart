import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define the ChangeNotifier class
class CounterNotifier extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();  // Notify listeners to rebuild
  }
}

void main() {
  runApp(
    // Wrap the app with ChangeNotifierProvider to make the CounterNotifier available to the widget tree
    ChangeNotifierProvider(
      create: (context) => CounterNotifier(),
      child: CounterApp(),
    ),
  );
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  // Add this wrapper
      home: Scaffold(    // Move Scaffold inside MaterialApp
        appBar: AppBar(title: Text("ChangeNotifier Example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterNotifier>(
              builder: (context, counterNotifier, child) {
                return Text(
                  'Counter: ${counterNotifier.count}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.read<CounterNotifier>().increment();
              },
              child: Text("Increment"),
            ),
            Consumer<CounterNotifier>(
              builder: (context, counterNotifier, child) {
                return Text(
                  'Counter: ${counterNotifier.count}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
