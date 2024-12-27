
// ignore_for_file: camel_case_types

import 'package:ecommerce/splash_screen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure Firebase is only initialized once
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD-TjE_oNwx26zhF5yBqMIZ0It9cIcQ4p4',
        appId: '1:847075322554:ios:1f89c7090782f95d31b083',
        messagingSenderId: '847075322554',
        projectId: 'e-commerce-79990',
        storageBucket: 'e-commerce-79990.firebasestorage.app',
        iosBundleId: 'com.example.ecommerce',
      ),
    );
  } catch (e) {
    print("Firebase is already initialized");
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: ecommerce(),
    ),
  );
}

class ecommerce extends StatelessWidget {
  const ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Use SplashScreen here
        // '/signup': (context) => SignUpPage(),
      },
    );
  }
}
