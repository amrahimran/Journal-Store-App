// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_function_literals_in_foreach_calls, unused_import

import 'package:flutter/material.dart';
import 'package:project/pages/cart.dart';
import 'package:project/pages/orders.dart';
import 'package:project/models/orderdata.dart';


class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController addressController = TextEditingController();

  void confirmOrder() {
    // Save order details to orders.dart or any other backend storage
    final orderDetails = {
      'products': cartItems, // Assuming cartItems is where the items are stored
      'address': addressController.text,
      'totalPrice': calculateTotalPrice(),
    };

    // Save to orders (implement the logic to save orders)
    saveOrder(orderDetails);

    // Optionally, show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Order Confirmed"),
          content: Text("Your order has been placed successfully."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  double calculateTotalPrice() {
    // Calculate the total price from the cart
    double total = 0;
    cartItems.forEach((item) {
      total += item['price'] * item['quantity'];
    });
    return total;
  }

  void saveOrder(Map<String, dynamic> orderDetails) {
    // Here, implement the logic to save the order.
    // You could either store it in local storage, a database, or a backend server.
    // For this example, I'll assume saving to a simple list or file.
    orders.add(orderDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Checkout'), backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display cart items
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  return ListTile(
                    leading: Image.asset(product['image']),
                    title: Text(product['name']),
                    subtitle: Text('Qty: ${product['quantity']} - Rs. ${product['price']}'),
                  );
                },
              ),
            ),

            // Address input
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Enter your address'),
              maxLines: 3,
            ),
            SizedBox(height: 20),

            // Confirm order button
            ElevatedButton(
              onPressed: confirmOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7dadc4),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text('Confirm Order', style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'MontserratRegular')),
            ),
          ],
        ),
      ),
    );
  }
}
