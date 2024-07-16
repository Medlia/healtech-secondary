import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/getting%20started/getting_started_controller.dart';
import 'package:healtech/pages/getting%20started/content/content.dart';
import 'package:healtech/pages/getting%20started/widgets/build_dot_indicator.dart';
import 'package:healtech/pages/getting%20started/widgets/build_page.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  final controller = Get.put(GettingStartedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: images.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return buildPage(index);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) {
                    return Obx(
                      () => buildDotIndicator(
                          index, controller.currentIndex.value),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50.0),
              Obx(
                () => FilledButton(
                  onPressed: controller.nextPage,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60.0),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    controller.currentIndex.value == images.length - 1
                        ? "Get Started"
                        : "Next",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
