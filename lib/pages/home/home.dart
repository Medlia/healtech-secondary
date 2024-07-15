import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';
import 'package:healtech/controllers/home/home_controller.dart';
import 'package:healtech/models/user_details.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
      body: FutureBuilder<UserDetails?>(
        future: controller.fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black.withOpacity(0.8),
              ),
            );
          }

          UserDetails userDetails = snapshot.data!;
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
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 180.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4.0,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: SfRadialGauge(
                          title: GaugeTitle(
                            text: (currentBmi / 10000)
                                .toDouble()
                                .toStringAsFixed(1),
                            textStyle: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 10,
                              maximum: 40,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: 10,
                                  endValue: 18.5,
                                  color: Colors.blue,
                                  label: 'Underweight',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 18.5,
                                  endValue: 24.9,
                                  color: Colors.green,
                                  label: 'Normal',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 25,
                                  endValue: 29.9,
                                  color: Colors.yellow,
                                  label: 'Overweight',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 30,
                                  endValue: 34.9,
                                  color: Colors.orange,
                                  label: 'Obese',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 35,
                                  endValue: 40,
                                  color: Colors.red,
                                  label: 'Extremely Obese',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: (currentBmi / 10000).toDouble(),
                                  needleColor: Colors.black,
                                  knobStyle: const KnobStyle(
                                    color: Colors.grey,
                                    knobRadius: 0.06,
                                    sizeUnit: GaugeSizeUnit.factor,
                                  ),
                                  needleEndWidth: 4.0,
                                  needleStartWidth: 1.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 180.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4.0,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: SfRadialGauge(
                          title: GaugeTitle(
                            text: (targetBmi / 10000)
                                .toDouble()
                                .toStringAsFixed(1),
                            textStyle: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 10,
                              maximum: 40,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: 10,
                                  endValue: 18.5,
                                  color: Colors.blue,
                                  label: 'Underweight',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 18.5,
                                  endValue: 24.9,
                                  color: Colors.green,
                                  label: 'Normal',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 25,
                                  endValue: 29.9,
                                  color: Colors.yellow,
                                  label: 'Overweight',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 30,
                                  endValue: 34.9,
                                  color: Colors.orange,
                                  label: 'Obese',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                GaugeRange(
                                  startValue: 35,
                                  endValue: 40,
                                  color: Colors.red,
                                  label: 'Extremely Obese',
                                  sizeUnit: GaugeSizeUnit.factor,
                                  labelStyle: const GaugeTextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: (targetBmi / 10000).toDouble(),
                                  needleColor: Colors.black,
                                  knobStyle: const KnobStyle(
                                    color: Colors.grey,
                                    knobRadius: 0.06,
                                    sizeUnit: GaugeSizeUnit.factor,
                                  ),
                                  needleEndWidth: 4.0,
                                  needleStartWidth: 1.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
