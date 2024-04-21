import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/handcheck/handcheck_data.dart';
import 'package:hospital_mang2/src/models/handcheck/handcheck_repository.dart';

class HandCheckProvider extends ChangeNotifier {
  String? _exception;
  String? get exception => _exception;

  bool _loading = false;
  bool get loading => _loading;

  late HandCheckData _handCheckData;
  HandCheckData get handCheckData => _handCheckData;

  Future<void> getData() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await HandCheckRepository().getHandCheck();
      _handCheckData = data;
      
    } catch (e) {
      _exception = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
