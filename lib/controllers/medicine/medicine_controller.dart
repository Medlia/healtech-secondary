import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:healtech/models/medicine/medicine_model.dart';

class MedicineController extends GetxController {
  var selectedDate = DateTime.now().obs;

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var medicines = <MedicineModel>[].obs;

  Future<void> fetchMedicineDetails() async {
    try {
      String userId = _firebaseAuth.currentUser?.uid ?? '';
      if (userId.isEmpty) {
        throw Exception('User not logged in');
      }

      QuerySnapshot snapshot = await _firestore
          .collection('medicines')
          .doc(userId)
          .collection('entries')
          .get();

      medicines.assignAll(snapshot.docs
          .map((doc) =>
              MedicineModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList());
    } catch (e) {
      rethrow;
    }
  }
}
