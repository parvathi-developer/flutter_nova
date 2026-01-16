import 'package:flutter/material.dart';
import 'package:flutter_nova/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCoreDepenencies();
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
