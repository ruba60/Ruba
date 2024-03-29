class SectionsData {
  final int sectionId;
  final String sectionName;

  SectionsData({required this.sectionId, required this.sectionName});

  factory SectionsData.fromMap(Map<String, dynamic> json) => SectionsData(
      sectionId: json["sectionId"], sectionName: json["sectionName"]);
}
