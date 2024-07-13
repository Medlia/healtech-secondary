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
}
