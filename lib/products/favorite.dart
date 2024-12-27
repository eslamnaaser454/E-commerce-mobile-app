import 'package:flutter/material.dart';
import 'productlists.dart'; // Import the Product class

class FavoritePage extends StatelessWidget {
  final String name;
  final String email;
  final List<Product> favoriteProducts;

  FavoritePage({
    required this.favoriteProducts,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Image.asset(product.imageUrl, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
            ),
          );
        },
      ),
    );
  }
}