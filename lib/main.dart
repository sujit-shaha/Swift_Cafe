import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_cafe/screens/HomePage.dart';
import 'package:swift_cafe/screens/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Check login status
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool('isLoggedIn');

  runApp(MyApp(isLoggedIn: isLoggedIn ?? false));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoggedIn ? HomePage() : LoginPage(),
    );
  }
}
