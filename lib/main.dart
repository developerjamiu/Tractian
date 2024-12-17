import 'package:flutter/material.dart';

void main() {
  runApp(const TractianApp());
}

class TractianApp extends StatelessWidget {
  const TractianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: const Text('Tractian'),
        ),
      ),
    );
  }
}
