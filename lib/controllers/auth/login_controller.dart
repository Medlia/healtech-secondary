import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healtech/core/exceptions/auth_exception.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/auth/user_auth_model.dart';
import 'package:healtech/models/user_details.dart';

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
    emailFocusNode.removeListener(_onFocusChange);
    passwordFocusNode.removeListener(_onFocusChange);
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rx<UserDetails?> userDetails = Rx<UserDetails?>(null);

  Future<void> fetchUserDetails() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('userDetails')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        userDetails.value = UserDetails.fromJson(snapshot.data()!);
      } else {
        userDetails.value = null;
      }
    } catch (e) {
      userDetails.value = null;
    }
  }

  Future<bool> currentUser() async {
    final user = await GoogleSignIn().isSignedIn();
    return user;
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

  void navigateToResetPassword() {
    Get.toNamed(resetPasswordRoute);
  }

  void navigateToSignUp() {
    Get.toNamed(signUpRoute);
  }

  Future<UserCredential> googleLogIn() async {
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

  void appleLogIn() {}
}
