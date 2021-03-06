import 'package:app_stacked/ui/content/content_view.dart';
import 'package:app_stacked/screens/connexion/homepage_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const ContentPage();
          } else {
            return const MyHomePage();
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}