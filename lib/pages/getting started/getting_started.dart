import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/getting%20started/getting_started_controller.dart';
import 'package:healtech/pages/getting%20started/content/content.dart';

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
                    return _buildPage(index);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) {
                    return Obx(
                      () => _buildDotIndicator(
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

  Padding _buildPage(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            images[index],
            height: 250.0,
            width: 250.0,
          ),
          const SizedBox(height: 30.0),
          Text(
            heading[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            text[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDotIndicator(int index, int currentIndex) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 26.0 : 10.0,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.black : Colors.white,
        shape: currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
        borderRadius:
            currentIndex == index ? BorderRadius.circular(50.0) : null,
        border: Border.all(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}
