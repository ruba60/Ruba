import 'package:hospital_mang2/src/models/handcheck/handcheck_data.dart';
import 'package:hospital_mang2/src/models/handcheck/sections_data.dart';

class HandCheckRepository {
  Future<HandCheckData> getHandCheck() async {
    final HandCheckData handCheckData = HandCheckData(key: "key", sections: [
      SectionsData(sectionId: 0, sectionName: "Ambulance Department"),
      SectionsData(sectionId: 1, sectionName: "employee"),
    ]);
    return handCheckData;
  }
}
