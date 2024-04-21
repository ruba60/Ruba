import 'package:flutter/material.dart';

import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/view_models/department/department_provider.dart';
import 'package:hospital_mang2/src/views/departments/widgets/department_patient_details_widget.dart';
import 'package:provider/provider.dart';

class AllPatientScreen extends StatelessWidget {
  const AllPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).patientsList),
        ),
        body: ChangeNotifierProvider(
            create: (_) => DepartmentProvider()..getAllPatients(),
            builder: (context, child) {
              final departmentDetailsProvider =
                  Provider.of<DepartmentProvider>(context);
              return departmentDetailsProvider.loading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : departmentDetailsProvider.exception != null
                      ? Center(
                          child: Text(departmentDetailsProvider.exception!),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                    width: 200,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.secondary)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.of(context).department,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  color: AppColors.secondary),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.arrow_drop_down_circle,
                                          color: AppColors.secondary,
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    S.of(context).actions,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    "${S.of(context).date}/${S.of(context).time}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    S.of(context).fullName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    S.of(context).patientNumber,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 220,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        DepartmentPatientDetailsWidget(
                                            patient: departmentDetailsProvider
                                                .patients[index]),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 8),
                                    itemCount: departmentDetailsProvider
                                        .patients.length),
                              ),
                            ],
                          ),
                        );
            }));
  }
}
