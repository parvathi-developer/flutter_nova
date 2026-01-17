import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_event.dart';
import 'package:flutter_nova/features/auth/presentations/widget/animated_entry.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedEntry(
      child: Scaffold(
        appBar: AppBar(title: const Text('Forgot Password')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Enter your email to receive a password reset link'),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    AuthForgotPasswordRequested(emailController.text),
                  );
                },

                child: const Text('Send Reset Link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
