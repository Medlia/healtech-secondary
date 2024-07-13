import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/details/details_controller.dart';
import 'package:healtech/pages/details/widgets/details_page_four.dart';
import 'package:healtech/pages/details/widgets/details_page_one.dart';
import 'package:healtech/pages/details/widgets/details_page_three.dart';
import 'package:healtech/pages/details/widgets/details_page_two.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final controller = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) {
                    return Obx(
                      () => _buildDotIndicator(
                          index, controller.currentIndex.value),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40.0),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: controller.onPageChanged,
                  children: [
                    DetailsPageOne(controller: controller),
                    DetailsPageTwo(controller: controller),
                    DetailsPageThree(controller: controller),
                    DetailsPageFour(controller: controller),
                  ],
                ),
              ),
              Obx(
                () => FilledButton(
                  onPressed: () {
                    if (controller.currentIndex.value == 3) {
                      controller.saveDetails();
                    } else {
                      controller.nextPage();
                    }
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60.0),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    controller.currentIndex.value == 3 ? "Get Started" : "Next",
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
