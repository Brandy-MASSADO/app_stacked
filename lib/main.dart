//import 'package:app_stacked/ui/homepage/homepage_view.dart';
//import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart' ;
import 'package:app_stacked/ui/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:app_stacked/di/dependency_graph.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginWrapper(),
    );
  }
}