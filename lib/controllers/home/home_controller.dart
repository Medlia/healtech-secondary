import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:healtech/models/user_details.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserDetails?> fetchUserDetails() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('userDetails')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        return UserDetails.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  double lbsToKg(double lbsWeight) {
    double kgWeight = lbsWeight * 0.45;
    return kgWeight;
  }

  List<double> parseHeight(double height) {
    final regex = RegExp(r"(\d+)'(\d+)");
    final match = regex.firstMatch(height.toString());
    if (match != null) {
      return [double.parse(match.group(1)!), double.parse(match.group(2)!)];
    }
    return [0, 0];
  }

  double feetToCm(double feetHeight, double inchHeight) {
    double cmHeight = (feetHeight * 30.48) + (inchHeight * 2.54);
    return cmHeight;
  }

  double calculateBMI(double kgWeight, double cmHeight) {
    double heightM = cmHeight / 100;
    double bmi = kgWeight / (heightM * heightM);
    return bmi;
  }
}
