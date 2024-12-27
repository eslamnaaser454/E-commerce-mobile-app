import 'package:ecommerce/HomePage.dart';
import 'package:ecommerce/products/productlists.dart';
import 'package:ecommerce/profile.dart';
import 'package:ecommerce/settings.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ecommerce());
}

class ecommerce extends StatelessWidget {
  const ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
