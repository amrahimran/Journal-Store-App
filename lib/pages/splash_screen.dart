// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/pages/login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
        },
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage('assets/images/splashimg.webp'),
              fit: BoxFit.cover )
          ),
        ),
      ),
    );
  }
}