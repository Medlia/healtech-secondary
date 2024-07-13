import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healtech/models/user_details.dart';

class DetailsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserDetails(UserDetails userDetails) async {
    try {
      await _firestore
          .collection('userDetails')
          .doc(userDetails.fullName)
          .set(userDetails.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
