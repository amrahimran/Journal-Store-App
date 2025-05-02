// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';
import 'package:project/models/orderdata.dart';
import 'package:project/pages/orderdetails.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  void _deleteOrder(int index) {
    setState(() {
      orders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fetching the current theme mode (light or dark)
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Color for light and dark modes
    final backgroundColor = isDarkMode ? Colors.grey[800] : Colors.white;
    final tileColor = isDarkMode ? Colors.grey[900] : Color(0xFF7dadc4);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final subtitleColor = isDarkMode ? Colors.white70 : Colors.grey[600];

    return Scaffold(
      backgroundColor: backgroundColor, // Update background color based on theme
      appBar: CustomBar(),
      body: orders.isEmpty
          ? Center(
              child: Text(
                "No orders placed yet",
                style: TextStyle(fontSize: 18, color: subtitleColor),
              ),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: tileColor, // Update tile color based on theme
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode ? Colors.black26 : Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    title: Text(
                      "Order #${index + 1}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor, // Update text color based on theme
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address: ${order['address']}",
                            style: TextStyle(color: textColor), // Update subtitle text color
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Total: Rs. ${order['totalPrice']}",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: textColor), // Update icon color
                      onPressed: () => _deleteOrder(index),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailsPage(order: order),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
