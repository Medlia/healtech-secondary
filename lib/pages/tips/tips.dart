import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  const Tips({super.key});

  @override
  State<Tips> createState() => TipsState();
}

class TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Health Tips",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
