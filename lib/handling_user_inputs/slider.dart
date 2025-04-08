import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Slider Value: ${_sliderValue.toStringAsFixed(2)}'),
        Slider(
          value: _sliderValue,
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: _sliderValue.toStringAsFixed(2),
          onChanged: (double newValue) {
            setState(() {
              _sliderValue = newValue;
            });
          },
        ),
      ],
    );
  }
}