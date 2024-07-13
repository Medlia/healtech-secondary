import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/controllers/home/home_controller.dart';
import 'package:healtech/models/user_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());
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
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Hi, ${userDetails.fullName}!\nCheck your Activity.",
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
