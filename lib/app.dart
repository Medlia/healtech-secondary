import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/pages/auth/login.dart';
import 'package:healtech/pages/auth/signup.dart';
import 'package:healtech/pages/getting%20started/getting_started.dart';
import 'package:healtech/pages/navigation/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Heal Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withOpacity(0.1),
          surfaceTintColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        ),
      ),
      getPages: [
        GetPage(name: gettingStartedRoute, page: () => const GettingStarted()),
        GetPage(name: logInRoute, page: () => const Login()),
        GetPage(name: signUpRoute, page: () => const Signup()),
        GetPage(name: navigationRoute, page: () => const Navigation()),
      ],
      home: const GettingStarted(),
    );
  }
}
