import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/screens/checkout_screen.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        final total = cart.totalPrice.toInt();
        final itemCount = cart.items.length;
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    final product = cart.items.keys.elementAt(index);
                    final quantity = cart.items[product];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(product.imageUrl, width: 80, height: 80),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '\$${product.price}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    cart.removeItem(product);
                                  },
                                ),
                                Text(
                                  '$quantity',
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    cart.addItem(product);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    cart.removeItem(product);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Items'),
                        Text('$itemCount'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal'),
                        Text('\$${total}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Charges'),
                        Text('\$2'), // Example delivery charge
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${total +2}', // Adjusted total
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CheckoutScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6055D8),
                        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Check Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}