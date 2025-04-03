import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // 1. Create a GlobalKey for the FormState
  final _formKey = GlobalKey<FormState>();
  
  // 2. Create TextEditingControllers for each TextFormField
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  
  // 3. Define the form fields
  String _name = '';
  String _email = '';

  // 4. Form validation logic
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  // 5. Method to save the form and handle submission
  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, save the form data and show a Snackbar
      _formKey.currentState?.save();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form Submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Attach the GlobalKey<FormState>
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 6. Name TextFormField
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name',    border: OutlineInputBorder(),),
              validator: _validateName, // Apply validation logic
              onSaved: (value) => _name = value ?? '', // Save the value
            ),
            SizedBox(height: 16), // Add some spacing
            // 7. Email TextFormField
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email',    border: OutlineInputBorder(),),
              validator: _validateEmail, // Apply validation logic
              onSaved: (value) => _email = value ?? '', // Save the value
            ),
            SizedBox(height: 16), // Add some spacing
            // 8. Submit Button
            ElevatedButton(
              onPressed: _saveForm, // Trigger the form save
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
