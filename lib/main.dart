import 'package:flutter/material.dart';
//import 'package:project/pages/splash_screen.dart';
import 'package:project/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        iconTheme: IconThemeData(color:Color(0xFF7dadc4),
        size: 30
        )
      ),
      //home:Splashscreen(),
      home:HomePage()
    
      
    );

    
  }
}

