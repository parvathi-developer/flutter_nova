import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_states.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthStates>(
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(title: const Text('Login')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 16),

                // ✅ ERROR TEXT (SEPARATE)
                if (states is AuthError)
                  Text(
                    states.errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      AuthLoginRequested(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                  child: states is AuthLoading
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
