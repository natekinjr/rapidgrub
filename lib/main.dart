import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_grub/models/food.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/food_screen.dart';
import 'screens/food_menu_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/login_screen.dart'; // Import LoginScreen
import 'screens/register_screen.dart'; // Import RegisterScreen
import 'providers/theme_provider.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Simulate an authentication check
    bool isLoggedIn = false; // Update this based on your authentication logic

    return MaterialApp(
      title: 'RapidGrub',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // ignore: dead_code
      initialRoute: isLoggedIn ? '/home' : '/login',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/food': (context) {
          final food = ModalRoute.of(context)!.settings.arguments as Food;
          return FoodScreen(food: food);
        },
        '/food-menu': (context) => const FoodMenuScreen(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
