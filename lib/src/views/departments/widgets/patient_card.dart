import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Card(
        color: AppColors.lightBlue2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.patientName,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text("${S.of(context).gender}: ${patient.patientGender}"),
                  Text(
                      "${S.of(context).historyMedical}: ${patient.patientStatus}"),
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).acceptPatient,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
