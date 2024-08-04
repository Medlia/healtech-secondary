class MedicineModel {
  final String name;
  final int dosage;
  final String frequency;
  final String time;
  final String startDate;
  final String endDate;
  final String instruction;

  const MedicineModel({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.time,
    required this.startDate,
    required this.endDate,
    required this.instruction,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dosage': dosage,
      'frequency': frequency,
      'time': time,
      'startDate': startDate,
      'endDate': endDate,
      'instruction': instruction,
    };
  }

  static MedicineModel fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      name: json['name'],
      dosage: json['dosage'],
      frequency: json['frequency'],
      time: json['time'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      instruction: json['instruction']
    );
  }
}
