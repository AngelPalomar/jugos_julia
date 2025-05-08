import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Doña Julia",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "¡Los mejores jugos del mundo!",
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );

    Widget form = Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    const Text(
                      "Iniciar Sesión",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "* Todos los campos son requeridos.",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumber,
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
                    obscureText: true,
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa una contraseña';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[100],
                      isDense: false,
                      hintText: "Contraseña",
                      hintStyle: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text("INGRESAR"),
                  ),
                  const SizedBox(height: 6),
                  FilledButton(
                    onPressed: () {
                      context.go('/signup');
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Text("CREAR UNA CUENTA"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'images/login_cover.png',
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleSection,
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                form,
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
