import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/ambulance/ambulance_repository.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';

class LastPatientsProvider extends ChangeNotifier {
  List<Patient> _patients = [];
  List<Patient> get patients => _patients;

  String? _exception;
  String? get exception => _exception;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getLastPatient() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await AmbulanceRepository().getLastPatient();
      _patients = data;
    } catch (e) {
      _exception = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
