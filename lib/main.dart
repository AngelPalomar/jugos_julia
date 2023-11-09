import 'package:flutter/material.dart';
import 'package:jugos_julia/screens/public/login.dart';
//import 'package:jugos_julia/screens/public/signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(183, 237, 32, 1),
          primary: const Color.fromRGBO(183, 237, 32, 1),
          onPrimary: Colors.white,
          secondary: const Color.fromRGBO(237, 152, 33, 1),
          onSecondary: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      /* routes: {
        '/': (context) => const Login(),
        '/signup': (context) => const Signup(),
      }, */
      home: const Login(),
    );
  }
}
