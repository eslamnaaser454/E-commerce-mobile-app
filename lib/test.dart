// import 'package:ecommerce/products/detailpage.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductListPage(),
//     );
//   }
// }

// class Product {
//   final String name;
//   final int price;
//   final String imageUrl;

//   const Product({
//     required this.name,
//     required this.price,
//     required this.imageUrl,
//   });
// }

// List<Product> cartItems = []; // Global cart list

// class ProductListPage extends StatelessWidget {
//   final List<Product> products = [
//     const Product(
//         name: 'Watch', price: 40, imageUrl: 'Media/images/watch1.jpg'),
//     const Product(
//         name: 'Nike Shoes', price: 430, imageUrl: 'Media/images/nike.jpg'),
//     const Product(name: 'LG TV', price: 330, imageUrl: 'Media/images/TV.jpg'),
//     const Product(
//         name: 'Airpods', price: 333, imageUrl: 'Media/images/earphones.jpg'),
//     const Product(
//         name: 'Jacket', price: 50, imageUrl: 'Media/images/jacket.jpg'),
//     const Product(
//         name: 'Hoodie', price: 400, imageUrl: 'Media/images/red-hoodie.jpg'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Products',
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(96, 85, 216, 1),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Navigate to the cart page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CartPage(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: GridView.builder(
//           padding: const EdgeInsets.all(8.0),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.75,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//           ),
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             return ProductCard(product: products[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: InkWell(
//         onTap: () {
//           // Navigate to the DetailPage for the selected product
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailPage(product: product),
//             ),
//           );
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(10.0)),
//                 child: Image.asset(
//                   product.imageUrl,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 product.name,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(
//                 '\$${product.price}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Poppins',
//                   color: Color.fromRGBO(96, 85, 216, 1),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     double totalPrice = cartItems.fold(
//         0, (sum, product) => sum + product.price); // Calculate total price

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Cart',
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(96, 85, 216, 1),
//       ),
//       body: ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           final product = cartItems[index];
//           return ListTile(
//             leading: Image.asset(product.imageUrl, width: 50, height: 50),
//             title: Text(product.name),
//             subtitle: Text('\$${product.price}'),
//             trailing: IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () {
//                 setState(() {
//                   cartItems.removeAt(index);
//                 });
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16.0),
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Total:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               '\$${totalPrice.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromRGBO(96, 85, 216, 1),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
