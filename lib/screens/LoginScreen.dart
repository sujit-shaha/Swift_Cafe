import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_cafe/auth_service.dart';
import 'package:swift_cafe/screens/HomePage.dart';
import 'package:swift_cafe/screens/SignUpPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static final TextEditingController _userTextController = TextEditingController();
  static final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/background.png",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img.png",
                    height: 100,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Swift Café",
                    style: GoogleFonts.raleway(
                        fontSize: 32, // Adjust size according to your design
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.none
                    ),
                  ),
                  Text(
                    "Latte but never late",
                    style: GoogleFonts.raleway(
                        fontSize: 16, // Adjust size according to your design
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic, // Match the design
                        color: Colors.white70,
                        decoration: TextDecoration.none
                    ),
                  ),

                  SizedBox(height: 40),
                  TextField(
                    controller: _userTextController,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        // Call the signIn method
                        await AuthService().signInWithUsername(
                          _userTextController.text,
                          _passwordTextController.text,
                        );
                        // Navigate to the HomePage on successful login
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomePage()));
                      } catch (e) {
                        showErrorDialog(context, e.toString());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.brown.shade700, Colors.brown.shade300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => SignUpPage(),),);

                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      side: BorderSide(color: Colors.white),
                    ),
                    child: Text(
                      'Signup',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text('Privacy Policy', style: TextStyle(color: Colors.white70)),
                  ),

                  SizedBox(height: 30),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


}
