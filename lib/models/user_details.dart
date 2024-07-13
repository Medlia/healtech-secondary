import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String fullName;
  DateTime dateOfBirth;
  String gender;
  String bloodType;
  double height;
  double weight;
  double targetWeight;
  String fitnessGoals;
  String dietaryPreferences;
  String exerciseFrequency;

  UserDetails({
    required this.fullName,
    required this.dateOfBirth,
    required this.gender,
    required this.bloodType,
    required this.height,
    required this.weight,
    required this.targetWeight,
    required this.fitnessGoals,
    required this.dietaryPreferences,
    required this.exerciseFrequency,
  });

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      fullName: map['fullName'],
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      gender: map['gender'],
      bloodType: map['bloodType'],
      height: map['height'],
      weight: map['weight'],
      targetWeight: map['targetWeight'],
      fitnessGoals: map['fitnessGoals'],
      dietaryPreferences: map['dietaryPreferences'],
      exerciseFrequency: map['exerciseFrequency'],
    );
  }

  factory UserDetails.fromJson(Map<String, dynamic> map) {
    return UserDetails(
      fullName: map['fullName'],
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      gender: map['gender'],
      bloodType: map['bloodType'],
      height: map['height'],
      weight: map['weight'],
      targetWeight: map['targetWeight'],
      fitnessGoals: map['fitnessGoals'],
      dietaryPreferences: map['dietaryPreferences'],
      exerciseFrequency: map['exerciseFrequency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'bloodType': bloodType,
      'height': height,
      'weight': weight,
      'targetWeight': targetWeight,
      'fitnessGoals': fitnessGoals,
      'dietaryPreferences': dietaryPreferences,
      'exerciseFrequency': exerciseFrequency,
    };
  }
}
