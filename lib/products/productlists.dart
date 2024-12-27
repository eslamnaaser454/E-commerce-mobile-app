// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detailpage.dart';
import 'cartpage.dart'; // Import the cart page
import '../models/product.dart'; // Import the Product model from the correct file
import '../models/cart.dart'; // Import the Cart model

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListPage(name: '', email: ''),
    );
  }
}

List<Product> favoriteProducts = []; // Global list for favorite products
Map<String, bool> favoriteStatus = {}; // Global map to track favorite status

class ProductListPage extends StatelessWidget {
  final String name;
  final String email;

  // ignore: use_key_in_widget_constructors
  ProductListPage({required this.name, required this.email});

  final List<Product> products = [
    Product(name: 'Watch', price: 40, imageUrl: 'Media/images/watch1.jpg'),
    Product(name: 'Nike Shoes', price: 430, imageUrl: 'Media/images/nike.jpg'),
    Product(name: 'LG TV', price: 330, imageUrl: 'Media/images/TV.jpg'),
    Product(name: 'Airpods', price: 333, imageUrl: 'Media/images/earphones.jpg'),
    Product(name: 'Jacket', price: 50, imageUrl: 'Media/images/jacket.jpg'),
    Product(name: 'Hoodie', price: 400, imageUrl: 'Media/images/red-hoodie.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              onBackPressed: () => Navigator.of(context).pop(),
              onCartPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = favoriteStatus[widget.product.name] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(product: widget.product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                    child: Image.asset(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          favoriteStatus[widget.product.name] = isFavorite;
                          if (isFavorite) {
                            if (!favoriteProducts.contains(widget.product)) {
                              favoriteProducts.add(widget.product);
                            }
                          } else {
                            favoriteProducts.removeWhere((product) => product.name == widget.product.name);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${widget.product.price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(96, 85, 216, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    final cart = Provider.of<Cart>(context, listen: false);
                    cart.addItem(widget.product);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(96, 85, 216, 1),
                    padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Poppins',
                      fontSize: 12, // Smaller font size
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCartPressed;

  const Header({
    Key? key,
    this.title = 'Products',
    this.onBackPressed,
    this.onCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: onCartPressed,
            ),
          ),
        ],
      ),
    );
  }
}