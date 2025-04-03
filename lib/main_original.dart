import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_widgets.dart';
import 'state_management/stateful_widget.dart' show StatefulWidgetExample;
import 'state_management/shared_state.dart' show SharedState;
import 'state_management/inherited_widget.dart' show InheritedState;
import 'state_management/using_callback.dart' show CallbackCounter;
import 'state_management/change_notifier_widget.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Home Page'),
        ),
        body: NotifierWidget(),  // Use ListView to allow scrolling
      ),
    );
  }

  ListView _mainBody() {
    return ListView(
      children: [
        const CustomText(),
        const CustomButton(),
        const PaddedText(
          text: 'Hello, World!',
          paddingValue: 16.0,
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
        const CounterWidget(),
        const CustomContainer(),
        const RowChildWidgets(), // ✅ Now works fine
        const ButtonSection(),
        const IconRow(),
        const CenteredFlutterLogo(),
        const ContainerizeFlutterLogo(),
        const LayoutMultipleWidgets(),
        const LayoutMultipleWidgets1(),
      ],
    );
  }
}
