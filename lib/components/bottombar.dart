import 'package:flutter/material.dart';
import 'package:project/pages/allproducts.dart';
import 'package:project/pages/homepage.dart';
import 'package:project/pages/orders.dart';
import 'package:project/pages/profilepage.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Material(
      elevation: 4, // Ensures it stays above content
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          // Set the background color based on the theme
          color: isDarkMode ? Color(0xFF121212) : Colors.white, 
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Color.fromRGBO(0, 0, 0, 0.3) : Color.fromARGB(197, 97, 84, 84),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(2, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
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
                child: Icon(
                  Icons.home,
                  semanticLabel: 'Home',
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AllProducts()),
                  );
                },
                child: Icon(
                  Icons.search,
                  semanticLabel: 'Browse',
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OrdersPage()),
                  );
                },
                child: Icon(
                  Icons.description,
                  semanticLabel: 'Orders',
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Icon(
                  Icons.account_circle,
                  semanticLabel: 'Profile',
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
