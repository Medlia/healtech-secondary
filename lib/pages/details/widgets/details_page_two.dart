import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';
import 'package:healtech/pages/auth/widgets/custom_text_field.dart';

class DetailsPageTwo extends StatelessWidget {
  const DetailsPageTwo({
    super.key,
    required this.controller,
  });

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What is your weight?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.weight,
                  focusNode: controller.weightFocusNode,
                  isPassword: false,
                  isFocused: controller.isWeightFocused,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 20.0),
              Obx(
                () => DropdownButton<String>(
                  value: controller.selectedWeightMetric.value,
                  onChanged: (newValue) {
                    controller
                        .updateSelectedWeightMetric(newValue!);
                  },
                  items:
                      <String>['kg', 'lbs'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  iconDisabledColor:
                      Colors.black.withOpacity(0.6),
                  iconEnabledColor: Colors.black,
                  iconSize: 24.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const Text(
            "What is your height?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.height,
                  focusNode: controller.heightFocusNode,
                  isPassword: false,
                  isFocused: controller.isHeightFocused,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 20.0),
              DropdownButton<String>(
                value: controller.selectedHeightMetric.value,
                onChanged: (newValue) {
                  controller
                      .updateSelectedHeightMetric(newValue!);
                },
                items:
                    <String>['cm', 'feet'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                iconDisabledColor:
                    Colors.black.withOpacity(0.6),
                iconEnabledColor: Colors.black,
                iconSize: 24.0,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const Text(
            "What is your target weight?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: controller.targetWeight,
                  focusNode: controller.targetWeightFocusNode,
                  isPassword: false,
                  isFocused: controller.isTargetWeightFocused,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 20.0),
              Obx(
                () => Text(
                  controller.selectedWeightMetric.value,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
