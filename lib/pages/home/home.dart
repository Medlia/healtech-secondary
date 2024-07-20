import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';
import 'package:healtech/controllers/home/home_controller.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/user_details.dart';
import 'package:healtech/pages/home/widgets/bmi_chart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());
  final detailController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(
              top: 20.0,
              right: 10.0,
            ),
            child: CircleAvatar(
              backgroundColor: const Color(0xffdbdcdc),
              radius: 28.0,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(settingsRoute);
                },
                child: const Icon(
                  Icons.settings,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.userDetails.value == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black.withOpacity(0.8),
              ),
            );
          }

          UserDetails userDetails = controller.userDetails.value!;
          double kgWeight;
          double targetKgWeight;
          double mHeight;

          kgWeight = detailController.selectedWeightMetric.value == 'lbs'
              ? kgWeight = controller.lbsToKg(userDetails.weight)
              : kgWeight = userDetails.weight;

          targetKgWeight = detailController.selectedWeightMetric.value == 'lbs'
              ? targetKgWeight = controller.lbsToKg(userDetails.targetWeight)
              : targetKgWeight = userDetails.targetWeight;

          mHeight = detailController.selectedHeightMetric.value == 'feet'
              ? controller.feetToCm(
                  controller.parseHeight(userDetails.height)[0],
                  controller.parseHeight(userDetails.height)[1])
              : mHeight = userDetails.height / 100;

          final currentBmi = controller.calculateBMI(kgWeight, mHeight);
          final targetBmi = controller.calculateBMI(targetKgWeight, mHeight);

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, ${userDetails.fullName}!\nCheck your Activity.",
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Current BMI and Target BMI",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      BMIChart(bmi: currentBmi),
                      const Spacer(),
                      BMIChart(bmi: targetBmi),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Number of Steps",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
