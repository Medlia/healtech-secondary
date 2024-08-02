import 'package:flutter/material.dart';

class HealthDataContainer extends StatelessWidget {
  const HealthDataContainer({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.value,
  });

  final Color color;
  final String image;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14.0, 14.0, 0.0, 14.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              image,
              height: 60.0,
              width: 60.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
