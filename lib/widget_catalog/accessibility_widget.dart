import 'package:flutter/material.dart';

class SemanticsWidget extends StatelessWidget {
  const SemanticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SemanticWidget(),
        MergeSemanticsSample()
      ],
    );
  }
}

class SemanticWidget extends StatelessWidget {
  const SemanticWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Submit Button',
      hint: 'Double tap to submit the form',
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Submit'),
      ),
    );
  }
}

class MergeSemanticsSample extends StatelessWidget {
  const MergeSemanticsSample({super.key});

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Row(
        children: [
          Icon(Icons.volume_up),
          Text('Volume'),
        ],
      ),
    );

  }
}