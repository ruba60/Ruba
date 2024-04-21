import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';

class DepartmentPatientDetailsWidget extends StatefulWidget {
  final Patient patient;
  const DepartmentPatientDetailsWidget({super.key, required this.patient});

  @override
  State<DepartmentPatientDetailsWidget> createState() =>
      _DepartmentPatientDetailsWidgetState();
}

class _DepartmentPatientDetailsWidgetState
    extends State<DepartmentPatientDetailsWidget> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          children: [
            IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
            IconButton(icon: const Icon(Icons.visibility), onPressed: () {}),
          ],
        )),
        Expanded(child: Text(widget.patient.patientBirthDate)),
        Expanded(child: Text(widget.patient.patientName)),
        Expanded(
            child: Row(
          children: [
            Text(widget.patient.id.toString()),
            const SizedBox(width: 8),
            Checkbox(
              onChanged: (value) {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              value: isVisible,
            )
          ],
        )),
      ],
    );
  }
}
