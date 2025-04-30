import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            context.go('/');
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
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              isDense: false,
              hintText: "Teléfono.",
              hintStyle: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              isDense: false,
              hintText: "Contraseña.",
              hintStyle: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              isDense: false,
              hintText: "Confirmar contraseña.",
              hintStyle: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            titleSection,
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: form,
            )
          ],
        ),
      ),
    );
  }
}
