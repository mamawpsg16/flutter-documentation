import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() async {
  var response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );
  print(response.body);
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  // Simulate a network call
  Future<String> fetchUserName() async {
    await Future.delayed(Duration(seconds: 5)); // simulate delay
    return "John Doe";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<String>(
          future: fetchUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // loading
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Text("User: ${snapshot.data}");
            } else {
              return Text("No data found");
            }
          },
        ),
    );
  }
}