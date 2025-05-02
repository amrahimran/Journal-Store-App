// ignore_for_file: unused_import, sized_box_for_whitespace, avoid_print, unused_label, dead_code

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';
import 'package:project/models/product.dart';
import 'package:project/components/productcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  final PageController _pageController=PageController();
  int currentpage=0;
  final List<String> heroslides=[
    "assets/heroslides/slide1.png",
    "assets/heroslides/slide2.png",
    "assets/heroslides/slide3.png",
    "assets/heroslides/slide4.png"
  ];
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer)
    {
      if(currentpage<heroslides.length-1){
        currentpage++;
      }else{
        currentpage=0;
      }

      if(_pageController.hasClients){
        _pageController.animateToPage(currentpage, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
  });

  }

  @override
  Widget build(BuildContext context) {
     //.toList() converts the filtered products to a list<Product>
     List<Product> vintageProducts = allProducts.where((product)=>
     product.category.toLowerCase()=="vintage" && product.id.startsWith("L")).toList();

     List<Product> cuteProducts = allProducts.where((product)=>
     product.category.toLowerCase()=="cute" && product.id.startsWith("L")).toList();

     List<Product> journalProducts = allProducts.where((product)=>
     product.category.toLowerCase()=="journal" && product.id.startsWith("L")).toList();

     List<Product> easternProducts = allProducts.where((product)=>
     product.category.toLowerCase()=="eastern" && product.id.startsWith("L")).toList();

     List<Product> otherProducts = allProducts.where((product)=>
     product.category.toLowerCase()=="other" && product.id.startsWith("L")).toList();

     final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return SafeArea(
    child: Scaffold(
      //backgroundColor: Colors.white,
      appBar: const CustomBar(),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: isLandscape ? 250 : 195,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: heroslides.length,
                    onPageChanged: (index) {
                      currentpage = index;
                    },
                    itemBuilder: (context,index)
                    {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(10, 1, 10, 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            heroslides[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }
                  ),
                ),
                SizedBox(height: isLandscape ? 30 : 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Vintage Collection", style: TextStyle(color: Color(0xFF7dadc4), fontSize: 21, fontFamily: 'MontserratMedium')),
                ),
                SizedBox(
                  height: isLandscape ? 300 : 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vintageProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: vintageProducts[index]);
                    },
                  ),
                ),
                SizedBox(height: isLandscape ? 30 : 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Cute Notebooks", style: TextStyle(color: Color(0xFF7dadc4), fontSize: 21, fontFamily: 'MontserratMedium')),
                ),
                SizedBox(
                  height: isLandscape ? 300 : 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cuteProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: cuteProducts[index]);
                    },
                  ),
                ),
                SizedBox(height: isLandscape ? 30 : 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Journals", style: TextStyle(color: Color(0xFF7dadc4), fontSize: 21, fontFamily: 'MontserratMedium')),
                ),
                SizedBox(
                  height: isLandscape ? 300 : 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: journalProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: journalProducts[index]);
                    },
                  ),
                ),
                SizedBox(height: isLandscape ? 30 : 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Eastern Beauty", style: TextStyle(color: Color(0xFF7dadc4), fontSize: 21, fontFamily: 'MontserratMedium')),
                ),
                SizedBox(
                  height: isLandscape ? 300 : 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: easternProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: easternProducts[index]);
                    },
                  ),
                ),
                SizedBox(height: isLandscape ? 30 : 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Other", style: TextStyle(color: Color(0xFF7dadc4), fontSize: 21, fontFamily: 'MontserratMedium')),
                ),
                SizedBox(
                  height: isLandscape ? 300 : 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: otherProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: otherProducts[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        }
      ),

      bottomNavigationBar: Bottombar(),
    ),
  );
  }}