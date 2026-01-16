import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlutterNovaApp());
}

class FlutterNovaApp extends StatelessWidget {
  const FlutterNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Flutter Nova', style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
