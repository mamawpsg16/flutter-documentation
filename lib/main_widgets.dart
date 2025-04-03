import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Hello, World!');
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          print('Click!');
        },
        child: const Text('A button'),
      ),
    );
  }
}


class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('Text inside Container'),
    );
  }
}


class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(Icons.favorite, color: Colors.pink, size: 24.0),
        Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
        Icon(Icons.beach_access, color: Colors.blue, size: 36.0),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: null, // Disabled button
          child: const Text('Disabled'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {}, // Enabled button
          child: const Text('Enabled'),
        ),
        const SizedBox(height: 30),
        Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      ],
    );
  }
}


class RowChildWidgets extends StatelessWidget {
  const RowChildWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Expanded(
          child: Text('Deliver features faster', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
        ),
        Expanded(
          child: FittedBox(
            child: FlutterLogo(),
          ),
        ),
      ],
    );
  }
}


class PaddedText extends StatelessWidget {
  // Required parameters
  final String text;
  final double paddingValue;

  // Optional parameter
  final TextStyle? style;

  // Constructor with key, required parameters, and optional parameters
  const PaddedText({
    super.key,             // Pass key to the superclass
    required this.text,     // Required parameter
    required this.paddingValue,  // Required parameter
    this.style,             // Optional parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),  // Use the paddingValue
      child: Text(
        text,                         // Display the text passed
        style: style ?? TextStyle(),  // Use the style, or default to empty style
      ),
    );
  }
}


class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key}); // Add `const`

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter: $_counter',
          style: const TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

class CenteredFlutterLogo extends StatelessWidget {
  const CenteredFlutterLogo({super.key});

  @override
  Widget build(BuildContext context) {
      return Center(
        child: FlutterLogo(),
      );
  }
}

class ContainerizeFlutterLogo extends StatelessWidget {
  const ContainerizeFlutterLogo({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: FlutterLogo(),
      );
  }
}

class BorderedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4.0), // Black border
        borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Match the border radius
        child: Image.asset('assets/images/image1.png', fit: BoxFit.cover),
      ),
    );
  }
}

class LayoutMultipleWidgets extends StatelessWidget {
  const LayoutMultipleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //    BorderedImage(),
    //    BorderedImage(),
    //   BorderedImage(),
    //   ],  
    // );
    return Row(
      children: [
        Column(
          children: [
            BorderedImage(),
            Text('Dash 1'),
          ],
        ),
        Column(
          children: [
            BorderedImage(),
            Text('Dash 2'),
          ],
        ),
        Column(
          children: [
            BorderedImage(),
            Text('Dash 3'),
          ],
        ),
      ],
    );
  }
}


class BorderedImage1 extends StatelessWidget {
  final String imageUrl;
  final double borderWidth;
  final Color borderColor;

  const BorderedImage1({
    super.key,
    this.imageUrl = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    this.borderWidth = 4.0,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imageUrl),
      ),
    );
  }
}

class LayoutMultipleWidgets1 extends StatelessWidget {
  const LayoutMultipleWidgets1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BorderedImage1(),
        ),
        Expanded(
          child: BorderedImage1(),
        ),
        Expanded(
          child: BorderedImage1(),
        ),
      ],
    );
  }
}

class ToDo {
  final String description;
  final bool isComplete;

  ToDo({required this.description, required this.isComplete});
}

class Repository {
  static List<ToDo> fetchTodos() {
    return [
      ToDo(description: "Buy groceries", isComplete: false),
      ToDo(description: "Walk the dog", isComplete: true),
      ToDo(description: "Finish Flutter project", isComplete: false),
      ToDo(description: "Call mom", isComplete: true),
    ];
  }
}

class ToDoListScreen extends StatelessWidget {
  final List<ToDo> items = Repository.fetchTodos();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, id) {
          var item = items[id];
          return Container(
            padding: const EdgeInsets.all(8.0),
            color: id % 2 == 0 ? Colors.lightBlue : Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.description),
                Icon(
                  item.isComplete ? Icons.check_circle : Icons.cancel,
                  color: item.isComplete ? Colors.green : Colors.red,
                ),
              ],
            ),
          );
        },
      );
  }
}

class DynamicToDoListSCreen extends StatelessWidget {
  final List<ToDo> items = Repository.fetchTodos();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return _MobileLayout(items: items);
        } else {
          return _DesktopLayout(items: items);
        }
      },
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final List<ToDo> items;
  _MobileLayout({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, idx) {
        var item = items[idx];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.description),
              Icon(
                item.isComplete ? Icons.check_circle : Icons.cancel,
                color: item.isComplete ? Colors.green : Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final List<ToDo> items;
  _DesktopLayout({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, idx) {
        var item = items[idx];
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.description, style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Icon(
                  item.isComplete ? Icons.check_circle : Icons.cancel,
                  color: item.isComplete ? Colors.green : Colors.red,
                  size: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
