import 'package:flutter/material.dart';
import 'package:ecommerce/HomePage.dart';

class ActionBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ActionBar({Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  _ActionBarState createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Icon(Icons.home, size: 28),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Icon(Icons.search, size: 28),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Icon(Icons.shopping_bag, size: 28),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Icon(Icons.person, size: 28),
          ),
          label: '',
        ),
      ],
      selectedItemColor: const Color(0xFF6055D8),
      unselectedItemColor: Colors.grey,
    );
  }
}
