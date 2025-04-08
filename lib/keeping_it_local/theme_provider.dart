import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light; // Default to light mode.

  bool get isDarkMode => themeMode == ThemeMode.dark; // A helper to check if the current theme is dark.

  // Toggle between light and dark mode, save the preference, and notify listeners.
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners (widgets) about the theme change.
    saveThemeToPrefs(isOn); // Save the theme preference to SharedPreferences.
  }

  // Load the theme preference from SharedPreferences when the app starts.
  Future<void> loadThemeFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('isDarkMode') ?? false; // Default to light if no preference is saved.
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      notifyListeners(); // Notify listeners about the theme change.
    } catch (e) {
      themeMode = ThemeMode.light; // Default to light if loading fails.
      notifyListeners();
      print('Error loading theme preferences: $e');
    }
  }

  // Save the theme preference to SharedPreferences.
  Future<void> saveThemeToPrefs(bool isDark) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', isDark); // Save the theme preference.
    } catch (e) {
      print('Error saving theme preferences: $e');
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Get the current theme provider.

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.light_mode), // Icon for light mode.
          Switch(
            value: themeProvider.isDarkMode, // Switch value based on current theme mode.
            onChanged: (value) {
              themeProvider.toggleTheme(value); // Change the theme when the switch is toggled.
            },
          ),
          Icon(Icons.dark_mode), // Icon for dark mode.
        ],
      ),
    );
  }
}
