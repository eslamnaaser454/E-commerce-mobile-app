import 'package:ecommerce/products/productlists.dart';
import 'package:flutter/material.dart';
import 'actionbar.dart'; // Import the ActionBar
import 'profile.dart'; // Import the ProfileScreen
import 'settings.dart'; // Import the SettingsScreen

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class HomePage extends StatefulWidget {
  final String name;
  final String email;

  HomePage({super.key, required this.name, required this.email});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name;
  late String email;
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();
  List<Product> _allProducts = [
    Product(
        name: 'Barce watch', price: 40, image: 'Media/images/barce watch.png'),
    Product(name: 'Nike Shoes', price: 430, image: 'images/nikeshoes.png'),
    Product(
        name: 'Casio watch', price: 333, image: 'Media/images/casio watch.png'),
    Product(
        name: 'Green sneakers',
        price: 40,
        image: 'Media/images/green sneakers.png'),
    Product(
        name: 'black t-shirt',
        price: 15,
        image: 'Media/images/black t-shirt.png'),
    Product(
        name: 'iphone watch',
        price: 333,
        image: 'Media/images/iphone watch.png'),
    Product(
        name: 'Classic shoes',
        price: 70,
        image: 'Media/images/blue classis shoes.png'),
    Product(
        name: 'pump jacket',
        price: 400,
        image: 'Media/images/blue pump jacket.png'),
    Product(
        name: 'Skyblue t-shirt',
        price: 330,
        image: 'Media/images/skyblue t-shirt.png'),
    Product(
        name: 'Black converse',
        price: 50,
        image: 'Media/images/black converse.png'),
    Product(
        name: 'leather jacket',
        price: 400,
        image: 'Media/images/brown leather jacket.png'),
  ];
  List<Product> _filteredProducts = [];
  Product? _selectedProduct;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    _filteredProducts = _allProducts;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(name: name, email: email)),
        );
        break;
      case 1:
        // Implement navigation for case 1 if needed
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductListPage(
                    name: name,
                    email: email,
                  )),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileScreen(name: name, email: email)),
        );
        break;
    }
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = _allProducts;
      } else {
        _filteredProducts = _allProducts
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _selectProduct(Product product) {
    setState(() {
      _selectedProduct = product;
      _searchController.clear();
      _filteredProducts = _allProducts;
    });
  }

  void _backToHome() {
    setState(() {
      _selectedProduct = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(name: name, email: email)),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('Media/images/profile image.jpg'),
                        radius: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterProducts,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search here',
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              if (_searchController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredProducts[index].name),
                          onTap: () {
                            _selectProduct(_filteredProducts[index]);
                          },
                        );
                      },
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              if (_selectedProduct == null)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6055D8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          // Add the image with padding
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0), // Padding for the image
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'Media/images/children.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Add your text
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Get Winter Discount\n20% Off\nFor Children',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6055D8),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const FeaturedSection(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Most Popular',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6055D8),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const MostPopularSection(),
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search Result',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (_selectedProduct != null)
                        FeaturedProductCard(
                          name: _selectedProduct!.name,
                          price: _selectedProduct!.price,
                          image: _selectedProduct!.image,
                        ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _backToHome,
                        child: Text('Back to Home'),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ActionBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FeaturedProductCard(
            name: 'Barce watch',
            price: 40,
            image: 'Media/images/barce watch.png',
          ),
          FeaturedProductCard(
            name: 'Nike Shoes',
            price: 430,
            //insert nike shoes.png
            image: 'images/nikeshoes.png',
          ),
          FeaturedProductCard(
            name: 'Casio watch',
            price: 333,
            image: 'Media/images/casio watch.png',
          ),
          FeaturedProductCard(
            name: 'Green sneakers',
            price: 40,
            image: 'Media/images/Green sneakers.jpeg',
          ),
          FeaturedProductCard(
            name: 'black t-shirt',
            price: 15,
            image: 'Media/images/black tshirt.jpg',
          ),
          FeaturedProductCard(
            name: 'iphone watch',
            price: 333,
            image: 'Media/images/iphone watch.png',
          ),
        ],
      ),
    );
  }
}

class FeaturedProductCard extends StatefulWidget {
  final String name;
  final double price;
  final String image;

  const FeaturedProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  _FeaturedProductCardState createState() => _FeaturedProductCardState();
}

class _FeaturedProductCardState extends State<FeaturedProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
          Text(
            '\$${widget.price}',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6055D8),
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          PopularProductCard(
            name: 'Barce watch',
            price: 40,
            image: 'Media/images/barce watch.png',
          ),
          PopularProductCard(
            name: 'Classic shoes',
            price: 70,
            image: 'Media/images/blue classic shoes.jpg',
          ),
          PopularProductCard(
            name: 'pump jacket',
            price: 400,
            image: 'Media/images/pump jacket.jpg',
          ),
          PopularProductCard(
            name: 'Skyblue t-shirt',
            price: 330,
            image: 'Media/images/skyblue t-shirt.png',
          ),
          PopularProductCard(
            name: 'Black converse',
            price: 50,
            image: 'Media/images/black conversee.jpeg',
          ),
          PopularProductCard(
            name: 'leather jacket',
            price: 400,
            image: 'Media/images/brown leather jacket.png',
          ),
        ],
      ),
    );
  }
}

class PopularProductCard extends StatefulWidget {
  final String name;
  final double price;
  final String image;

  const PopularProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  _PopularProductCardState createState() => _PopularProductCardState();
}

class _PopularProductCardState extends State<PopularProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
          Text(
            '\$${widget.price}',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6055D8),
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
