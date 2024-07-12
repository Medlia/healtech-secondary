import 'package:flutter/material.dart';

GestureDetector authButton(
    VoidCallback onTap, IconData icon, double iconSize, String text) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: Colors.black,
          ),
          const SizedBox(width: 40.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
