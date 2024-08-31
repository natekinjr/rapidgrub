// lib/models/cart_item.dart
import 'food.dart';

class CartItem {
  final Food food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});
}
