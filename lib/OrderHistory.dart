// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'HomePage.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Header(
                onHomePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(name: '', email: '')),
                  );
                },
              ),
              OrderTab(
                initialTabIndex: 0,
                onTabChanged: (index) {
                  print('Tab changed to index: $index');
                },
              ),
              Expanded(
                child: ListView(
                  children: [
                    OrderItem(
                      image: 'Media/images/Watch.png',
                      name: 'Watch',
                      brand: 'Rolex',
                      price: 40,
                      onTrackOrder: () {
                        print('Track order for Watch');
                      },
                    ),
                    OrderItem(
                      image: 'Media/images/Airpods.png', 
                      name: 'Airpods',
                      brand: 'Apple',
                      price: 333,
                      onTrackOrder: () {
                        print('Track order for Airpods');
                      },
                    ),
                    OrderItem(
                      image: 'Media/images/Hoodie.png', 
                      name: 'Hoodie',
                      brand: 'Puma',
                      price: 50,
                      onTrackOrder: () {
                        print('Track order for Hoodie');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String image;
  final String name;
  final String brand;
  final double price;
  final VoidCallback onTrackOrder;

  const OrderItem({
    super.key,
    required this.image,
    required this.name,
    required this.brand,
    required this.price,
    required this.onTrackOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Make the container take full width
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 6, top: 6),
            width: 126,
            height: 99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    brand,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9B9999),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6055D8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 66, right: 8),
            child: TextButton(
              onPressed: onTrackOrder,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF6055D8),
                minimumSize: const Size(93, 36),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Track Order',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderTab extends StatefulWidget {
  final int initialTabIndex;
  final Function(int)? onTabChanged;

  const OrderTab({
    Key? key,
    this.initialTabIndex = 0,
    this.onTabChanged,
  }) : super(key: key);

  @override
  _OrderTabState createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Active', 'Completed', 'Cancel'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (widget.onTabChanged != null) {
      widget.onTabChanged!(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        tabs: _tabs.map((String tab) {
          return Tab(
            child: Text(
              tab,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _tabController.index == _tabs.indexOf(tab)
                    ? Colors.black
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
        indicatorColor: Colors.black,
        indicatorWeight: 2,
        labelPadding: const EdgeInsets.symmetric(horizontal: 24),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onHomePressed;

  const Header({
    super.key,
    this.title = 'Orders',
    this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: onHomePressed,
          ),
          const SizedBox(width: 48), // Placeholder to balance the row
        ],
      ),
    );
  }
}