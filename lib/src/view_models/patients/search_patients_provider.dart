import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/ambulance/ambulance_repository.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';

class SearchPatientProvider extends ChangeNotifier {
  List<Patient> _patients = [];
  List<Patient> get patients => _patients;

  bool _loading = false;
  bool get loading => _loading;

  String? _exception;
  String? get exception => _exception;

  Future<void> getPatients(String patientName) async {
    _loading = true;

    try {
      final data = await AmbulanceRepository().searchPatients(patientName);
      _patients = data;
    } catch (e) {
      _exception = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
