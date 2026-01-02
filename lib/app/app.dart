import 'package:community/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Open Sans',
      ),
      home: const LoginScreen(),
    );
  }
}