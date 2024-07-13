import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';

class DetailsPageThree extends StatelessWidget {
  const DetailsPageThree({
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
            "Select your health and fitness goals",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: controller.fitnessGoals.length,
              itemBuilder: (BuildContext context, int index) {
                String goal = controller.fitnessGoals[index];
                return Obx(
                  () {
                    bool isSelected =
                        controller.selectedFitnessGoals.contains(goal);
                    return InkWell(
                      onTap: () {
                        controller.toggleFitnessGoal(goal);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.images[index],
                                height: 80.0,
                                width: 80.0,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                goal,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
