import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/exceptions/auth_exception.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/auth/user_auth_model.dart';

class SignupController extends GetxController {
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
    emailFocusNode.removeListener(_onFocusChange);
    passwordFocusNode.removeListener(_onFocusChange);
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> signup(UserAuthModel user) async {
    try {
      await _firebase.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (_firebase.currentUser!.emailVerified) {
        Get.toNamed(detailsRoute);
      } else {
        await _firebase.currentUser!.sendEmailVerification();
        Get.toNamed(emailVerifyRoute);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
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

  void navigateToLogIn() {
    Get.toNamed(logInRoute);
  }

  void googleSignUp() {}
  void appleSignUp() {}
}
