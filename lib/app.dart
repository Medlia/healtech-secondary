import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/routes/pages.dart';
import 'package:healtech/core/theme/theme.dart';
import 'package:healtech/pages/auth/login.dart';
import 'package:healtech/pages/getting%20started/getting_started.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.hasCompletedGettingStarted,
  });

  final bool hasCompletedGettingStarted;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Heal Tech',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      getPages: pages,
      home: hasCompletedGettingStarted ? const Login() : const GettingStarted(),
    );
  }
}
