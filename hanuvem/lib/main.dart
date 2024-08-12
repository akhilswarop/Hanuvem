import 'package:flutter/material.dart';
import 'package:hanuvem/otp.dart';
import 'onboarding_screen.dart'; // Make sure to import your onboarding screen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner App',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/otp': (context) => OtpPage(),
      },
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system, // Automatically switch between light and dark themes based on system settings
    );
  }

  ThemeData get _lightTheme {
    return ThemeData(
      fontFamily: 'Gilroy', // Set default font family here
      colorScheme: ColorScheme.light(
        primary: Colors.blue, // Primary color of the app
        onPrimary: Colors.white, // Text color on primary color
        secondary: Colors.black, // Secondary color of the app
        onSecondary: Colors.white, // Text color on secondary color
        background: Colors.black, // Background color of the app
        onBackground: Colors.white, // Text color on background
        surface: Colors.blue, // Surface color (e.g., card background)
        onSurface: Colors.white, // Text color on surface
        error: Colors.red, // Error color
        onError: Colors.white, // Text color on error color
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue, // AppBar background color
        foregroundColor: Colors.white, // AppBar text color
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue, // Default button color
        textTheme: ButtonTextTheme.primary, // Text color on buttons
      ),
      scaffoldBackgroundColor: Colors.black, // Background color of scaffold

    );
  }

  ThemeData get _darkTheme {
    return ThemeData(
      fontFamily: 'Gilroy', // Set default font family here
      colorScheme: ColorScheme.light(
        primary: Colors.blue, // Primary color of the app
        onPrimary: Colors.white, // Text color on primary color
        secondary: Colors.black, // Secondary color of the app
        onSecondary: Colors.white, // Text color on secondary color
        background: Colors.black, // Background color of the app
        onBackground: Colors.white, // Text color on background
        surface: Colors.blue, // Surface color (e.g., card background)
        onSurface: Colors.white, // Text color on surface
        error: Colors.red, // Error color
        onError: Colors.white, // Text color on error color
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue, // AppBar background color
        foregroundColor: Colors.white, // AppBar text color
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue, // Default button color
        textTheme: ButtonTextTheme.primary, // Text color on buttons
      ),
      scaffoldBackgroundColor: Colors.black, // Background color of scaffold

    );
  }
}
