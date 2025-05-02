// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final Map<String, dynamic> order;

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white, // White background
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Order Details", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Card(
              color: Color(0xFFF0F4F8), // Soft blue-gray tone
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order ID: #${order['id']}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text("Address:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(order['address'], style: TextStyle(fontSize: 16)),
                    SizedBox(height: 12),
                    Text("Total:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Rs. ${order['totalPrice']}", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),

            // Product List Section
            Text("Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            ...order['products'].map<Widget>((product) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product['image'], // Make sure this path exists in assets
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    product['name'],
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "Rs. ${product['price']} x ${product['quantity']}",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
