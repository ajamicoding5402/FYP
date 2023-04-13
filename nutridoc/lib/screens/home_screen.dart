import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './switcher_screen.dart';
import './gamification_screen.dart';
import '../widgets/section_card.dart';

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
          ElevatedButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed(SwitcherScreen.routeName);
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Sign out'),
          ),
          SectionCard(
            title: 'Spin the wheel',
            desc: 'Spin the wheel and win prizes!',
            onclick: () =>
                Navigator.of(context).pushNamed(GamificationScreen.routeName),
          ),
          SectionCard(
            title: 'Calorie Track Goal',
            desc:
                'When you reach your calorie intake goal you will have completed your goal and will collect a reward',
            altColor: true,
            onclick: () => print('Good Job!!!! keep Going'),
          )
        ],
      ),
    );
  }
}
