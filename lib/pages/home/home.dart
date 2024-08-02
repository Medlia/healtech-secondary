import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/auth/login_controller.dart';
import 'package:healtech/controllers/details/details_controller.dart';
import 'package:healtech/controllers/home/home_controller.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/user_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());
  final loginController = Get.put(LoginController());
  final detailController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (loginController.userDetails.value == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black.withOpacity(0.8),
              ),
            );
          }

          UserDetails userDetails = loginController.userDetails.value!;
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
                  Row(
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
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(settingsRoute);
                        },
                        child: const Icon(
                          Icons.settings,
                          size: 32.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text((currentBmi / 10000).toStringAsFixed(1)),
                  Text((targetBmi / 10000).toStringAsFixed(1)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
