import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/views/patients/add_patient.dart';
import 'package:hospital_mang2/src/views/departments/widgets/select_transiction_department.dart';
import 'package:hospital_mang2/src/views/requests/widgets/request_dialog.dart';

class ShowPatientScreen extends StatelessWidget {
  final Patient patient;

  const ShowPatientScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).patientDetails)),
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.lightBlue2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(S.of(context).medicalFile,
                          style: Theme.of(context).textTheme.titleLarge),
                      Expanded(
                          child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          Text(
                            S.of(context).fullName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(patient.patientName),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            S.of(context).patientStatusDescription,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(patient.patientStatus),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            S.of(context).suggestedTreatment,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(patient.suggestedTreatment),
                        ],
                      )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPatient(
                                          patient: patient,
                                        )));
                          },
                          child: Text(
                            S.of(context).edit,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.white),
                          )),
                    ],
                  ),
                ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // transfer to department
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const SelectTransictionDepartment());
                  },
                  child: Text(
                    S.of(context).transferTo,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),

                const SizedBox(height: 16),

                // request x_ray
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const RequestDialog(
                              typeOfRequest: "xray",
                            ));
                  },
                  child: Text(
                    S.of(context).requestXray,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),

                const SizedBox(height: 16),

                // requestEmergencyTests
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const RequestDialog(
                            typeOfRequest: "emergency tests"));
                  },
                  child: Text(
                    S.of(context).requestEmergencyTests,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),

                const SizedBox(height: 16),

                // viewFileAttachments
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).viewFileAttachments,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.white),
                    )),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
