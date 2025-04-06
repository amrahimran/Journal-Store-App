// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:project/models/product.dart';
import 'package:project/pages/details.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  //basically here i am saying that anyone that uses this widget must provide a product object.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(productId: product.id)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 12, 6, 12),
        width:160,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, height: 190, fit: BoxFit.cover),
            SizedBox(height: 3.0,),
            Center(child: Text(product.name,style: TextStyle(fontFamily: 'MontserratRegular',fontSize: 13.5),)),
            SizedBox(height: 2.0,),
            Center(child: Text("Rs."+product.price.toString(), style: TextStyle(fontFamily: 'MontserratRegular',fontSize: 13.5,
            color: Color.fromARGB(255, 158, 152, 152))))
          ],
        )
      ),
    );
  }
}
