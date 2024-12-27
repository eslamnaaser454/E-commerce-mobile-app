/* lib/settings.dart */
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Pop the current screen to go back
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            AccountSection(
              onNotificationsPressed: () {},
              onLanguagePressed: () {},
              onPrivacyPressed: () {},
              onHelpCenterPressed: () {},
              onAboutUsPressed: () {},
              onBackPressed: () {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Setting',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            SettingsButton(
              title: 'Notification',
              icon: Icons.notifications,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            SettingsButton(
              title: 'Language',
              icon: Icons.language,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            SettingsButton(
              title: 'Privacy',
              icon: Icons.privacy_tip,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            SettingsButton(
              title: 'Help Center',
              icon: Icons.help_center,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            SettingsButton(
              title: 'About us',
              icon: Icons.info,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}



class AccountSection extends StatelessWidget {
  final String name;
  final String email;
  final String profileImage;
  final VoidCallback onNotificationsPressed;
  final VoidCallback onLanguagePressed;
  final VoidCallback onPrivacyPressed;
  final VoidCallback onHelpCenterPressed;
  final VoidCallback onAboutUsPressed;
  final VoidCallback onBackPressed;

  const AccountSection({
    super.key,
    this.name = 'TruYou',
    this.email = 'truyou.team@gmail.com',
    this.profileImage = 'https://example.com/profile_image.png',
    required this.onNotificationsPressed,
    required this.onLanguagePressed,
    required this.onPrivacyPressed,
    required this.onHelpCenterPressed,
    required this.onAboutUsPressed,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(profileImage),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: onBackPressed,
          ),
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final bool showArrow;
  final EdgeInsets padding;

  const SettingsButton({super.key, 
    this.title = 'Language',
    required this.onPressed,
    required this.icon,
    this.showArrow = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: Colors.black54,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            if (showArrow)
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final double size;

  const BackButton({
    Key? key,
    this.onPressed,
    this.color = Colors.black,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: size,
          minHeight: size,
        ),
        icon: Icon(
          Icons.arrow_back,
          size: size,
          color: color,
        ),
        onPressed: onPressed ?? () => Navigator.of(context),
      ),
    );
  }
}
