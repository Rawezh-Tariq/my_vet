import 'package:flutter/material.dart';
import 'package:my_vet/config/theme.dart';
import 'package:my_vet/config/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: myTheme,
    );
  }
}
