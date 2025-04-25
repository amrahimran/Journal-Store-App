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
      theme:ThemeData(
        iconTheme: IconThemeData(color:Color(0xFF7dadc4),
        size: 30
        )
      ),
      home: FutureBuilder<bool>(
        future: _checkLoginStatus(), // Check the login status so i can determine what page the application opens with.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking
            return Splashscreen(); 
          } else if (snapshot.hasData && snapshot.data == true) {
            // If user is logged in, then directly open the home screen.
            return HomePage();
          } else {
            // If user is not logged in, we go back to the splash screen.
            return Splashscreen();
          }
        },
      ),
    );
  }

  // check the login status :)
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('isLoggedIn') ?? false;
    return loggedIn;
  }
}

