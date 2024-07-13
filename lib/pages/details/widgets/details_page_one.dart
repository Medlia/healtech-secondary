import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';
import 'package:healtech/pages/auth/widgets/custom_text_field.dart';

class DetailsPageOne extends StatelessWidget {
  const DetailsPageOne({
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
            "What do we call you?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            controller: controller.fullName,
            focusNode: controller.fullNameFocusNode,
            keyboardType: TextInputType.name,
            isPassword: false,
            isFocused: controller.isFullNameFocused,
          ),
          const SizedBox(height: 20.0),
          const Text(
            "What is your date of birth?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            controller: controller.dateOfBirth,
            focusNode: controller.dateOfBirthFocusNode,
            keyboardType: TextInputType.datetime,
            isPassword: false,
            isFocused: controller.isDateOfBirthFocused,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.showDate(context);
              },
              child: const Icon(Icons.calendar_month_outlined),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "What is your gender?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(
            () => DropdownButtonFormField<String>(
              value: controller.selectedGender.value.isEmpty
                  ? null
                  : controller.selectedGender.value,
              dropdownColor: Colors.white,
              items: controller.genderOptions.map((gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (newValue) {
                controller.selectedGender.value = newValue!;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: controller.isGenderFocused.value
                    ? Colors.white
                    : const Color(0xffdbdcdc),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: controller.isGenderFocused.value
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
            "What is your blood group?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            controller: controller.bloodType,
            focusNode: controller.bloodTypeFocusNode,
            keyboardType: TextInputType.text,
            isPassword: false,
            isFocused: controller.isBloodTypeFocused,
          ),
        ],
      ),
    );
  }
}
