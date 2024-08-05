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
  final DateTime today = DateTime.now();

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
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Obx(
                () {
                  if (controller.medicines.isEmpty) {
                    return const Center(child: Text('No medicines found.'));
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.medicines.length,
                      itemBuilder: (context, index) {
                        final medicine = controller.medicines[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/med_card.jpeg'),
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.8),
                                  width: 1.2,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    medicine.name,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    "${medicine.dosage} mg ${medicine.frequency}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                  Text(
                                    "${medicine.instruction} at ${medicine.time}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
