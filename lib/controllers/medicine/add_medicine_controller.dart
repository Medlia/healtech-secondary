import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/models/medicine/medicine_model.dart';
import 'package:intl/intl.dart';

class AddMedicineController extends GetxController {
  late final TextEditingController name;
  late final TextEditingController dosage;
  late final TextEditingController frequency;
  late final TextEditingController time;
  late final TextEditingController endDate;
  late final TextEditingController instruction;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    dosage = TextEditingController();
    frequency = TextEditingController();
    time = TextEditingController();
    endDate = TextEditingController();
    instruction = TextEditingController();
  }

  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;

  void pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.inputOnly,
      initialTime: selectedTime.value,
    );

    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      if (!context.mounted) return;
      time.text = pickedTime.format(context);
    }
  }

  void pickEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2300),
      initialDate: selectedEndDate.value,
    );

    if (pickedDate != null) {
      selectedEndDate.value = pickedDate;
      endDate.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  Future<void> saveDetails(String startDate) async {
    MedicineModel medicine = MedicineModel(
      name: name.text,
      dosage: int.tryParse(dosage.text) ?? 0,
      frequency: frequency.text,
      time: time.text,
      startDate: startDate,
      endDate: endDate.text,
      instruction: instruction.text,
    );

    try {
      await _firestore
          .collection('medicines')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('entries')
          .add(medicine.toJson());
      Get.back();
    } catch (_) {
      rethrow;
    }
  }

  @override
  void onClose() {
    name.dispose();
    dosage.dispose();
    frequency.dispose();
    time.dispose();
    endDate.dispose();
    instruction.dispose();
    super.onClose();
  }
}
