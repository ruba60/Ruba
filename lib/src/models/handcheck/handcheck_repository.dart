import 'package:hospital_mang2/src/models/department/department_data.dart';
import 'package:hospital_mang2/src/models/handcheck/handcheck_data.dart';

class HandCheckRepository {
  Future<HandCheckData> getHandCheck() async {
    final HandCheckData handCheckData = HandCheckData(key: "key", sections: [
      Department(departmentId: 0, departmentName: "Ambulance Department"),
      Department(departmentId: 1, departmentName: "employee"),
    ]);
    return handCheckData;
  }
}
