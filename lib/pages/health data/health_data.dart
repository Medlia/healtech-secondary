import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';
import 'package:healtech/controllers/home/home_controller.dart';
import 'package:healtech/models/user_details.dart';

class HealthData extends StatefulWidget {
  const HealthData({super.key});

  @override
  State<HealthData> createState() => _HealthDataState();
}

class _HealthDataState extends State<HealthData> {
  UserDetails userDetails = Get.put(HomeController()).userDetails.value!;
  final controller = Get.put(DetailsController());

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
                "Health Data",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: HealthDataContainer(
                      color: Colors.blue.shade100,
                      image: 'assets/weighing-scale.png',
                      title: "Weight",
                      value: "${userDetails.weight.round().toString()}"
                          " ${controller.selectedWeightMetric}",
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: HealthDataContainer(
                      color: Colors.green.shade100,
                      image: 'assets/height-scale.png',
                      title: "Height",
                      value: "${userDetails.height.round().toString()}"
                          " ${controller.selectedHeightMetric}",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: HealthDataContainer(
                      color: Colors.yellow.shade100,
                      image: 'assets/steps.png',
                      title: "Steps Taken",
                      value: '2019',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: HealthDataContainer(
                      color: Colors.pink.shade100,
                      image: 'assets/diet.png',
                      title: "Dietary Preference",
                      value: userDetails.dietaryPreferences,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: HealthDataContainer(
                      color: Colors.red.shade100,
                      image: 'assets/exercise.png',
                      title: "Exercise Frequency",
                      value: userDetails.exerciseFrequency,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthDataContainer extends StatelessWidget {
  const HealthDataContainer({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.value,
  });

  final Color color;
  final String image;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14.0, 14.0, 0.0, 14.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              image,
              height: 60.0,
              width: 60.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
