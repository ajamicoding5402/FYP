import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/switcher_screen.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './screens/gamification_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriDoc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SwitcherScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        GamificationScreen.routeName: (context) => GamificationScreen(),
      },
    );
  }
}

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({Key? key}) : super(key: key);

//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';
//   String _confirmPassword = '';

//   void _submitForm(String email, String password) {
//     // if (_formKey.currentState!.validate()) {
//     //   _formKey.currentState!.save();
//     //   print('Email: $_email');
//     //   print('Password: $_password');
//     //   // Register the user here, e.g., send data to server, save to database, etc.
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) => {
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text('Hey dipshit! you\'ve done it!!!!')))
//             });
//     // }
//   }

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _email = value!,
//                 controller: emailController,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   } else if (value.length < 8) {
//                     return 'Password must be at least 8 characters';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _password = value!,
//                 controller: passwordController,
//               ),
//               TextFormField(
//                 decoration:
//                     const InputDecoration(labelText: 'Confirm Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm your password';
//                   } else if (value != _password) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _confirmPassword = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _submitForm(
//                     emailController.value.text, passwordController.value.text),
//                 child: const Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
