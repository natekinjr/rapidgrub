import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rapid_grub/screens/home_screen.dart';
import 'package:rapid_grub/screens/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while checking auth status
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors if necessary
          return const Center(child: Text('Something went wrong'));
        } else if (snapshot.hasData) {
          // If the user is logged in, show the home screen
          return const HomeScreen();
        } else {
          // If the user is not logged in, show the login screen
          return const LoginScreen();
        }
      },
    );
  }
}
