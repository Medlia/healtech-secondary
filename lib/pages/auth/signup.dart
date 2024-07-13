import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/auth/signup_controller.dart';
import 'package:healtech/core/exceptions/auth_exception.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/auth/user_auth_model.dart';
import 'package:healtech/pages/auth/widgets/auth_button.dart';
import 'package:healtech/pages/auth/widgets/custom_auth_row.dart';
import 'package:healtech/pages/auth/widgets/custom_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                controller: controller.email,
                focusNode: controller.emailFocusNode,
                isPassword: false,
                isFocused: controller.isEmailFocused,
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                controller: controller.password,
                focusNode: controller.passwordFocusNode,
                isPassword: true,
                isFocused: controller.isPasswordFocused,
              ),
              const SizedBox(height: 20.0),
              CustomAuthRow(
                onTap: controller.checked,
                isChecked: controller.isChecked,
              ),
              const SizedBox(height: 40.0),
              FilledButton(
                onPressed: () async {
                  if (controller.email.text.isNotEmpty &&
                      controller.password.text.isNotEmpty &&
                      controller.isChecked.isTrue) {
                    try {
                      await controller.signup(
                        UserAuthModel(
                          email: controller.email.text,
                          password: controller.password.text,
                        ),
                      );
                      Get.toNamed(emailVerifyRoute);
                    } on InvalidEmailException {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Invalid email",
                          message: "Enter a valid email address",
                          duration: Duration(seconds: 20),
                          isDismissible: true,
                          dismissDirection: DismissDirection.down,
                        ),
                      );
                    } on WeakPasswordException {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Weak password",
                          message: "Enter a valid password to sign up",
                          duration: Duration(seconds: 20),
                          isDismissible: true,
                          dismissDirection: DismissDirection.down,
                        ),
                      );
                    } on EmailAlreadyInUseException {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Email already in use",
                          message: "Proceed to log in using this email",
                          duration: Duration(seconds: 20),
                          isDismissible: true,
                          dismissDirection: DismissDirection.down,
                        ),
                      );
                    } on GenericException {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "An exception ocurred",
                          message: "Try signing up again",
                          duration: Duration(seconds: 20),
                          isDismissible: true,
                          dismissDirection: DismissDirection.down,
                        ),
                      );
                    }
                  } else {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "Enter all the details",
                        message: "Enter the email and password to sign up",
                        duration: Duration(seconds: 20),
                        isDismissible: true,
                        dismissDirection: DismissDirection.down,
                      ),
                    );
                  }
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60.0),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "or",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              authButton(
                controller.googleSignUp,
                FontAwesomeIcons.google,
                32.0,
                "Sign up with Google",
              ),
              const SizedBox(height: 20.0),
              authButton(
                controller.appleSignUp,
                FontAwesomeIcons.apple,
                36.0,
                "Sign up with Apple",
              ),
              const Spacer(),
              GestureDetector(
                onTap: controller.navigateToLogIn,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Log in to existing account",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
