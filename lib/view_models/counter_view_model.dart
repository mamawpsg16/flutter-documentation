import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counterModel = CounterModel(0); // Instantiate the model

  int get count => _counterModel.count; // Expose the count to the View

  void increment() {
    _counterModel.increment(); // Increment the model
    notifyListeners(); // Notify listeners to rebuild the View
  }

  void decrement() {
    _counterModel.decrement(); // Decrement the model
    notifyListeners(); // Notify listeners to rebuild the View
  }
}
