import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  late final TextEditingController name;
  late final TextEditingController dosage;
  late final TextEditingController frequency;
  late final TextEditingController time;
  late final TextEditingController startDate;
  late final TextEditingController endDate;
  late final TextEditingController instruction;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    dosage = TextEditingController();
    frequency = TextEditingController();
    time = TextEditingController();
    startDate = TextEditingController();
    endDate = TextEditingController();
    instruction = TextEditingController();
  }

  @override
  void onClose() {
    name.dispose();
    dosage.dispose();
    frequency.dispose();
    time.dispose();
    startDate.dispose();
    endDate.dispose();
    instruction.dispose();
    super.onClose();
  }
}
