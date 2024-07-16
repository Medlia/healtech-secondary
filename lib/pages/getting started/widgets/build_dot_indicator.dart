import 'package:flutter/material.dart';

Container buildDotIndicator(int index, int currentIndex) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 26.0 : 10.0,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.black : Colors.white,
        shape: currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
        borderRadius:
            currentIndex == index ? BorderRadius.circular(50.0) : null,
        border: Border.all(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
