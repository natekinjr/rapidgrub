import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_grub/models/food.dart';
import '../providers/cart_provider.dart';
// ignore: unused_import
import '../utils/formatting.dart'; // Import the formatting file

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                final cartItem = cart.items.values.toList()[index];
                return ListTile(
                  leading: Image.asset(cartItem.imageUrl),
                  title: Text(cartItem.name),
                  subtitle: Text('KSh ${cartItem.price} x ${cartItem.quantity}'),
                  trailing: SizedBox(
                    width: 160, // Adjust the width if needed
                    child: Wrap(
                      spacing: 8.0, // Spacing between buttons
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            cart.removeSingleItem(cartItem.id);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            cart.addItem(
                              Food(
                                id: cartItem.id,
                                name: cartItem.name,
                                description: '',
                                imageUrl: cartItem.imageUrl,
                                price: cartItem.price,
                                category: '',
                              ),
                              1,
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeItem(cartItem.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'KSh ${cart.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            child: const Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}
