import 'package:flutter/material.dart';
import 'package:project/models/product.dart'; 

class DetailsPage extends StatelessWidget {
  final String productId; 
  // Accept the product ID as a parameter.

  const DetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // Retrieve the product based on the product ID
    Product selectedProduct = getProductById(productId); // A function to fetch the product based on ID

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(selectedProduct.image), // Display the product image
            SizedBox(height: 20),
            Text(
              selectedProduct.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Rs. ${selectedProduct.price}"),
            SizedBox(height: 20),
            Text(selectedProduct.description), // Display the product description
          ],
        ),
      ),
    );
  }

  // Mock function to retrieve product by ID (replace with actual logic to get product)
  Product getProductById(String productId) {
    // You should replace this with the actual logic to get the product by ID from your data source
    return allProducts.firstWhere((product) => product.id == productId);
  }
}
