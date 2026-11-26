import 'package:email_auth_app/pages/home_screen.dart';
import 'package:email_auth_app/pages/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthChecker extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        //Has Data
        if (snapshot.hasData) {
          return HomeScreen();
        }

        //No data
        return LoginPage();
      },
    );
  }
}
