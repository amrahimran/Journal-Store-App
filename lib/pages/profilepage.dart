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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture & Name
              Column(
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
                      fontFamily: 'MontserratSemibold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 14, fontFamily: 'MontserratRegular', color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "fathimaamrah@gmail.com",
                      style: TextStyle(fontSize: 16, fontFamily: 'MontserratRegular', color: Colors.black87),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Phone",
                      style: TextStyle(fontSize: 14, fontFamily: 'MontserratRegular', color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "0769911190",
                      style: TextStyle(fontSize: 16, fontFamily: 'MontserratRegular', color: Colors.black87),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Shipping Address",
                      style: TextStyle(fontSize: 14, fontFamily: 'MontserratRegular', color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Park Gardens, Colombo-05",
                      style: TextStyle(fontSize: 16, fontFamily: 'MontserratRegular', color: Colors.black87),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Text(
                    "Favorites",
                    style: TextStyle(fontSize: 16, fontFamily: 'MontserratRegular'),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.favorite, color: Color(0xFF7dadc4), size: 24),
                ],
              ),
              const SizedBox(height: 30),

              Row(
                children: [
                  const Icon(Icons.logout, color: Colors.redAccent),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => Splashscreen())
                      );
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
