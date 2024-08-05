import 'package:flutter/material.dart';
import 'package:healtech/pages/health%20data/health_data.dart';
import 'package:healtech/pages/home/home.dart';
import 'package:healtech/pages/medicine/medicine.dart';
import 'package:healtech/pages/tips/tips.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = <Widget>[
    const Home(),
    const HealthData(),
    const Medicine(),
    const Text("Demo"),
    const Tips(),
  ];

  void onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        animationDuration: const Duration(milliseconds: 400),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              size: 30.0,
            ),
            selectedIcon: Icon(
              Icons.home,
              size: 30.0,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.health_and_safety_outlined,
              size: 28.0,
            ),
            selectedIcon: Icon(
              Icons.health_and_safety,
              size: 28.0,
            ),
            label: "Health Data",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.medication_outlined,
              size: 28.0,
            ),
            selectedIcon: Icon(
              Icons.medication,
              size: 28.0,
            ),
            label: "Medicine",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.medical_information_outlined,
              size: 28.0,
            ),
            selectedIcon: Icon(
              Icons.medical_information,
              size: 28.0,
            ),
            label: "Appointment",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.tips_and_updates_outlined,
              size: 28.0,
            ),
            selectedIcon: Icon(
              Icons.tips_and_updates,
              size: 28.0,
            ),
            label: "Health Tips",
          ),
        ],
      ),
    );
  }
}
