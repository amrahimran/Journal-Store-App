// ignore_for_file: unused_import, unused_local_variable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';
import 'package:project/models/product.dart';
import 'package:project/components/productcard.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllproductsState();
}

class _AllproductsState extends State<AllProducts> {
  final List<String> items=['Price', 'Low->High', 'High->Low' ];
  late String selectedOption;
  late List<Product> fullProducts;

  @override
  void initState(){
    super.initState();
    selectedOption = items.first; 
    fullProducts = allProducts.where((product) => product.id.startsWith('L')).toList();
  }
  @override
  
  
  Widget build(BuildContext context) {
    // List<Product> fullProducts=allProducts.where((product)=>product.id.startsWith('L')).toList();
    
    int rows = (fullProducts.length / 2).ceil(); 
    double gridHeight = rows * 250; 

    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomBar(),
      bottomNavigationBar: Bottombar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(25)
                ),
                filled: true,
                fillColor: Colors.grey[100]
                ),
               
                
            ),),
            SizedBox(height:3),
            
            Container(
              margin: EdgeInsets.only(left:15),
              alignment: Alignment.centerLeft,
              height: 30,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                  alignment: Alignment.center,
                  borderRadius: BorderRadius.circular(25),
                  
                  focusColor: Colors.white,
                  
                  icon: const Icon(Icons.arrow_drop_down),
                  value: selectedOption,
                    
                onChanged: (String? newValue){
                  setState(() {
                    selectedOption=newValue!;

                    fullProducts=allProducts.where((product)=>product.id.startsWith('L')).toList();

                    if(selectedOption=='Low->High'){
                      fullProducts.sort((a,b)=>a.price.compareTo(b.price));
                    }
                    else if(selectedOption=='High->Low'){
                      fullProducts.sort((a,b)=>b.price.compareTo(a.price));
                    }
                  });
                  
                },
                items: items.map<DropdownMenuItem<String>>((String value)
                {
                  return DropdownMenuItem<String>(
                    value:value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                    children: [

                      Text(value,
                      textAlign: TextAlign.center,)
                    ],
                    ),
                  );
                }).toList()
                ),
              ),
            ),
            SizedBox(height: 3,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                gridDelegate: 
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0), 
                itemCount: fullProducts.length,
                itemBuilder: (context, index) {
                  final item=fullProducts[index];
         
                  return Align(
                    alignment: Alignment.center,
                    child:ProductCard(product: fullProducts[index])
                  );
              
                  
                }),
            )
          ],
        ),
      ),

    ));
  }
}