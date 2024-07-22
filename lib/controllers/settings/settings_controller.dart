import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  late final TextEditingController search;
  final List<String> options = [
    "Edit Profile",
    "Change Password",
    "Email Preference",
    "Privacy Settings",
    "Linked Accounts",
    "Push Notifications",
    "Email Notifications",
    "SMS Notifications",
    "Language Preferences",
    "FAQs",
    "Contact Support",
    "Report a Problem",
    "App Version",
    "Terms of Service",
    "Licenses",
    "Logout"
  ];

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
