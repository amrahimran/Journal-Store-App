// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_label, empty_statements

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/models/product.dart';
import 'package:project/pages/cart.dart';
import 'package:project/models/wishlistdata.dart';

class DetailsPage extends StatefulWidget {
  final String productId; 
  // Accept the product id as a parameter.

  const DetailsPage({super.key, required this.productId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late String currentId;
  late Product selectedProduct;
  bool isFavorite = false;
  int selectedQuantity = 1;

  @override
  void initState() {
    super.initState();
    selectedProduct = getProductById(widget.productId);
    isFavorite = wishlist.contains(selectedProduct);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        wishlist.remove(selectedProduct);
      } else {
        wishlist.add(selectedProduct);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedProduct = getProductById(widget.productId); //function to fetch the product based on id.

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, 
        elevation: 0, //  to remove shadow.
        title: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 20.0, 8.0, 16.0),
          child: Text(
            'Bunny Pages',
            style: TextStyle(
              color: Color(0xFF7dadc4),
              fontFamily: 'Chewy',
              fontSize: 25,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Color(0xFF7dadc4)), 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(selectedProduct.image), 
              SizedBox(height: 20),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      selectedProduct.name,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 60),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(selectedProduct.description), 
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7dadc4),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(36, 16, 36, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    child: Text('A5', style: TextStyle(fontSize: 18, fontFamily: 'MontserratRegular')),
                  ),
                  SizedBox(width: 36.0),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7dadc4),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(36, 16, 36, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    child: Text('B5', style: TextStyle(fontSize: 18, fontFamily: 'MontserratRegular')),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text('Colors :' , style: TextStyle(fontFamily: 'MontserratSemiBold')),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 1, 1, 1),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.black, 
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300, width: 1.5),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFACB7), 
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300, width: 1.5),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF7dadc4), 
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300, width: 1.5),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 92, 206, 120), 
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300, width: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Quantity :' , style: TextStyle(fontFamily: 'MontserratSemiBold'))),
              SizedBox(height: 12),
              QuantitySelector(
                onQuantityChanged: (value) {
                  setState(() {
                    selectedQuantity = value;
                  });
                }
              ),
              SizedBox(height: 26),
              Row(
                children: [
                  Text('Rs. ${selectedProduct.price}' , style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
                  SizedBox(width: 35),
                  ElevatedButton(
                    onPressed: () {
                      final existingItemIndex = cartItems.indexWhere(
                        (item) => item['id'] == selectedProduct.id,
                      );

                      if (existingItemIndex != -1) {
                        // If item already in cart, increase quantity
                        cartItems[existingItemIndex]['quantity'] += selectedQuantity;
                      } else {
                        // Else, add new item
                        cartItems.add({
                          'id': selectedProduct.id,
                          'name': selectedProduct.name,
                          'image': selectedProduct.image,
                          'price': selectedProduct.price,
                          'quantity': selectedQuantity,
                          // 'size': selectedSize,
                        });

                        saveCartItems();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to cart!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF7dadc4),
                      padding: EdgeInsets.fromLTRB(25, 22, 25, 22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    child: Text('Add To Cart', style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18))
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }

  // Mock function to retrieve product by ID (replace with actual logic to get product)
  Product getProductById(String productId) {
    // You should replace this with the actual logic to get the product by ID from your data source
    return allProducts.firstWhere((product) => product.id == productId);
  }
}

class QuantitySelector extends StatefulWidget {
  final ValueChanged<int> onQuantityChanged;

  QuantitySelector({required this.onQuantityChanged});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(quantity);
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        widget.onQuantityChanged(quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: decrement,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '$quantity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: increment,
        ),
      ],
    );
  }
}
