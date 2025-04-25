// ignore_for_file: avoid_print, override_on_non_overriding_member, annotate_overrides

import 'package:flutter/material.dart';
import 'package:project/pages/cart.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0, 
      color: Colors.white,
      child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 16.0, 8.0, 16.0),
              child: Text('Bunny Pages',style: TextStyle(color:Color(0xFF7dadc4),
               fontFamily: 'Chewy',
               fontSize: 25),),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
              }),
            )
              
          ],
        )
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
