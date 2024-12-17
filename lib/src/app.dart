import 'package:flutter/material.dart';

class TractianApp extends StatelessWidget {
  const TractianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian App',
      home: Scaffold(
        body: Center(
          child: const Text('Tractian'),
        ),
      ),
    );
  }
}
