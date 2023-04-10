import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './switcher_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  LoginScreen({super.key});

  // Some state variables that will be used in the page
  bool isLogin = true;
  final authInstance = FirebaseAuth.instance;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // These are the variables that will hold the text from the email and password inputs
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submit() async {
    // If you can't validate, show an error and return
    if (!_validate(emailController.text, passwordController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalid data entered! Please try again.'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    widget.isLogin ? await _login() : await _register();

    // Show a message to notify the user
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Signed in/ Signed up successfully!'),
      backgroundColor: Colors.green,
    ));

    // Go back to the switcher screen and display the appropriate screen
    Navigator.of(context).pushReplacementNamed(SwitcherScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Email input
          TextField(
            decoration: const InputDecoration(label: Text('Email')),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),

          // Password input
          TextField(
            decoration: const InputDecoration(label: Text('Password')),
            controller: passwordController,
            obscureText: true,
          ),

          // Submit button
          ElevatedButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.login),
            label: Text(widget.isLogin ? 'Login' : 'Sign up'),
          ),

          // Switch form mode button
          ElevatedButton(
            onPressed: () => setState(() => widget.isLogin = !widget.isLogin),
            child: Text(widget.isLogin ? 'Sign up' : 'Log in'),
          ),
        ],
      ),
    );
  }

  Future<void> _register() async {
    // Try to login
    try {
      await widget.authInstance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (error) {
      // Catch any errors and set then set the error string accordingly
      String errorMessage = 'An error occured, please try again later.';
      switch ((error as FirebaseAuthException).code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }

      // Show the error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> _login() async {
    // Try to log in
    try {
      await widget.authInstance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (error) {
      // Show an error the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occured while logging in! Please try again.'),
        ),
      );
    }
  }
}

bool _validate(String email, String password) {
  // Check that they are not empty
  if (email.isEmpty || password.isEmpty) {
    return false;
  }
  // Check that the email format is correct
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) {
    return false;
  }
  // If all passed, return true (valid)
  return true;
}
