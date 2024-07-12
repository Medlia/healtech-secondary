import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/exceptions/auth_exception.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/auth/user_auth_model.dart';

class LoginController extends GetxController {
  late final TextEditingController email;
  late final TextEditingController password;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  var isEmailFocused = false.obs;
  var isPasswordFocused = false.obs;
  var isChecked = false.obs;

  final FirebaseAuth _firebase = FirebaseAuth.instance;

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

  Future<void> login(UserAuthModel user) async {
    try {
      await _firebase.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else {
        throw GenericException();
      }
    } catch (e) {
      throw GenericException();
    }
  }

  void checked() {
    isChecked.value = !isChecked.value;
  }

  void navigateToSignUp() {
    Get.toNamed(signUpRoute);
  }

  void googleLogIn() {}
  void appleLogIn() {}
}
