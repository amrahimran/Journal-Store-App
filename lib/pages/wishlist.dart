// wishlist.dart
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';
import 'package:project/models/wishlistdata.dart';
import 'package:project/pages/details.dart';

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
    void removeFromWishlist(String productId) {
      setState(() {
        wishlist.removeWhere((product) => product.id == productId);
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomBar(),
      body: wishlist.isEmpty
          ? Center(child: 
          Text('Your wishlist is empty', style:TextStyle(fontFamily: 'MontserratRegular')))
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final product = wishlist[index];
                return ListTile(
                  leading: Image.asset(product.image, width: 50),
                  title: Text(product.name),
                  subtitle: Text('Rs. ${product.price}'),
                   trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Color(0xFF7dadc4)),
                    onPressed: () {
                      removeFromWishlist(product.id);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(productId: product.id),
                      ),
                    );
                  },
                );
              },
            ),
            bottomNavigationBar: Bottombar(),
    );
  }
}
