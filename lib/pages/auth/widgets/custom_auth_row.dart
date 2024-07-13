import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAuthRow extends StatelessWidget {
  const CustomAuthRow({
    super.key,
    required this.onTap,
    required this.isChecked,
  });

  final VoidCallback onTap;
  final RxBool isChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => GestureDetector(
            onTap: onTap,
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
              child: isChecked.value
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
    );
  }
}
