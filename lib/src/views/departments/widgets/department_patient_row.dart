import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/views/patients/medical_patient_profile.dart';

class DepartmentPatientRow extends StatelessWidget {
  final Patient patient;
  final bool isAccept;
  const DepartmentPatientRow(
      {super.key, required this.patient, required this.isAccept});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        child: ListTile(
            title: Text(
              patient.patientName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MedicalPatientProfile(patient: patient)));
                    },
                    child: Text(
                      S.of(context).showDetails,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    )),
                if (!isAccept) ...[
                  const SizedBox(width: 4),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).acceptPatient,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      )),
                  const SizedBox(width: 4),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).reject,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      )),
                ],
              ],
            )),
      ),
    );
  }
}
