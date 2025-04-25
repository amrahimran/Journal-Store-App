// ignore_for_file: unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';
import 'package:project/pages/checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/pages/homepage.dart';
import 'dart:convert';

/// GLOBAL cartItems list so it can be used anywhere
List<Map<String, dynamic>> cartItems = [];

/// GLOBAL function to load cart items from SharedPreferences
Future<void> loadCartItems() async {
  final prefs = await SharedPreferences.getInstance();
  final cart = prefs.getStringList('cart') ?? [];
  cartItems = cart.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
}

/// GLOBAL function to save cart items to SharedPreferences
Future<void> saveCartItems() async {
  final prefs = await SharedPreferences.getInstance();
  final encoded = cartItems.map((item) => jsonEncode(item)).toList();
  await prefs.setStringList('cart', encoded);
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    _loadCartAndRefresh();
  }

  Future<void> _loadCartAndRefresh() async {
    await loadCartItems(); // use global function
    setState(() {}); // refresh UI after loading
  }

  void _removeItem(int index) async {
    cartItems.removeAt(index);
    await saveCartItems(); // use global save
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomBar(),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, fontFamily: 'MontserratRegular'),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return ListTile(
                  leading: item['image'] != null
                      ? Image.asset(
                          item['image'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.shopping_cart,
                          color: Color(0xFFA09973),
                        ),
                  title: Text(item['name'] ?? 'Unknown Item'),
                  subtitle: Text(
                      'Quantity: ${item['quantity'] ?? 1} | Rs. ${item['price'] ?? 0}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Color(0xFF7dadc4),
                    ),
                    onPressed: () {
                      _removeItem(index);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutPage()),
            );
          },
          backgroundColor: Color(0xFF7dadc4),
          child: Icon(
            Icons.shopping_cart_checkout,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
