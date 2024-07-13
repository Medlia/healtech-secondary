import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/auth/reset_password_controller.dart';
import 'package:healtech/core/widgets/back_button.dart';
import 'package:healtech/pages/auth/widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "Enter your email address to receive password reset instructions.",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 20.0),
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
              FilledButton(
                onPressed: () async {
                  controller.resetPassword(controller.email.text);
                  Get.showSnackbar(
                    const GetSnackBar(
                      message: "Reset instructions sent!",
                      duration: Duration(seconds: 20),
                      isDismissible: true,
                      dismissDirection: DismissDirection.down,
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60.0),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  "Send reset instructions",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
