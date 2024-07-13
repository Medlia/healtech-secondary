import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    required this.isPassword,
    required this.isFocused,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final bool isPassword;
  final RxBool isFocused;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please the required details';
          } else if (isPassword == true && controller.text.length < 6) {
            return 'Password must be at least 6 characters long';
          } else if (isPassword == false && !controller.text.contains('@')) {
            return 'Enter a valid email address';
          } else {
            return null;
          }
        },
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: isFocused.value ? Colors.white : const Color(0xffdbdcdc),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isFocused.value ? Colors.black : const Color(0xffdbdcdc),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
