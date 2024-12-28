import 'package:ecommerce/models/OrderHistoryStorage.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    super.dispose();
  }
  void _confirmOrder() {
    if (_formKey.currentState!.validate()) {
      final cart = Provider.of<Cart>(context, listen: false);
      if (cart.items.isNotEmpty) {
        print('Navigating to OrderConfirmationScreen with items: ${cart.items.keys.toList()}');

        try {
          // Add items to order history before clearing the cart
          print('Cart stored');
          OrderHistoryStorage.addOrder(cart.items.keys.toList());

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderConfirmationScreen(cartItems: cart.items.keys.toList()),
            ),
          );
        } finally {
          // Clear the cart regardless of the navigation outcome
          cart.clear();
          print('Cart cleared');
        }
      } else {
        print('Cart is empty');
      }
    } else {
      print('Form validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context); 
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    hintText: 'Contact Information',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact information';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: cart.items.isNotEmpty ? _confirmOrder : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6055D8),
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(
                    color: Colors.white,
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