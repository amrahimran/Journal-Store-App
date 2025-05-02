// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_function_literals_in_foreach_calls, unused_import

import 'package:flutter/material.dart';
import 'package:project/pages/cart.dart';
import 'package:project/pages/orders.dart';
import 'package:project/models/orderdata.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

enum PaymentMethod { cash, card }

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController addressController = TextEditingController();
  PaymentMethod? _selectedPaymentMethod = PaymentMethod.cash;

  void confirmOrder() {
    if (addressController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Missing Address"),
            content: Text("Please enter your address before placing the order."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              )
            ],
          );
        },
      );
      return;
    }

    final orderDetails = {
      'products': cartItems,
      'address': addressController.text.trim(),
      'paymentMethod': _selectedPaymentMethod.toString().split('.').last,
      'totalPrice': calculateTotalPrice(),
    };

    saveOrder(orderDetails);

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
    double total = 0;
    cartItems.forEach((item) {
      total += item['price'] * item['quantity'];
    });
    return total;
  }

  void saveOrder(Map<String, dynamic> orderDetails) {
    orders.add(orderDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(product['image'], width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      title: Text(product['name'], style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('Qty: ${product['quantity']} - Rs. ${product['price']}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Delivery Address',
                hintText: '123 Flower Street, Colombo',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Payment Method", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                RadioListTile<PaymentMethod>(
                  title: const Text('Cash on Delivery'),
                  value: PaymentMethod.cash,
                  groupValue: _selectedPaymentMethod,
                  activeColor: Color(0xFF7dadc4),
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
                RadioListTile<PaymentMethod>(
                  title: const Text('Card Payment'),
                  value: PaymentMethod.card,
                  groupValue: _selectedPaymentMethod,
                  activeColor: Color(0xFF7dadc4),
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: confirmOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7dadc4),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                elevation: 4,
              ),
              child: Text(
                'Confirm Order',
                style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'MontserratRegular'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
