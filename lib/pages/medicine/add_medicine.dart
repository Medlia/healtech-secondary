import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/medicine/add_medicine_controller.dart';
import 'package:healtech/core/widgets/back_button.dart';
import 'package:healtech/pages/medicine/widgets/add_medicine_field.dart';
import 'package:intl/intl.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final controller = Get.put(AddMedicineController());
  final startDate = DateFormat('dd/MM/yyyy').format(Get.arguments);
  bool warning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: CustomBackButton(
          onTap: () {
            Get.back();
          },
        ),
        title: const Text(
          "Add Medicine Details",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Medicine Name",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                AddMedicineField(
                  controller: controller.name,
                  keyboardType: TextInputType.name,
                  hintText: 'Name',
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dosage",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          AddMedicineField(
                            controller: controller.dosage,
                            keyboardType: TextInputType.number,
                            hintText: 'Dosage',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Frequency",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          AddMedicineField(
                            controller: controller.frequency,
                            keyboardType: TextInputType.text,
                            hintText: 'Frequency',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Time",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                AddMedicineField(
                  controller: controller.time,
                  keyboardType: TextInputType.text,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.pickTime(context);
                    },
                    child: const Icon(
                      Icons.timer,
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'Time',
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Start Date",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                AddMedicineField(
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  hintText: startDate,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "End Date",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                AddMedicineField(
                  controller: controller.endDate,
                  keyboardType: TextInputType.text,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.pickEndDate(context);
                    },
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'End Time',
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Instructions",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                AddMedicineField(
                  controller: controller.instruction,
                  keyboardType: TextInputType.text,
                  hintText: 'Instruction',
                ),
                warning
                    ? const SizedBox(height: 20.0)
                    : const SizedBox(height: 0.0),
                warning
                    ? Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Enter all the details",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black.withOpacity(0.8),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : const Text(""),
                warning
                    ? const SizedBox(height: 20.0)
                    : const SizedBox(height: 40.0),
                FilledButton(
                  onPressed: () {
                    if (controller.name.text.isEmpty ||
                        controller.dosage.text.isEmpty ||
                        controller.frequency.text.isEmpty ||
                        controller.time.text.isEmpty ||
                        controller.endDate.text.isEmpty ||
                        controller.instruction.text.isEmpty) {
                      setState(() {
                        warning = true;
                      });
                    } else {
                      controller.saveDetails(startDate);
                    }
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60.0),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Save Details",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
