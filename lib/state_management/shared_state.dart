import 'package:flutter/material.dart';

class SharedState extends StatefulWidget {
  const SharedState({super.key});

  @override
  State<SharedState> createState() => _SharedStateState();
}

class _SharedStateState extends State<SharedState> {

  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        MyCounter(
          count: count,
        ),
        MyCounter(
          count: count,
        ),
        TextButton(
          child: Text('Increment'),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        )
      ],
    );
  }
}

class MyCounter extends StatelessWidget {
  final int count;
  const MyCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text('$count');
  }
}