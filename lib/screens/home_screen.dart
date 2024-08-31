// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
// Import the CartScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Nathan Kinuthia'),
              accountEmail: Text('natekinjr@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/WhatsApp Image 2024-08-16.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/WhatsApp Image 2024-08-14.jpg',
                fit: BoxFit.cover,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');  // Navigate to CartScreen
                },
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildFeatureCard('Menu', Icons.restaurant_menu, context),
                  const SizedBox(height: 16),
                  const Text(
                    'Popular Categories',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      _buildCategoryCard(
                          'assets/images/WhatsApp Image 2024-08-15.jpg',
                          'Burgers'),
                      _buildCategoryCard(
                          'assets/images/WhatsApp Image 2024-08-15 (2).jpg',
                          'Pizza'),
                      _buildCategoryCard(
                          'assets/images/WhatsApp Image 2024-08-15 (3).jpg',
                          'Sushi'),
                      _buildCategoryCard(
                          'assets/images/WhatsApp Image 2024-08-15 (5).jpg',
                          'Drinks'),
                      _buildCategoryCard(
                          'assets/images/WhatsApp Image 2024-08-15 (4).jpg',
                          'Desserts'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      String title, IconData icon, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        onTap: () {
          if (title == 'Menu') {
            Navigator.pushNamed(context, '/food-menu');  // Navigate to FoodMenuScreen
          }
          // Handle other feature cards if needed
        },
      ),
    );
  }

  Widget _buildCategoryCard(String imagePath, String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
