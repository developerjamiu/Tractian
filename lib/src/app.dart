import 'package:flutter/cupertino.dart';
import 'package:tractian/src/presentation/pages/home_page.dart';

class TractianApp extends StatelessWidget {
  const TractianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Tractian App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
