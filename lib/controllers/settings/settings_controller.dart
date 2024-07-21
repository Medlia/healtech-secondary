import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  late final TextEditingController search;

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
