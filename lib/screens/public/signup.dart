import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jugos_julia/api/Api.dart';
import 'package:jugos_julia/models/User.dart';
import 'package:http/http.dart' as http;

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
  Future<User>? _futureUser;

  Future<User> createUser(User user) async {
    String url = Api.user['signup'] as String;

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'PhoneNumber': user.phoneNumber,
          'Password': user.password
        }));

    if (response.statusCode == 201) {
      return user;
    } else {
      throw Exception('Failed to create album.');
    }
  }

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

                final user = User(
                    phoneNumber: phoneNumber.text, password: password.text);

                _futureUser = createUser(user);
                print(_futureUser.toString());

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User created.')),
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
