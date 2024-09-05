import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

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
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/logo"),
                  SizedBox(height: 5,),
                  Text("Swift Café",style: TextStyle(
                    fontFamily:
                  ),)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
