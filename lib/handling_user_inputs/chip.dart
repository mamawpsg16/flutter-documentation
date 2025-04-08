import 'package:flutter/material.dart';

class MyChoiceChip extends StatefulWidget {
  const MyChoiceChip({super.key});

  @override
  _MyChoiceChipState createState() => _MyChoiceChipState();
}

class _MyChoiceChipState extends State<MyChoiceChip> {
  String _selected = 'A';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: ['A', 'B', 'C'].map((option) {
        return ChoiceChip(
          label: Text(option),
          selected: _selected == option,
          onSelected: (selected) {
            setState(() {
              _selected = option;
            });
          },
        );
      }).toList(),
    );
  }
}

class MyFilterChip extends StatefulWidget {
  const MyFilterChip({super.key});

  @override
  _MyFilterChipState createState() => _MyFilterChipState();
}

class _MyFilterChipState extends State<MyFilterChip> {
  final Set<String> _selectedOptions = {'A'};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: ['A', 'B', 'C'].map((option) {
        return FilterChip(
          label: Text(option),
          selected: _selectedOptions.contains(option),
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedOptions.add(option);
              } else {
                _selectedOptions.remove(option);
              }
            });
          },
        );
      }).toList(),
    );
  }
}

