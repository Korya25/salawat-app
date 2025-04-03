import 'package:flutter/material.dart';
import 'package:salawat_app/core/resources/app_router.dart';
import 'package:salawat_app/core/resources/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: getApplicationTheme(),
    );
  }
}
