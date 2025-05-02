// ignore_for_file: unused_import, unused_element

import 'package:flutter/material.dart';
import 'package:project/pages/splash_screen.dart';
import 'package:project/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login.dart';
import 'package:project/pages/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadCartItems(); // Loading the cart items before the app starts.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Light Theme
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF7dadc4), 
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF7dadc4),
          size: 30,
        ),
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   secondary: const Color(0xFFA09973), // your accent color
        // ),
      ),

      // Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFB2E0F7),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFB2E0F7),
          size: 30,
        ),
        // colorScheme: ColorScheme.dark().copyWith(
        //   secondary: const Color(0xFFA09973),
        // ),
      ),

      // 🪄 Make theme follow device setting
      themeMode: ThemeMode.system,

      home: FutureBuilder<bool>(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splashscreen();
          } else if (snapshot.hasData && snapshot.data == true) {
            return HomePage();
          } else {
            return Splashscreen();
          }
        },
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    return loggedIn;
  }
}
