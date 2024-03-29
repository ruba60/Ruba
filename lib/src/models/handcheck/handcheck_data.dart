import 'package:hospital_mang2/src/models/handcheck/sections_data.dart';

class HandCheckData{
  final String key;
  final List<SectionsData> sections;

  HandCheckData({required this.key, required this.sections});

  factory HandCheckData.fromMap(Map<String, dynamic> json) => HandCheckData(key: json["key"], sections: List<SectionsData>.from( json["sections"].map((x)=> SectionsData.fromMap(x))));
}