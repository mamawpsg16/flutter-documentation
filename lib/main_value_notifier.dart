import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterApp();
  }
}

class CounterApp extends StatelessWidget {
  // Create a ValueNotifier to manage a counter
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ValueNotifier Example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ValueListenableBuilder listens for changes in counter
            ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, count, child) {
                return Text(
                  'Counter: $count',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Increment the counter
                    counter.value++;
                  },
                  child: Text("Increment"),
                ),
                TextButton(
                  onPressed: () {
                    // Decrement the counter
                    counter.value--;
                  },
                  child: Text("Decrement"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
