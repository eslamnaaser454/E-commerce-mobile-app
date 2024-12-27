import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Icon(Icons.home, size: 28),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 28),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag, size: 28),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 28),
          label: '',
        ),
      ],
      selectedItemColor: const Color(0xFF6055D8),
      unselectedItemColor: Colors.grey,
    );
  }
}
