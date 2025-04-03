// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';
import 'package:project/pages/splash_screen.dart'; // Import your custom app bar

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomBar(), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profilepic.webp'), 
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Amrah Imran",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "fathimaamrah@gmail.com",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            const Text(
              "0769911190",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),

            const SizedBox(height: 30),

            // Favorites Section
            Row(
              children: [
                const Icon(Icons.favorite, color:Color(0xFF7dadc4), size: 28),
                const SizedBox(width: 15),
                const Text(
                  "Favorites",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 30),
                
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Icon(Icons.logout,color:Colors.redAccent),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Splashscreen()));
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color:Colors.redAccent),
                  ),
                ),
                const SizedBox(width: 30),
                
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
