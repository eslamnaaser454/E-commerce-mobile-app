import 'package:flutter/material.dart';
import 'package:ecommerce/HomePage.dart'; // Import the home screen

class OrderConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        title: const Text(
          'Order Confirmation',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: const Color(0xFF6055D8), // Set app bar color
      ),
      body: Center( // Use Center widget to align everything centrally
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Color(0xFF6055D8), // Set icon color
                size: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Order Placed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6055D8), // Set text color
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center, // Align text center
              ),
              const SizedBox(height: 20),
              const Text(
                'Your order has been placed successfully.\nIt will arrive in 2-3 days.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center, // Align text center
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => HomePage(name: '', email: '',),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6055D8), // Set background color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white, // Set text color
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
