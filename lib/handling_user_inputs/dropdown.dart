import 'package:flutter/material.dart';
class MyDropdownExample extends StatefulWidget {
  const MyDropdownExample({super.key});

  @override
  State<MyDropdownExample> createState() => _MyDropdownExampleState();
}

class _MyDropdownExampleState extends State<MyDropdownExample> {
  String? _selectedValue = 'Option A';

  final List<String> _options = ['Option A', 'Option B', 'Option C'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      hint: const Text('Select an option'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      items: _options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({super.key});

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String? _selected = 'Option A';

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: _selected,
      onSelected: (String? value) {
        setState(() {
          _selected = value;
        });
      },
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 'Option A', label: 'Option A'),
        DropdownMenuEntry(value: 'Option B', label: 'Option B'),
        DropdownMenuEntry(value: 'Option C', label: 'Option C'),
      ],
    );
  }
}

// Step 1: Define the enum with extra data
enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

// Step 2: Create a stateful widget that uses DropdownMenu
class ColorDropdownExample extends StatefulWidget {
  const ColorDropdownExample({super.key});

  @override
  State<ColorDropdownExample> createState() => _ColorDropdownExampleState();
}

class _ColorDropdownExampleState extends State<ColorDropdownExample> {
  ColorLabel? selectedColor = ColorLabel.green;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu<ColorLabel>(
              initialSelection: selectedColor,
              label: const Text('Select a color'),
              requestFocusOnTap: true,
              onSelected: (ColorLabel? color) {
                setState(() {
                  selectedColor = color;
                });
              },
              dropdownMenuEntries: ColorLabel.values.map((ColorLabel color) {
                return DropdownMenuEntry<ColorLabel>(
                  value: color,
                  label: color.label,
                  enabled: color.label != 'Grey', // Example: disable "Grey"
                  style: MenuItemButton.styleFrom(
                    foregroundColor: color.color,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              selectedColor != null
                  ? 'Selected: ${selectedColor!.label}'
                  : 'No color selected',
              style: TextStyle(
                fontSize: 18,
                color: selectedColor?.color ?? Colors.black,
              ),
            ),
          ],
        ),
      );
  }
}

