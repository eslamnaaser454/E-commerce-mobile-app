// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:ecommerce/products/favorite.dart';
import 'package:ecommerce/products/productlists.dart';
import 'package:ecommerce/search.dart';
import 'package:ecommerce/settings.dart';
import 'package:ecommerce/signup-login/login.dart';
import 'package:flutter/material.dart';
import 'actionbar.dart';
import 'HomePage.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  String email;

  ProfileScreen({super.key, required this.name, required this.email});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;
  late String name;
  late String email;
  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(name: name, email: email)),
        );
        break;
      case 1:
           Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage()),
        );
        // Implement navigation for case 1 if needed
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductListPage(
                    name: name,
                    email: email,
                  )),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileScreen(name: name, email: email)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.05),
                  // Profile Image
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/Blank.png"),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01),
                  Text(
                    widget.email,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9B9999),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.04),
                  _buildMenuItem(
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {},
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildMenuItem(
                    icon: Icons.settings,
                    title: 'Setting',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()),
                      );
                    },
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildMenuItem(
                    icon: Icons.contact_mail,
                    title: 'Contact',
                    onTap: () {},
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildMenuItem(
                    icon: Icons.favorite,
                    title: 'favorite',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritePage(
                                favoriteProducts: favoriteProducts,
                                  name: name,
                                  email: email,
                                )),
                      );
                    },
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildMenuItem(
                    icon: Icons.help,
                    title: 'Help',
                    onTap: () {},
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF55F1F),
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.04),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: ActionBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildMenuItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Container(
    height: 48,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Color(0xFFF7F7F7),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 24, color: Colors.black),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xD9000000),
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios,
                  size: 24, color: Colors.black),
            ],
          ),
        ),
      ),
    ),
  );
}