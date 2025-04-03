import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/view_models/counter_view_model.dart'; // Import the ViewModel

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterViewModel(), // Provide the ViewModel
      child: CounterApp(),
    ),
  );
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
        appBar: AppBar(title: Text("MVVM Counter Example")),
        body: Consumer<CounterViewModel>( // Listen to changes in ViewModel
          builder: (context, viewModel, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter: ${viewModel.count}', // Display the count from ViewModel
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        viewModel.increment(); // Increment the counter through ViewModel
                      },
                      child: Text("Increment"),
                    ),
                    TextButton(
                      onPressed: () {
                        viewModel.decrement(); // Decrement the counter through ViewModel
                      },
                      child: Text("Decrement"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
