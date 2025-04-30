import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Registrarse",
              style: TextStyle(fontSize: 26),
            ),
            Text(
              "* Todos los campos son requeridos.",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        )
      ],
    );

    Widget form = Form(
      child: Column(
        children: <Widget>[],
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            titleSection,
          ],
        ),
      ),
    );
  }
}
