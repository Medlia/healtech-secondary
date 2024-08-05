import 'package:flutter/material.dart';

class AddMedicineField extends StatelessWidget {
  const AddMedicineField({
    super.key,
    this.controller,
    required this.keyboardType,
    this.readOnly,
    required this.hintText,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool? readOnly;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please the required detail';
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
        hintText: hintText,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.6),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
