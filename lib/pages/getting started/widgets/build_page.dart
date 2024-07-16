import 'package:flutter/material.dart';
import 'package:healtech/pages/getting%20started/content/content.dart';

Padding buildPage(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            images[index],
            height: 250.0,
            width: 250.0,
          ),
          const SizedBox(height: 30.0),
          Text(
            heading[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            text[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
