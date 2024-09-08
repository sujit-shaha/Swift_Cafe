import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_cafe/auth_service.dart';
import 'package:swift_cafe/screens/HomePage.dart';
import 'package:swift_cafe/screens/LoginScreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static final TextEditingController _userTextController = TextEditingController();
  static final TextEditingController _passwordTextController = TextEditingController();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery or camera
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      _storeImagePath(pickedFile.path); // Save path to SharedPreferences
    }
  }

  Future<void> _storeImagePath(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', imagePath);
  }

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
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : AssetImage("assets/avatar_placeholder.png") as ImageProvider,
                      child: _profileImage == null
                          ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Swift Café",
                    style: GoogleFonts.raleway(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    "Create your account",
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                      decoration: TextDecoration.none,
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
                        // Call the signUp method
                        await AuthService().signUpWithUsername(
                          _userTextController.text,
                          _passwordTextController.text,
                        );
                        // Navigate to the HomePage on successful sign up
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginPage()));
                      } catch (e) {
                        showErrorDialog(context, e.toString());
                      }
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
