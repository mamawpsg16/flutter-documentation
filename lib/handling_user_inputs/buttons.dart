import 'package:flutter/material.dart';

class BasicButton extends StatefulWidget {
  const BasicButton({super.key});

  @override
  _BasicButtonState createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  // Create a TextEditingController to manage the TextField
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Always dispose the controller when you're done with it
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Action to perform when the button is pressed
            print('Button Pressed');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(16),
            textStyle: TextStyle(fontSize: 20),
          ),
          child: Text('Basic Button'),
        ),
        Text('This is a Text Button', style: TextStyle(fontSize: 20),),
        SelectableText('This is a Selectable Text', style: TextStyle(fontSize: 20),),
        RichText(
          text: TextSpan(
            text: 'Hello ',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' world!'),
            ],
          ),
        ),
        TextField(
          controller: _controller, // Attach the controller
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mascot Name',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Print the text from the TextField when this button is pressed
            print('Mascot Name: ${_controller.text}');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(16),
            textStyle: TextStyle(fontSize: 20),
          ),
          child: Text('Show Mascot Name'),
        ),
      ],
    );
  }
}


class MultipleTextFields extends StatefulWidget {
  const MultipleTextFields({super.key});

  @override
  _MultipleTextFieldsState createState() => _MultipleTextFieldsState();
}

class _MultipleTextFieldsState extends State<MultipleTextFields> {
  // Declare two TextEditingController instances
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    // Dispose each controller independently when the widget is removed
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multiple TextFields Example")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: 'First Field',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Add some space between the fields
            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'Second Field',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                // Print the text from both TextFields
                print('First Field: ${_controller1.text}');
                print('Second Field: ${_controller2.text}');
              },
              child: Text('Show TextField Values'),
            ),
          ],
        ),
      ),
    );
  }
}
