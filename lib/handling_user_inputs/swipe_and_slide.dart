import 'package:flutter/material.dart';

class SwipeExample extends StatelessWidget {
  const SwipeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(color: Colors.blue, child: Center(child: Text('Page 1'))),
        Container(color: Colors.green, child: Center(child: Text('Page 2'))),
        Container(color: Colors.red, child: Center(child: Text('Page 3'))),
      ],
    );
  }
}

class DismissibleExample extends StatelessWidget {
  const DismissibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(10, (index) {
        return Dismissible(
          key: Key(index.toString()),
          onDismissed: (direction) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Item $index dismissed')),
            );
          },
          child: ListTile(
            title: Text('Item $index'),
            tileColor: Colors.blue[(index % 9) * 100],
          ),
        );
      }),
    );
  }
}


class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({super.key});

  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Container(color: Colors.blue, child: Center(child: Text('Page 1'))),
    Container(color: Colors.green, child: Center(child: Text('Page 2'))),
    Container(color: Colors.red, child: Center(child: Text('Page 3'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: _pages[_currentIndex],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _currentIndex = (_currentIndex + 1) % _pages.length;
            });
          },
          child: Text('Next Page'),
        ),
      ],
    );
  }
}