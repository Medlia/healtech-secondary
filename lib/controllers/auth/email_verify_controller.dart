import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/routes/routes.dart';

class EmailVerifyController extends GetxController {
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
    email.dispose();
    super.onClose();
  }

  void refreshUser() async {
    await _firebase.currentUser!.reload();
  }

  bool emailVerified() {
    _firebase.currentUser!.reload();
    return _firebase.currentUser!.emailVerified;
  }

  void sendEmailVerification() async {
    _firebase.currentUser!.reload();
    if (_firebase.currentUser!.emailVerified) {
      Get.toNamed(detailsRoute);
    } else {
      await _firebase.currentUser!.sendEmailVerification();
    }
  }
}
