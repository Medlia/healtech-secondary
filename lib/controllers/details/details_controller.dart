import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healtech/core/routes/routes.dart';
import 'package:healtech/models/user_details.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController {
  late final PageController pageController;
  var currentIndex = 0.obs;

  List<String> genderOptions = ['Male', 'Female', 'Other'];
  var selectedGender = ''.obs;
  RxList<String> selectedFitnessGoals = RxList<String>();
  List<String> fitnessGoals = [
    'Weight Loss',
    'Muscle Gain',
    'Improve Endurance',
    'Increase Flexibility',
    'General Fitness',
    'Other'
  ];

  List<String> images = [
    'assets/weight-loss.png',
    'assets/muscle.png',
    'assets/endurance.png',
    'assets/flexible.png',
    'assets/fitness.png',
    'assets/other.png',
  ];

  void toggleFitnessGoal(String goal) {
    if (selectedFitnessGoals.contains(goal)) {
      selectedFitnessGoals.remove(goal);
    } else {
      selectedFitnessGoals.add(goal);
    }
  }

  late final TextEditingController fullName;
  late final TextEditingController dateOfBirth;
  late final TextEditingController bloodType;

  late final TextEditingController height;
  late final TextEditingController weight;
  late final TextEditingController targetWeight;

  RxString selectedWeightMetric = 'kg'.obs;
  RxString selectedHeightMetric = 'cm'.obs;

  void updateSelectedWeightMetric(String metric) {
    selectedWeightMetric.value = metric;
  }

  void updateSelectedHeightMetric(String metric) {
    selectedHeightMetric.value = metric;
  }

  List<String> dietaryPreferenceOptions = [
    'Vegan',
    'Vegetarian',
    'Pescetarian',
    'Gluten-free',
    'Lactose intolerant',
    'Other'
  ];
  RxString selectedDietaryPreference = ''.obs;
  List<String> exerciseFrequencyOptions = [
    'Never',
    'Rarely',
    'Occasionally',
    'Regularly',
    'Frequently'
  ];
  RxString selectedExerciseFrequency = ''.obs;

  void updateDietaryPreference(String preference) {
    selectedDietaryPreference.value = preference;
  }

  void updateExerciseFrequency(String frequency) {
    selectedExerciseFrequency.value = frequency;
  }

  final fullNameFocusNode = FocusNode();
  final dateOfBirthFocusNode = FocusNode();
  final genderFocusNode = FocusNode();
  final bloodTypeFocusNode = FocusNode();

  final heightFocusNode = FocusNode();
  final weightFocusNode = FocusNode();
  final targetWeightFocusNode = FocusNode();

  final dietaryPreferenceFocusNode = FocusNode();
  final exerciseFrequencyFocusNode = FocusNode();

  var isFullNameFocused = false.obs;
  var isDateOfBirthFocused = false.obs;
  var isGenderFocused = false.obs;
  var isBloodTypeFocused = false.obs;

  var isHeightFocused = false.obs;
  var isWeightFocused = false.obs;
  var isTargetWeightFocused = false.obs;

  var isDietaryPreferenceFocused = false.obs;
  var isExerciseFrequencyFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    fullName = TextEditingController();
    dateOfBirth = TextEditingController();
    bloodType = TextEditingController();
    height = TextEditingController();
    weight = TextEditingController();
    targetWeight = TextEditingController();
    fullNameFocusNode.addListener(_onFocusChange);
    dateOfBirthFocusNode.addListener(_onFocusChange);
    genderFocusNode.addListener(_onFocusChange);
    bloodTypeFocusNode.addListener(_onFocusChange);
    heightFocusNode.addListener(_onFocusChange);
    weightFocusNode.addListener(_onFocusChange);
    targetWeightFocusNode.addListener(_onFocusChange);
    dietaryPreferenceFocusNode.addListener(_onFocusChange);
    exerciseFrequencyFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    isFullNameFocused.value = fullNameFocusNode.hasFocus;
    isDateOfBirthFocused.value = dateOfBirthFocusNode.hasFocus;
    isGenderFocused.value = genderFocusNode.hasFocus;
    isBloodTypeFocused.value = bloodTypeFocusNode.hasFocus;
    isHeightFocused.value = heightFocusNode.hasFocus;
    isWeightFocused.value = weightFocusNode.hasFocus;
    isTargetWeightFocused.value = targetWeightFocusNode.hasFocus;
    isDietaryPreferenceFocused.value = dietaryPreferenceFocusNode.hasFocus;
    isExerciseFrequencyFocused.value = exerciseFrequencyFocusNode.hasFocus;
  }

  @override
  void onClose() {
    pageController.dispose();
    fullName.dispose();
    dateOfBirth.dispose();
    bloodType.dispose();
    height.dispose();
    weight.dispose();
    targetWeight.dispose();
    fullNameFocusNode.removeListener(_onFocusChange);
    dateOfBirthFocusNode.removeListener(_onFocusChange);
    genderFocusNode.removeListener(_onFocusChange);
    bloodTypeFocusNode.removeListener(_onFocusChange);
    heightFocusNode.removeListener(_onFocusChange);
    weightFocusNode.removeListener(_onFocusChange);
    targetWeightFocusNode.removeListener(_onFocusChange);
    dietaryPreferenceFocusNode.removeListener(_onFocusChange);
    exerciseFrequencyFocusNode.removeListener(_onFocusChange);
    fullNameFocusNode.dispose();
    dateOfBirthFocusNode.dispose();
    genderFocusNode.dispose();
    bloodTypeFocusNode.dispose();
    heightFocusNode.dispose();
    weightFocusNode.dispose();
    targetWeightFocusNode.dispose();
    dietaryPreferenceFocusNode.dispose();
    exerciseFrequencyFocusNode.dispose();
    super.onClose();
  }

  void showDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      DateFormat format = DateFormat('dd/MM/yyyy');
      dateOfBirth.text = format.format(pickedDate);
    }
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (validateCurrentPage()) {
      if (currentIndex.value < 3) {
        currentIndex.value++;
        pageController.animateToPage(
          currentIndex.value,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  bool validateCurrentPage() {
    switch (currentIndex.value) {
      case 0:
        return fullName.text.isNotEmpty &&
            dateOfBirth.text.isNotEmpty &&
            selectedGender.value.isNotEmpty &&
            bloodType.text.isNotEmpty;
      case 1:
        return height.text.isNotEmpty &&
            weight.text.isNotEmpty &&
            targetWeight.text.isNotEmpty;
      case 2:
        return selectedFitnessGoals.isNotEmpty;
      case 3:
        return selectedDietaryPreference.value.isNotEmpty &&
            selectedExerciseFrequency.value.isNotEmpty;
      default:
        return false;
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> saveDetails() async {
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(dateOfBirth.text);
    UserDetails userDetails = UserDetails(
      fullName: fullName.text,
      dateOfBirth: parsedDate,
      gender: selectedGender.value,
      bloodType: bloodType.text,
      height: double.parse(height.text),
      weight: double.parse(weight.text),
      targetWeight: double.parse(targetWeight.text),
      fitnessGoals: selectedFitnessGoals.join(', '),
      dietaryPreferences: selectedDietaryPreference.value,
      exerciseFrequency: selectedExerciseFrequency.value,
    );

    try {
      await _firestore
          .collection('userDetails')
          .doc(_firebaseAuth.currentUser!.uid)
          .set(userDetails.toJson());
      Get.toNamed(navigationRoute);
    } catch (_) {
      rethrow;
    }
  }
}
