import 'package:flutter/material.dart';
import 'handling_user_inputs/buttons.dart';
import 'handling_user_inputs/form.dart';
import 'handling_user_inputs/segmented_button.dart';
import 'handling_user_inputs/chip.dart';
import 'handling_user_inputs/dropdown.dart';
import 'handling_user_inputs/slider.dart';
import 'handling_user_inputs/checkbox_radio_switch.dart';
import 'handling_user_inputs/date_or_time.dart';
import 'handling_user_inputs/swipe_and_slide.dart';
import 'networking_and_data/retrieve_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'keeping_it_local/keeping_it_local.dart';
import 'package:provider/provider.dart'; 
import 'keeping_it_local/theme_provider.dart';
import 'keeping_it_local/cloud_catalog.dart';
import 'keeping_it_local/bottom_navigation.dart';
import 'user_interface/introduction.dart';
import 'widget_catalog/accessibility_widget.dart';
import 'widget_catalog/input.dart';
void main() => runApp(const MyApp());

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   await Hive.openBox('tasksBox');
//   runApp(MyApp());
// }


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter bindings are initialized before app starts.

//   final themeProvider = ThemeProvider(); // Create an instance of ThemeProvider.
  
//   try {
//     await themeProvider.loadThemeFromPrefs(); // Attempt to load saved theme preferences (e.g., dark or light mode).
//   } catch (e) {
//     print('Failed to load preferences: $e');
//     // If loading preferences fails, the app will continue with the default theme.
//   }

//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => themeProvider, // Provide ThemeProvider to the widget tree so the UI can react to changes.
//       child: const MyApp(), // Start the application with MyApp.
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp( // Root widget
//       debugShowCheckedModeBanner: false, // Disable the debug banner
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Handling User Inputs Page'),
//         ),
//         body: HomeScreen()
//       ),
//     );
//   }
// }


/// THEME PROVIDER
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context); // Listen to theme changes from the provider.

//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Hide debug banner.
//       themeMode: themeProvider.themeMode, // Apply the current theme mode (light or dark).
//       theme: ThemeData.light(), // Light theme.
//       darkTheme: ThemeData.dark(), // Dark theme.
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Handling User Inputs Page'), // Title of the app bar.
//         ),
//         body: const HomeScreen(), // Body of the app is a screen where the theme can be toggled.
//       ),
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Cloud Catalog',
//       themeMode: themeProvider.themeMode,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Colors.blue,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.blue,
//           foregroundColor: Colors.white,
//         ),
//         cardTheme: CardTheme(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.blueGrey,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.blueGrey,
//           foregroundColor: Colors.white,
//         ),
//         cardTheme: CardTheme(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//       home: const MainPage(),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp( // Root widget
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home:  const AutocompleteBasicExample(),
    );
  }
}