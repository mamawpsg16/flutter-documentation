import 'package:flutter/material.dart';
import 'handling_user_inputs/buttons.dart';
import 'handling_user_inputs/form.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Handling User Inputs Page'),
        ),
        body: MyForm(),  // Use ListView to allow scrolling
      ),
    );
  }
}