import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manugestao_app/src/pages/page_sign-up/page_sign-up.dart';

class PageSignIn extends StatefulWidget {
  PageSignIn({super.key});

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('App - Manugestão Beta v1.0'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Implement login logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processando login')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to registration page
                  Get.to(PageSignUP());
                },
                child: const Text('Cadastrar'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to forgot password page
                },
                child: const Text('Esqueci a senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
