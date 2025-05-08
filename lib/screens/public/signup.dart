import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _signUpFormKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

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
      key: _signUpFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: phoneNumber,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa tu número celular.';
              }
              return null;
            },
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
            controller: password,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa una contraseña';
              } else if (value.length < 6) {
                return 'Ingresa una contraseña de al menos 6 dígitos';
              }
              return null;
            },
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
            controller: confirmPassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirma tu contraseña';
              } else if (value != password.text) {
                return 'Las contraseñas no coinciden.';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              isDense: false,
              hintText: "Confirmar contraseña.",
              hintStyle: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              if (_signUpFormKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text("CREAR CUENTA"),
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
