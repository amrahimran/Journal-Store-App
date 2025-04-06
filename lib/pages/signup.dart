// ignore_for_file: avoid_print, use_build_context_synchronously, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project/pages/login.dart';
import 'package:quickalert/quickalert.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey=GlobalKey<FormState>();
  final TextEditingController _usernameCtrl=TextEditingController();
  final TextEditingController _emailCtrl=TextEditingController();
  final TextEditingController _passwordCtrl=TextEditingController();
  final TextEditingController _confirmPasswordCtrl=TextEditingController();

  void submitForm(){
    if(_formkey.currentState!.validate()){
      QuickAlert.show(
        context: context, 
        type: QuickAlertType.success,
        text:'Registration Successful',
        customAsset:'assets/images/login.webp' ,
        );

        Future.delayed(const Duration(seconds:1), (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
        
      ),
      body:Padding(padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      child:Form(
        key:_formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Title( color:Color(0xFF7dadc4), child: Text('Sign Up',style: TextStyle(color:Color(0xFF7dadc4),fontFamily:'Chewy' , fontSize: 45),)),
          SizedBox(height: 16,),
          TextFormField(
            controller: _usernameCtrl,
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: '',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
            validator:(value){
              if (value==null|| value.isEmpty){
                return 'Username is required';
              }
              return null;
            },
            
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailCtrl,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: '',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
            validator: (value){
              if (value==null||value.isEmpty){
                return 'Email is required';
              }
              final emailregex=RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
              if(!emailregex.hasMatch(value)){
                return 'Enter a valid email address.';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: '',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
            validator: (value){
              if(value==null||value.isEmpty){
                return 'Password is required';
              }
              if(value.length<8){
                return 'Password must be at least 8 characters long.';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordCtrl,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              hintText: '',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
            validator: (value){
              if(value==null||value.isEmpty){
                return 'This field is required';
              }
              if(value!=_passwordCtrl.text){
                return "Passwords don't match";
              }
              return null;
            },
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: submitForm, 
            style:ElevatedButton.styleFrom(
              backgroundColor:Color(0xFF7dadc4),
              padding:EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))
            ) ,
          child: Container(
            width: 250,
            alignment: Alignment.center,
            child: Text('Register',style: TextStyle(color:Colors.white, fontSize: 18, fontFamily: 'MontserratRegular'))))
        ]
      ),
      )
      )
    );
  }
}