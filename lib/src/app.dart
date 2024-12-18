import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tractian/src/data/repositories/traction_repository.dart';
import 'package:tractian/src/presentation/pages/home_page.dart';

import 'core/config/environment_config.dart';

class TractianApp extends StatelessWidget {
  const TractianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (context) => Dio(
            BaseOptions(
              baseUrl: EnvironmentConfig.tractianApiHost,
            ),
          ),
        ),
        Provider<TractionRepository>(
          create: (context) => TractionRepository(
            client: context.read<Dio>(),
          ),
        ),
      ],
      child: CupertinoApp(
        title: 'Tractian App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
