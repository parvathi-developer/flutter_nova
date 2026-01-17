import 'package:flutter/material.dart';
import 'package:flutter_nova/core/bloc/theme_bloc.dart';
import 'package:flutter_nova/core/bloc/theme_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_event.dart';
import 'package:flutter_nova/features/topics/presentations/pages/topics_page.dart';

class NovaHome extends StatelessWidget {
  const NovaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Nova",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            icon: const Icon(Icons.brightness_6),
          ),

          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
          ),
        ],
      ),
      body: Column(children: const [Expanded(child: TopicsPage())]),
    );
  }
}
