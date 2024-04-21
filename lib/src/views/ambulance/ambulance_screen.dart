import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/views/patients/add_patient.dart';
import 'package:hospital_mang2/src/views/ambulance/widgets/last_patients_ambulance_widget.dart';
import 'package:hospital_mang2/src/views/patients/widgets/search_patient_widget.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).ambulanceDepartment)),
      body: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          const SearchPatientWidget(isAmbulance: true),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).ambulanceDepartmentTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPatient()));
                    },
                    child: Text(
                      S.of(context).addPatient,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.white),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(S.of(context).lastPatients),
          const SizedBox(height: 8),
          const LastPatientsAmbulanceWidget(),
        ],
      ),
    );
  }
}
