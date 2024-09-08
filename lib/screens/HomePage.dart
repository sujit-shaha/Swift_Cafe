import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:swift_cafe/Widgets/HomePageWidgets.dart';
import 'package:swift_cafe/auth_service.dart';
import 'package:swift_cafe/screens/LoginScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _username;
  File? _profileImage;
  String _currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Function to load profile image and username from SharedPreferences
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    final username = prefs.getString('username') ?? 'Guest';

    setState(() {
      _username = username;
      if (imagePath != null) {
        _profileImage = File(imagePath);
      }
    });
  }

  // Function to handle logout
  Future<void> _logout() async {
    AuthService().signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
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
                      Text(
                        '👋 $_currentDate',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Row(
                        children: [
                          Text(
                            _username ?? 'Guest',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.logout, color: Colors.red),
                                          title: Text('Logout'),
                                          onTap: () {
                                            Navigator.pop(context); // Close the bottom sheet
                                            _logout();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: _profileImage != null
                                  ? FileImage(_profileImage!)
                                  : AssetImage('assets/avatar_placeholder.png') as ImageProvider,
                            ),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: screenHeight * 0.22,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        beverageCard(context, 'Espresso', 'assets/middle.png', '4.9', '4580'),
                        SizedBox(width: 10),
                        beverageCard(context, 'Hot Cappuccino', 'assets/middle.png', '4.9', '4580'),
                        SizedBox(width: 10),
                        beverageCard(context, 'Hot Chocolate', 'assets/middle.png', '4.9', '4580'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Get it instantly',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        beverageCardVertical(
                          context,
                          'Lattè',
                          'assets/Latte.png',
                          '4.9',
                          '1,234',
                          'Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.',
                        ),
                        SizedBox(height: 10),
                        beverageCardVertical(
                          context,
                          'Flat White',
                          'assets/flat_white.png',
                          '4.7',
                          '998',
                          'Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.',
                        ),
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
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.white70), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.white70), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white70), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz, color: Colors.white70), label: ''),
          ],
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    );
  }
}
