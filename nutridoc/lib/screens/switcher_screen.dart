import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login_screen.dart';
import './home_screen.dart';

class SwitcherScreen extends StatelessWidget {
  static const String routeName = '/';
  SwitcherScreen({super.key});

  final bool isLoggedIn = FirebaseAuth.instance.currentUser != null;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const HomeScreen() : LoginScreen();
  }
}
