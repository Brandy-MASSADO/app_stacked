import 'package:app_stacked/di/dependency_graph.dart';
import 'package:app_stacked/controllers/connection/homepage_viewmodel.dart';
import 'package:app_stacked/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
      viewModelBuilder: () => locator<HomepageViewModel>(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("MyLoginPage"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Connectez-vous',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(viewModel.displayedError),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: viewModel.emailController,
                      onSubmitted: (value) {
                        viewModel.verifyEmail(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    controller: viewModel.passwordController,
                    onSubmitted: (value) => viewModel.verifyPassword(value),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => WelcomeScreen(),
                    child: const Text('Submit'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: GestureDetector(
                      onTap: () => viewModel.navigateToRegisterView(context),
                      child: const Text(
                          "Vous n'avez pas de compte ? Inscrivez-vous"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}