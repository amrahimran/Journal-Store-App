// ignore_for_file: unused_import, unused_element

import 'package:flutter/material.dart';
import 'package:project/pages/splash_screen.dart';
import 'package:project/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        iconTheme: IconThemeData(color:Color(0xFF7dadc4),
        size: 30
        )
      ),
      home: FutureBuilder<bool>(
        future: _checkLoginStatus(), // Call to check login status
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking
            return Splashscreen(); 
          } else if (snapshot.hasData && snapshot.data == true) {
            // If user is logged in, go to HomePage
            return HomePage();
          } else {
            // If user is not logged in, go to LoginPage
            return Splashscreen();
          }
        },
      ),
    );
  }

  // Function to check login status from SharedPreferences
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    return loggedIn;
  }
}

