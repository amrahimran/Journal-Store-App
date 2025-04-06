// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:project/pages/allproducts.dart';
import 'package:project/pages/homepage.dart';
import 'package:project/pages/orders.dart';
import 'package:project/pages/profilepage.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4, // Ensures it stays above content
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:[
          BoxShadow(
            color: const Color.fromARGB(197, 97, 84, 84),
            spreadRadius: 0,
            blurRadius: 8,
            offset:Offset(2,-2)
          )
        ] ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                child: const Icon(Icons.home, semanticLabel: 'Home'),
              ),
              GestureDetector(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllProducts()));
              },
              child: const Icon(Icons.search, semanticLabel: 'Browse',),),
        
              GestureDetector(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OrdersPage()));
              },
              child: const Icon(Icons.description, semanticLabel: 'Orders',),),
        
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: const Icon(Icons.account_circle, semanticLabel: 'Profile'),
              ),
            ],
            
          
          ),
        ),
      ),
    );
  }
}
