import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<bool> currentUser() async {
    final user = await GoogleSignIn().isSignedIn();
    return user;
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

  Future<UserCredential> googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw GenericException();
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _firebase.signInWithCredential(credential);
      if (userCredential.user != null) {
        Get.toNamed(detailsRoute);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw AccountExistsWithDifferentCredentialException();
      } else if (e.code == 'invalid-credential') {
        throw InvalidCredentialException();
      } else if (e.code == 'operation-not-allowed') {
        throw OperationNotAllowedException();
      } else if (e.code == 'user-not-found') {
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

  void appleSignUp() {}
}
