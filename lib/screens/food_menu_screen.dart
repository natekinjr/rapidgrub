import 'package:flutter/material.dart';
import 'package:rapid_grub/models/food_data.dart';
import '../models/food.dart';
import '../utils/formatting.dart'; // Import the formatting file

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final Food foodItem = foodItems[index];
          return ListTile(
            leading: Image.asset(
              foodItem.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(foodItem.name),
            subtitle: Text(foodItem.description),
            trailing: Text(formatCurrency(foodItem.price)), // Use formatCurrency here
            onTap: () {
              Navigator.pushNamed(
                context,
                '/food',
                arguments: foodItem,
              );
            },
          );
        },
      ),
    );
  }
}
