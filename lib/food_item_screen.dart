import 'package:flutter/material.dart';

class FoodItemScreen extends StatelessWidget {
  final String foodName;
  final String imageUrl;
  final double price;
  
  const FoodItemScreen({super.key, required this.foodName, required this.imageUrl, required this.price});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
      body: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text('$foodName - \$$price'),
          // Add more widgets for description, ingredients, etc.
        ],
      ),
    );
  }
}
