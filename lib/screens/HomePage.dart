import 'package:flutter/material.dart';
import 'package:swift_cafe/Widgets/HomePageWidgets.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              // Make sure to replace with your actual background image path
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('👋 20/12/2022',
                          style: TextStyle(color: Colors.white70)),
                      Row(
                        children: [
                          Text('Joshua Scanlan', style: TextStyle(color: Colors
                              .white)),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),

                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search favorite Beverages",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Most Popular Beverages',
                    style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: screenHeight * 0.22,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        beverageCard(
                            context, 'Espresso', 'assets/middle.png', '4.9',
                            '4580'),
                        SizedBox(width: 10),
                        beverageCard(
                            context, 'Hot Cappuccino', 'assets/middle.png',
                            '4.9', '4580'),
                        SizedBox(width: 10),
                        beverageCard(
                            context, 'Hot Chocolate', 'assets/middle.png',
                            '4.9', '4580'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Get it instantly',
                    style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        beverageCardVertical(
                            context, 'Lattè', 'assets/Latte.png', '4.9',
                            '1,234',
                            'Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.'),
                        SizedBox(height: 10),
                        beverageCardVertical(
                            context, 'Flat White', 'assets/flat_white.png',
                            '4.7', '998',
                            'Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(0.3),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white70), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.white70), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white70), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz, color: Colors.white70), label: ''),
          ],
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    );
  }

}