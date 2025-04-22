// ignore_for_file: avoid_print, prefer_final_fields, unused_element, unused_import, non_constant_identifier_names, use_build_context_synchronously, avoid_unnecessary_containers, sized_box_for_whitespace, annotate_overrides

import 'package:flutter/material.dart';
import 'package:project/pages/homepage.dart';
import 'package:project/pages/signup.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    bool isLoggedIn = false;
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _usernameController=TextEditingController();
    final TextEditingController 
    _passwordController=TextEditingController();

      // Function to check if the user is already logged in
    Future<void> _checkLoginStatus() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool loggedIn = prefs.getBool('isLoggedIn') ?? false; // Get login state
      if (loggedIn) {
        // If the user is logged in, navigate directly to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    }

    @override
    void initState(){
      super.initState();
      _checkLoginStatus();
    }

    // Function to save login state in SharedPreferences
    Future<void> _saveLoginState() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true); // Save login state as true
    }

    void _submit() {
  FocusScope.of(context).unfocus(); // Dismiss keyboard
  final BuildContext localContext = context;
  final String usernameSubmit = _usernameController.text.trim();
  final String passwordSubmit = _passwordController.text.trim();

  if (_formKey.currentState?.validate() ?? false) {
    if (usernameSubmit == "amrah" && passwordSubmit == "amrah123") {
      QuickAlert.show(
          context: context,
          text: 'Login Successful!',
          type: QuickAlertType.success,
          customAsset:'assets/images/login.webp'
        );
      Future.delayed(const Duration(seconds: 2),(){
        _saveLoginState(); // Save login state when login is successful
          //Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      
      
       });
       }else {
      QuickAlert.show(
        context: localContext,
        text: 'Incorrect credentials. Please try again.',
        type: QuickAlertType.error,
        customAsset: 'assets/images/failed.webp',
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Title(color:Color(0xFF7dadc4), child: Text('Login',style: TextStyle(color:Color(0xFF7dadc4),fontFamily:'Chewy' , fontSize: 45),)),
            SizedBox(height: 16,),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: '',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },  
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: '',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
              ),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
        },
            ),
            SizedBox(height: 50),
            ElevatedButton(
            onPressed: _submit, 
            style:ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7dadc4),
              padding:EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))
            ) ,
              child: Container(
                width: 250,
                alignment: Alignment.center,
                child: Text('Login',style: TextStyle(color:Colors.white,fontSize: 18, fontFamily: 'MontserratRegular')))),
              SizedBox(height: 20.0),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()));
              },
              child:
              Text("Don't have an account yet? Click here to sign up.", style: TextStyle(color:Color(0xFF7dadc4), fontSize: 16),textAlign: TextAlign.center)
            )
          ]
        ),
      ),
      )
    );
  }
}