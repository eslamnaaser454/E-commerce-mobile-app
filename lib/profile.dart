import 'package:ecommerce/settings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
                    backgroundImage: NetworkImage('https://dashboard.codeparrot.ai/api/assets/Z22vgo6CYQNjI8uT'),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Text(
                    "TruYou",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01),
                  Text(
                    "truyou.team@gmail.com",
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
                        MaterialPageRoute(builder: (context) => SettingsScreen()),
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
                    icon: Icons.share,
                    title: 'Share App',
                    onTap: () {},
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildMenuItem(
                    icon: Icons.help,
                    title: 'Help',
                    onTap: () {},
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
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
    );
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
                const Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

