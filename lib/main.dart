//import 'package:app_stacked/ui/homepage/homepage_view.dart';
//import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart' ;
import 'package:app_stacked/ui/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:app_stacked/di/dependency_graph.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:app_stacked/screens/welcome/quiz/quiz_screen.dart';
//import 'package:app_stacked/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoginWrapper()
    );
  }
}
