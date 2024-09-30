import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rapid_grub/models/food.dart';
import 'package:rapid_grub/screens/delivery_progress_screen.dart';
import 'package:rapid_grub/screens/receipt_screen.dart';
import 'package:rapid_grub/screens/auth_gate.dart'; // Import the AuthGate
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/food_screen.dart';
import 'screens/food_menu_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/payment_screen.dart';
import 'providers/theme_provider.dart';
import 'providers/cart_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase options for web platform
  const firebaseOptions = FirebaseOptions(
    apiKey: "AIzaSyBafZ_-Nm2mfuXC-inryc37BixRHB5vvIs",
    authDomain: "rapidgrub-264ff.firebaseapp.com",
    projectId: "rapidgrub-264ff",
    storageBucket: "rapidgrub-264ff.appspot.com",
    messagingSenderId: "949928456948",
    appId: "1:949928456948:web:f03fb3b3a9398daad124a1",
    measurementId: "G-RDTMFE0GQK",
  );

  try {
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
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
  } catch (e) {
    // ignore: avoid_print
    print('Firebase initialization error: $e');  // Debugging output
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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
      home: const AuthGate(), // Use AuthGate as the home screen
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
        '/payment': (context) => const PaymentScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/delivery-progress') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return DeliveryProgressScreen(
                orderId: args['orderId'],
                driverName: args['driverName'],
                driverPhone: args['driverPhone'],
                estimatedDeliveryTime: args['estimatedDeliveryTime'],
                orderedItems: args['orderedItems'],
              );
            },
          );
        } else if (settings.name == '/receipt') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return ReceiptScreen(
                orderId: args['orderId'],
                orderedItems: args['orderedItems'],
                estimatedDeliveryTime: args['estimatedDeliveryTime'],
                driverName: args['driverName'],
                driverPhone: args['driverPhone'],
              );
            },
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
