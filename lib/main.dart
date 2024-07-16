import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healtech/app.dart';
import 'package:healtech/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasCompletedGettingStarted =
      prefs.getBool('getting_started_complete') ?? false;
  runApp(
    MyApp(
      hasCompletedGettingStarted: hasCompletedGettingStarted,
    ),
  );
}
