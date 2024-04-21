import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/department/department_data.dart';

class LoginProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Department? _department;
  Department? get department => _department;

  login(Department selectedDepartment, String password) {
    _loading = true;
    try {
      _department = selectedDepartment;
      _loading = false;
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
