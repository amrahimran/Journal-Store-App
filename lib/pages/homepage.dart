// ignore_for_file: unused_import, sized_box_for_whitespace, avoid_print, unused_label, dead_code

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/components/bottombar.dart';
import 'package:project/components/custombar.dart';

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
    return 
    SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomBar(),
        bottomNavigationBar: Bottombar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              child: PageView.builder(
                controller: _pageController,
                itemCount: heroslides.length,
                onPageChanged: (index) {
                  currentpage = index;
                },
                itemBuilder: (context,index)
                {
                  return Padding(padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                  child: ClipRRect(
                    child: Image.asset(heroslides[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    ),
                  ),
                  
                  );
                }
                ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: Text("Vintage Collection",style: TextStyle(color: Color(0xFF7dadc4),fontSize: 21,fontFamily: 'MontserratMedium' ),),
            )

          ],
        ),
      
          
        ),
    );
     

    //);
  }
}