import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/models/department/department_repository.dart';

class DepartmentDetailsProvider extends ChangeNotifier {
  bool _loadingListOfPatientDetails = false;
  bool get loadingListOfPatientDetails => _loadingListOfPatientDetails;

  List<Patient> _listOfPatientsDetails = [];
  List<Patient> get listOfPatientsDetails => _listOfPatientsDetails;

  String? _exception;
  String? get exception => _exception;

  Future<void> getListOfPatientDetails() async {
    _loadingListOfPatientDetails = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await DepartmentRepository().getListOfPatientDetails();
      _listOfPatientsDetails = data;
    } catch (e) {
      _exception = e.toString();
    }
    _loadingListOfPatientDetails = false;
    notifyListeners();
  }
}
