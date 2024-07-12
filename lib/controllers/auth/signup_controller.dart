import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/routes/routes.dart';

class SignupController extends GetxController {
  late final TextEditingController email;
  late final TextEditingController password;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  var isEmailFocused = false.obs;
  var isPasswordFocused = false.obs;
  var isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
    emailFocusNode.addListener(_onFocusChange);
    passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    isEmailFocused.value = emailFocusNode.hasFocus;
    isPasswordFocused.value = passwordFocusNode.hasFocus;
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    emailFocusNode.removeListener(_onFocusChange);
    passwordFocusNode.removeListener(_onFocusChange);
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  void signup() {
    Get.toNamed(navigationRoute);
  }

  void checked() {
    isChecked.value = !isChecked.value;
  }

  void navigateToLogIn() {
    Get.toNamed(logInRoute);
  }

  void googleSignUp() {}
  void appleSignUp() {}
}
