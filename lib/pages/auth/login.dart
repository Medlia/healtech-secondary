import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/auth/login_controller.dart';
import 'package:healtech/core/exceptions/auth_exception.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/auth/user_auth_model.dart';
import 'package:healtech/pages/auth/widgets/auth_button.dart';
import 'package:healtech/pages/auth/widgets/custom_auth_row.dart';
import 'package:healtech/pages/auth/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(LoginController());
  bool isVisible = false;

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
                "Log in",
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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.text,
                isPassword: !isVisible,
                isFocused: controller.isPasswordFocused,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
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
                      await controller.login(
                        UserAuthModel(
                          email: controller.email.text,
                          password: controller.password.text,
                        ),
                      );
                      Get.toNamed(navigationRoute);
                    } on UserNotFoundException {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "User not found",
                          message: "Sign up to create an account",
                          duration: Duration(seconds: 20),
                          isDismissible: true,
                          dismissDirection: DismissDirection.down,
                        ),
                      );
                    } on WrongPasswordException {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Wrong Password",
                          message: "Enter the right password to log in",
                          duration: Duration(seconds: 20),
                          isDismissible: true,
                          dismissDirection: DismissDirection.down,
                        ),
                      );
                    } on GenericException {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "An exception ocurred",
                          message: "Try logging in again",
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
                        message: "Enter the email and password to login",
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
                  "Log in",
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
                () async {
                  try {
                    await controller.googleLogIn();
                  } on AccountExistsWithDifferentCredentialException {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "Account exists with different credential",
                        message: "Proceed to log in using new credential",
                        duration: Duration(seconds: 20),
                        isDismissible: true,
                        dismissDirection: DismissDirection.down,
                      ),
                    );
                  } on InvalidCredentialException {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "Invalid credential",
                        message: "Sign up with valid credential",
                        duration: Duration(seconds: 20),
                        isDismissible: true,
                        dismissDirection: DismissDirection.down,
                      ),
                    );
                  } on OperationNotAllowedException {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "Operation not allowed",
                        message: "Try signing up again",
                        duration: Duration(seconds: 20),
                        isDismissible: true,
                        dismissDirection: DismissDirection.down,
                      ),
                    );
                  } on UserNotFoundException {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "User not found",
                        message: "Sign up to create an account",
                        duration: Duration(seconds: 20),
                        isDismissible: true,
                        dismissDirection: DismissDirection.down,
                      ),
                    );
                  } on WrongPasswordException {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "Wrong Password",
                        message: "Enter the right password to log in",
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
                },
                FontAwesomeIcons.google,
                32.0,
                "Log in with Google",
              ),
              const SizedBox(height: 20.0),
              authButton(
                controller.appleLogIn,
                FontAwesomeIcons.apple,
                36.0,
                "Log in with Apple",
              ),
              const Spacer(),
              GestureDetector(
                onTap: controller.navigateToResetPassword,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Forgot password? Reset here",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              GestureDetector(
                onTap: controller.navigateToSignUp,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create an account",
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
