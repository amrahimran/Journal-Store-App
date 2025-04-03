// ignore_for_file: unused_import, sized_box_for_whitespace, avoid_print, unused_label, dead_code

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomBar(),
        body: Center(child: Text("Content below AppBar")),
        bottomNavigationBar: Bottombar()
      
          
        ),
    );
     

    //);
  }
}