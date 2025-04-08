import 'package:flutter/material.dart';

class MySegmentedButton extends StatefulWidget {
  const MySegmentedButton({super.key});

  @override
  State<MySegmentedButton> createState() => _MySegmentedButtonState();
}

class _MySegmentedButtonState extends State<MySegmentedButton> {
  // String _selected = 'Daily 1'; // Default selected value
  Set<String> _selected = {'Option A'};



  @override
  Widget build(BuildContext context) {
    return 
    // SegmentedButton<String>(
    //   segments: const <ButtonSegment<String>>[
    //     ButtonSegment(value: 'Daily 1', label: Text('Daily 1')),
    //     ButtonSegment(value: 'Weekly', label: Text('Weekly')),
    //     ButtonSegment(value: 'Monthly', label: Text('Monthly')),
    //   ],
    //   selected: <String>{_selected},
    //   onSelectionChanged: (newSelection) {
    //     setState(() {
    //       _selected = newSelection.first;
    //     });
    //   },
    // );

    SegmentedButton<String>(
      multiSelectionEnabled: true,
      segments: const <ButtonSegment<String>>[
        ButtonSegment(value: 'Option A', label: Text('A V1')),
        ButtonSegment(value: 'Option B', label: Text('B V1')),
        ButtonSegment(value: 'Option C', label: Text('C V1')),
      ],
      selected: _selected,
      onSelectionChanged: (newSelection) {
        setState(() {
          _selected = newSelection; // ✅ FIXED: assign the whole set
        });
      },
    );
  }
}