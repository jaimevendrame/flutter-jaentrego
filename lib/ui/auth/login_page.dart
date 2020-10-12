import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text(
          'Login',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
