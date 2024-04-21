import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';

class MedicalPatientProfile extends StatelessWidget {
  final Patient patient;
  const MedicalPatientProfile({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).medicalFile)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: Text(S.of(context).addPatientToEmergency)),
            ElevatedButton(
                onPressed: () {},
                child: Text(S.of(context).acceptPatientInRapidTreatment))
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).personalInfo,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${S.of(context).fullName}: ${patient.patientName}"),
                      Text("${S.of(context).age}: 25"),
                      Text("${S.of(context).patientNumber}: ${patient.id}"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${S.of(context).birthDate}: ${patient.patientBirthDate}"),
                      Text("${S.of(context).gender}: ${patient.patientGender}"),
                      Text("${S.of(context).blodeUnit}: A+"),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).medicalHistory,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(patient.patientStatus),
                      Text("${S.of(context).byDoctor}: Jane"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${S.of(context).diagnosisin}: 2023/2/1"),
                      Text("${S.of(context).state}: مزمنة"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).xrayResult,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("تصوير الاشعة"),
                      Text("${S.of(context).byDoctor}: Jane"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${S.of(context).date}: 2023/2/1"),
                      Text("${S.of(context).xrayResult}: ضمن النطاق الطيبعي"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).testResult,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("فحص الدم"),
                      Text("${S.of(context).byDoctor}: Jane"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${S.of(context).diagnosisin}: 2023/2/1"),
                      Text(
                          "${S.of(context).testResult}: ضمن النطاقات الطبيعية"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
