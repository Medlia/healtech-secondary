import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';

class DetailsPageFour extends StatelessWidget {
  const DetailsPageFour({
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
            "What is your dietary preference?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(
            () => DropdownButtonFormField<String>(
              value: controller
                      .selectedDietaryPreference.value.isEmpty
                  ? null
                  : controller.selectedDietaryPreference.value,
              dropdownColor: Colors.white,
              items: controller.dietaryPreferenceOptions
                  .map((preference) {
                return DropdownMenuItem<String>(
                  value: preference,
                  child: Text(preference),
                );
              }).toList(),
              onChanged: (newValue) {
                controller.selectedDietaryPreference.value =
                    newValue!;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    controller.isDietaryPreferenceFocused.value
                        ? Colors.white
                        : const Color(0xffdbdcdc),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: controller
                            .isDietaryPreferenceFocused.value
                        ? Colors.black
                        : const Color(0xffdbdcdc),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "How often do you exercise?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(
            () => DropdownButtonFormField<String>(
              value: controller
                      .selectedExerciseFrequency.value.isEmpty
                  ? null
                  : controller.selectedExerciseFrequency.value,
              dropdownColor: Colors.white,
              items: controller.exerciseFrequencyOptions
                  .map((preference) {
                return DropdownMenuItem<String>(
                  value: preference,
                  child: Text(preference),
                );
              }).toList(),
              onChanged: (newValue) {
                controller.selectedExerciseFrequency.value =
                    newValue!;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    controller.isExerciseFrequencyFocused.value
                        ? Colors.white
                        : const Color(0xffdbdcdc),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: controller
                            .isExerciseFrequencyFocused.value
                        ? Colors.black
                        : const Color(0xffdbdcdc),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
