import 'package:flutter/material.dart';
import 'package:project/pages/cart.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Material(
      elevation: 0,
      color: Colors.transparent, // Making background transparent so that custom background color can be set
      child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDarkMode ? Color(0xFF121212) : Colors.white, // Change background color based on theme
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 16.0, 8.0, 16.0),
              child: Text(
                'Bunny Pages',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Color(0xFF7dadc4), // Text color changes based on theme
                  fontFamily: 'Chewy',
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: isDarkMode ? Colors.white : Color(0xFF7dadc4), // Icon color changes based on theme
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
