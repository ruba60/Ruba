import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/view_models/department/department_details_provider.dart';
import 'package:hospital_mang2/src/views/departments/widgets/patient_card.dart';
import 'package:provider/provider.dart';

class PateintDetailsList extends StatelessWidget {
  const PateintDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DepartmentDetailsProvider()..getListOfPatientDetails(),
        builder: (context, child) {
          final departmentDetailsProvider =
              Provider.of<DepartmentDetailsProvider>(context);
          return departmentDetailsProvider.loadingListOfPatientDetails
              ? const Center(child: CircularProgressIndicator.adaptive())
              : departmentDetailsProvider.exception != null
                  ? Center(
                      child: Text(departmentDetailsProvider.exception!),
                    )
                  : SizedBox(
                      height: 220,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => PatientCard(
                              patient: departmentDetailsProvider
                                  .listOfPatientsDetails[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: departmentDetailsProvider
                              .listOfPatientsDetails.length),
                    );
        });
  }
}
