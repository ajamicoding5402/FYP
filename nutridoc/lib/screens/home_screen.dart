import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './switcher_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text('Hello there, Mr logged in user!'),
          ElevatedButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed(SwitcherScreen.routeName);
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Sign out'),
          )
        ],
      ),
    );
  }
}
