import 'package:flutter/material.dart';

class ToggleWidgets extends StatelessWidget {
  const ToggleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SwitchExample(),
        MultiSelectExample(),
        CheckboxExample(),
        RadioExample(),
     ],
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue!;
            });
          },
        ),
        Text(_isChecked ? "Checked" : "Unchecked"),
      ],
    );
  }
}


class MultiSelectExample extends StatefulWidget {
  const MultiSelectExample({super.key});

  @override
  _MultiSelectExampleState createState() => _MultiSelectExampleState();
}

class _MultiSelectExampleState extends State<MultiSelectExample> {
  // Directly use a Map with options as keys and their selection state (false) as values
  final Map<String, bool> _selectedOptions = {
    'Option 1': false,
    'Option 2': false,
    'Option 3': false,
    'Option 4': false,
  };

  // Method to get all selected options
  List<String> _getSelectedValues() {
    List<String> selectedValues = [];
    _selectedOptions.forEach((key, value) {
      if (value) {
        selectedValues.add(key);
      }
    });
    return selectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Loop through the map to create a CheckboxListTile for each option
        ..._selectedOptions.keys.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: _selectedOptions[option],
            onChanged: (bool? value) {
              setState(() {
                _selectedOptions[option] = value!;
              });
            },
          );
        }),
        
        // Button to print selected values
        ElevatedButton(
          onPressed: () {
            List<String> selectedValues = _getSelectedValues();
            print('Selected Values: $selectedValues');
          },
          child: Text('Show Selected'),
        ),
      ],
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  _SwitchExampleState createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool isSwitched = false;
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SwitchListTile(
          title: const Text('Lights'),
          value: _lights,
          onChanged: (bool value) {
            setState(() {
              _lights = value;
            });
          },
          secondary: const Icon(Icons.lightbulb_outline),
        ),
        Switch(
          value: isSwitched,
          onChanged: (bool newValue) {
            setState(() {
              isSwitched = newValue;
            });
          },
        ),
        Text(isSwitched ? "Switched On" : "Switched Off"),
      ],
    );
  }
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  _RadioExampleState createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('Option 1'),
          leading: Radio<int>(
            value: 1,
            groupValue: selectedValue,
            onChanged: (int? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Option 2'),
          leading: Radio<int>(
            value: 2,
            groupValue: selectedValue,
            onChanged: (int? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
          ),
        ),
        Text('Selected Option: $selectedValue'),
      ],
    );
  }
}