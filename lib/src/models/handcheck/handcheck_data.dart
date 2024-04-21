import 'package:hospital_mang2/src/models/department/department_data.dart';

class HandCheckData {
  final String key;
  final List<Department> sections;

  HandCheckData({required this.key, required this.sections});

  factory HandCheckData.fromMap(Map<String, dynamic> json) => HandCheckData(
      key: json["key"],
      sections: List<Department>.from(
          json["sections"].map((x) => Department.fromMap(x))));
}
