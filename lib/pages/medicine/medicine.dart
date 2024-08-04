import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/medicine/medicine_controller.dart';
import 'package:healtech/core/routes/routes.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  final controller = Get.put(MedicineController());

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != controller.selectedDate.value) {
      controller.setSelectedDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Medicine",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              EasyDateTimeLine(
                activeColor: Colors.black,
                initialDate: controller.selectedDate.value,
                onDateChange: (selectedDate) {
                  controller.setSelectedDate(selectedDate);
                },
                dayProps: const EasyDayProps(
                  inactiveDayStyle: DayStyle(
                    monthStrStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                    dayStrStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    final selectedDate = controller.selectedDate.value;
                    Get.toNamed(addMedicineRoute, arguments: selectedDate);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.2,
                      ),
                    ),
                    overlayColor: Colors.white,
                  ),
                  child: const Text(
                    "Add Medicine Details",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Divider(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
