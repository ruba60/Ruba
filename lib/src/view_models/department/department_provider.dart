import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/models/department/department_data.dart';
import 'package:hospital_mang2/src/models/department/department_repository.dart';

class DepartmentProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  List<Department> _departments = [];
  List<Department> get departments => _departments;

  List<Patient> _patients = [];
  List<Patient> get patients => _patients;

  String? _exception;
  String? get exception => _exception;

  int? _selectedId;
  int? get selectedId => _selectedId;

  void changeSelectedId(int newId) {
    _selectedId = newId;
    notifyListeners();
  }

  Future<void> getAllDepartments() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await DepartmentRepository().getDepartments();
      _departments = data;
    } catch (e) {
      _exception = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> getAllPatients() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await DepartmentRepository().getAllPatients();
      _patients = data;
    } catch (e) {
      _exception = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
