import 'package:flutter/material.dart';

class CallbackCounter extends StatefulWidget {
  const CallbackCounter({super.key});

  @override
  State<CallbackCounter> createState() => _CallbackCounterState();
}

class _CallbackCounterState extends State<CallbackCounter> {

  int count = 0; // State lives here
  void increment() {
    setState(() {// This updates the parent's state
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DisplayCount(count: count), // Pass count value
          IncrementButton(onPressed: increment), // Pass function
        ],
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {

  final VoidCallback onPressed;  // Receives function from parent

  const IncrementButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed , child: Text('Increment')); // Calls the function from the parent
  }
}

class DisplayCount extends StatelessWidget {

  final int count;

  const DisplayCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text('$count', style: TextStyle(fontSize: 24),);
  }
}