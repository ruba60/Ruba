import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/view_models/ambulance/last_patient_provider.dart';
import 'package:hospital_mang2/src/views/departments/widgets/department_patient_row.dart';
import 'package:provider/provider.dart';

class LastPatientsDepartmentWidget extends StatelessWidget {
  const LastPatientsDepartmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LastPatientsProvider()..getLastPatient(),
      builder: (context, child) {
        final lastPatientsProvider = Provider.of<LastPatientsProvider>(context);
        return lastPatientsProvider.loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : lastPatientsProvider.exception != null
                ? Center(
                    child: Text(lastPatientsProvider.exception!),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => DepartmentPatientRow(
                        patient: lastPatientsProvider.patients[index]),
                    itemCount: lastPatientsProvider.patients.length);
      },
    );
  }
}
