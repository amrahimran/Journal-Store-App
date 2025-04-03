import 'package:flutter/material.dart';
import 'package:project/pages/homepage.dart';
import 'package:project/pages/profilepage.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4, // Ensures it stays above content
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              child: const Icon(Icons.home, semanticLabel: 'Home'),
            ),
            // Icon(Icons.home, semanticLabel: 'Home',),
            Icon(Icons.search, semanticLabel: 'Browse',),
            Icon(Icons.description, semanticLabel: 'Orders',),
            // Icon(Icons.account_circle, semanticLabel: 'Profile',)

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: const Icon(Icons.account_circle, semanticLabel: 'Profile'),
            ),
          ],
          
        
        ),
      ),
    );
  }
}
