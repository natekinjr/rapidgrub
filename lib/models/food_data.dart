import 'food.dart';

final List<Food> foodItems = [
  // Burgers
  Food(
    id: '1',
    name: 'Classic Burger',
    description: 'Juicy beef burger with lettuce, tomato, and cheese.',
    imageUrl: 'assets/images/ClassicBurger.jpg',
    price: 750.00,
    category: 'Burgers',
  ),
  Food(
    id: '2',
    name: 'Chicken Burger',
    description: 'Grilled chicken breast with mayo and lettuce.',
    imageUrl: 'assets/images/spicy-chicken-burgers.webp',
    price: 790.00,
    category: 'Burgers',
  ),
  
  // Pizza
  Food(
    id: '3',
    name: 'Margherita Pizza',
    description: 'Classic Margherita pizza with tomatoes, mozzarella, and basil.',
    imageUrl: 'assets/images/margherita-pizza.jpg',
    price: 1550.00,
    category: 'Pizza',
  ),
  Food(
    id: '4',
    name: 'Pepperoni Pizza',
    description: 'Pepperoni pizza with mozzarella and tomato sauce.',
    imageUrl: 'assets/images/Pepperonipizza.jpg',
    price: 1400.00,
    category: 'Pizza',
  ),

  // Sushi
  Food(
    id: '5',
    name: 'Salmon Sushi',
    description: 'Fresh salmon on a bed of sushi rice.',
    imageUrl: 'assets/images/salmon-roll-tuna.jpg',
    price: 1500.00,
    category: 'Sushi',
  ),
  Food(
    id: '6',
    name: 'Tuna Sushi',
    description: 'Delicious tuna sushi with soy sauce and wasabi.',
    imageUrl: 'assets/images/Spicy-tuna-and-salmon-rolls_.jpg',
    price: 1450.00,
    category: 'Sushi',
  ),

  // Drinks
  Food(
    id: '7',
    name: 'Cola',
    description: 'Chilled cola beverage.',
    imageUrl: 'assets/images/WhatsApp Image 2024-08-15 (8).jpg',
    price: 150.00,
    category: 'Drinks',
  ),
  Food(
    id: '8',
    name: 'Orange Juice',
    description: 'Freshly squeezed orange juice.',
    imageUrl: 'assets/images/WhatsApp Image 2024-08-15 (7).jpg',
    price: 350.00,
    category: 'Drinks',
  ),

  // Desserts
  Food(
    id: '9',
    name: 'Chocolate Cake',
    description: 'Rich chocolate cake with layers of fudge.',
    imageUrl: 'assets/images/WhatsApp Image 2024-08-15 (6).jpg',
    price: 2000.00,
    category: 'Desserts',
  ),
  Food(
    id: '10',
    name: 'Ice Cream Sundae',
    description: 'Vanilla ice cream topped with chocolate sauce and nuts.',
    imageUrl: 'assets/images/Ice-cream-sundae.jpg',
    price: 650.00,
    category: 'Desserts',
  ),
];
