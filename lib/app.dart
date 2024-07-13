import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/core/theme/theme.dart';
import 'package:healtech/pages/auth/email_verify.dart';
import 'package:healtech/pages/auth/login.dart';
import 'package:healtech/pages/auth/reset_password.dart';
import 'package:healtech/pages/auth/signup.dart';
import 'package:healtech/pages/details/details.dart';
import 'package:healtech/pages/getting%20started/getting_started.dart';
import 'package:healtech/pages/navigation/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Heal Tech',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      getPages: [
        GetPage(name: gettingStartedRoute, page: () => const GettingStarted()),
        GetPage(name: logInRoute, page: () => const Login()),
        GetPage(name: signUpRoute, page: () => const Signup()),
        GetPage(name: emailVerifyRoute, page: () => const EmailVerify()),
        GetPage(name: resetPasswordRoute, page: () => const ResetPassword()),
        GetPage(name: detailsRoute, page: () => const Details()),
        GetPage(name: navigationRoute, page: () => const Navigation()),
      ],
      home: const GettingStarted(),
    );
  }
}
