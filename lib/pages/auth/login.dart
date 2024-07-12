import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/auth/login_controller.dart';
import 'package:healtech/core/exceptions/auth_exception.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/auth/user_auth_model.dart';
import 'package:healtech/pages/auth/widgets/auth_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = Get.put(LoginController());

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
              Obx(
                () => TextFormField(
                  controller: controller.email,
                  focusNode: controller.emailFocusNode,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: controller.isEmailFocused.value
                        ? Colors.white
                        : const Color(0xffdbdcdc),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: controller.isEmailFocused.value
                            ? Colors.black
                            : const Color(0xffdbdcdc),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
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
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  focusNode: controller.passwordFocusNode,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: controller.isPasswordFocused.value
                        ? Colors.white
                        : const Color(0xffdbdcdc),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: controller.isPasswordFocused.value
                            ? Colors.black
                            : const Color(0xffdbdcdc),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: controller.checked,
                      child: Container(
                        height: 14.0,
                        width: 14.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        child: controller.isChecked.value
                            ? const Icon(
                                Icons.check,
                                size: 14.0,
                                color: Colors.black,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Flexible(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              FilledButton(
                onPressed: () async {
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
                      ),
                    );
                  } on WrongPasswordException {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "Wrong Password",
                        message: "Enter the right password to log in",
                      ),
                    );
                  } on GenericException {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "An exception ocurred",
                        message: "Try logging in again",
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
                controller.googleLogIn,
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
