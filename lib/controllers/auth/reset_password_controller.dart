import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  late final TextEditingController email;
  final emailFocusNode = FocusNode();
  var isEmailFocused = false.obs;

  final FirebaseAuth _firebase = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    emailFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    isEmailFocused.value = emailFocusNode.hasFocus;
  }

  @override
  void onClose() {
    emailFocusNode.removeListener(_onFocusChange);
    emailFocusNode.dispose();
    email.dispose();
    super.onClose();
  }

  void resetPassword(String email) async {
    if (_firebase.currentUser!.emailVerified) {
      await _firebase.sendPasswordResetEmail(email: email);
    }
  }
}
