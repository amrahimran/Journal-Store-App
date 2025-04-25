// orders.dart
// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';
import 'package:project/models/orderdata.dart';
import 'package:project/pages/orderdetails.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  
    void _deleteOrder(int index) {
    setState(() {
      orders.removeAt(index); // Remove the order at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomBar(),
      body: orders.isEmpty
          ? Center(child: Text("No orders placed yet"))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  color: Color(0xFF7dadc4),
            
                  margin: EdgeInsets.all(8.0),
                  elevation: 4.0,
                  child: ListTile(
                    title: Text("Order #${index + 1}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address: ${order['address']}"),
                        Text("Total: Rs. ${order['totalPrice']}"),
                        
                        IconButton(onPressed: (){
                          _deleteOrder(index);
                        }, icon: Icon(Icons.delete, color: Colors.white,),
                    )],
                      
                    ),
                    
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailsPage(order: order),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            bottomNavigationBar: Bottombar(),
    );
  }
}
