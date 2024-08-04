import 'package:get/get.dart';

class MedicineController extends GetxController {
  var selectedDate = DateTime.now().obs;

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
}
