// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final Map<String, dynamic> order; // Receive order details as an argument

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Order Details"),backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order ID: #${order['id']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text("Address: ${order['address']}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Total: Rs. ${order['totalPrice']}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("Products:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            for (var product in order['products']) // Assuming products is a list in the order
              Text("${product['name']} - Rs. ${product['price']} x ${product['quantity']}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
