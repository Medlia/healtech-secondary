import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/pages/getting%20started/content/content.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GettingStartedController extends GetxController {
  late final PageController pageController;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() async {
    if (currentIndex.value < images.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('getting_started_complete', true);
      Get.toNamed(logInRoute);
    }
  }
}
