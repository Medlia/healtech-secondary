import 'package:flutter/material.dart';
import 'package:healtech/controllers/settings/settings_controller.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.search,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Search",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.black.withOpacity(0.4),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.8,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.8,
          ),
        ),
      ),
    );
  }
}
