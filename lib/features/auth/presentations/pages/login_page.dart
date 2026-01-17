import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/core/utils/validators.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_event.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_states.dart';
import 'package:flutter_nova/features/auth/presentations/pages/forgot_password_page.dart';
import 'package:flutter_nova/features/auth/presentations/pages/register_page.dart';
import 'package:flutter_nova/features/auth/presentations/widget/animated_entry.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: AnimatedEntry(
        child: Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'FlutterNova',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6C63FF), Color(0xFF3F3D56)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailCtrl,
                                    validator: Validators.email,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: passCtrl,
                                    validator: Validators.password,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                    ),
                                  ),

                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ForgotPasswordPage(),
                                        ),
                                      );
                                    },
                                    child: const Text('Forgot password?'),
                                  ),

                                  const SizedBox(height: 12),

                                  BlocBuilder<AuthBloc, AuthStates>(
                                    builder: (context, state) {
                                      return ElevatedButton(
                                        onPressed: state is AuthLoading
                                            ? null
                                            : () {
                                                context.read<AuthBloc>().add(
                                                  AuthLoginRequested(
                                                    email: emailCtrl.text,
                                                    password: passCtrl.text,
                                                  ),
                                                );
                                              },
                                        child: state is AuthLoading
                                            ? const CircularProgressIndicator()
                                            : const Text('Sign In'),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 20),

                                  OutlinedButton.icon(
                                    icon: const Icon(Icons.login),
                                    label: const Text('Sign in with Google'),
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                        AuthGoogleSignInRequested(),
                                      );
                                    },
                                  ),

                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: const Text('Create new account'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
