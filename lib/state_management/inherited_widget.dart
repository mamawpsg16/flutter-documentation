import 'package:flutter/material.dart';

/// Root widget that holds the counter state
class InheritedState extends StatefulWidget {
  const InheritedState({super.key});

  @override
  State<InheritedState> createState() => _InheritedStateState();
}

class _InheritedStateState extends State<InheritedState> {
  int counter = 0; // Counter state

  // Method to increment the counter
  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      counter: counter,         // Pass counter state
      increment: _incrementCounter, // Pass function to update counter
      child: InheretedCounterScreen(), // Child widget that uses this state
    );
  }
}

/// InheritedWidget to share counter state with child widgets
class CounterInheritedWidget extends InheritedWidget {
  final int counter; // Shared counter value
  final VoidCallback increment; // Shared function to update counter

  const CounterInheritedWidget({
    Key? key,
    required Widget child,
    required this.counter,
    required this.increment,
  }) : super(key: key, child: child);

  /// Method to retrieve the nearest `CounterInheritedWidget` in the widget tree
  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  /// Determines when widgets using this should be rebuilt
  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return oldWidget.counter != counter; // Rebuild only if counter changes
  }
}

/// Screen that displays the counter and button
class InheretedCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the inherited widget
    final inheritedCounter = CounterInheritedWidget.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display counter value
          Text(
            "Counter: ${inheritedCounter?.counter}",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),

          // Button to increment counter
          ElevatedButton(
            onPressed: inheritedCounter?.increment, // Call shared function
            child: Text("Increment Counter"),
          ),
        ],
      ),
    );
  }
}