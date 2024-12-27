import 'package:flutter/material.dart';
import 'actionbar.dart'; // Import the ActionBar

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('Media/images/profile image.jpg'),
                      radius: 24,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          'Omar Lashin',
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
                      onPressed: () {},
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
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search here',
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF6055D8),
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://dashboard.codeparrot.ai/api/assets/Z23HZg16ERs_8IDM'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Get Winter Discount\n20% Off\nFor Children',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
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
          ),
        ),
      ),
      bottomNavigationBar: const ActionBar(),
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
            image: 'Media/images/nike shoes.png',
          ),
          FeaturedProductCard(
            name: 'Casio watch',
            price: 333,
            image: 'Media/images/casio watch.png',
          ),
          FeaturedProductCard(
            name: 'Green sneakers',
            price: 40,
            image: 'Media/images/green sneakers.png',
          ),
          FeaturedProductCard(
            name: 'black t-shirt',
            price: 15,
            image: 'Media/images/black t-shirt.png',
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

class FeaturedProductCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            '\$$price',
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
            image: 'Media/images/blue classis shoes.png',
          ),
          PopularProductCard(
            name: 'pump jacket',
            price: 400,
            image: 'Media/images/blue pump jacket.png',
          ),
          PopularProductCard(
            name: 'Skyblue t-shirt',
            price: 330,
            image: 'Media/images/skyblue t-shirt.png',
          ),
          PopularProductCard(
            name: 'Black converse',
            price: 50,
            image: 'Media/images/black converse.png',
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

class PopularProductCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            '\$$price',
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
