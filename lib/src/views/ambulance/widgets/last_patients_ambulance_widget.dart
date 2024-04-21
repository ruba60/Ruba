import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/view_models/ambulance/last_patient_provider.dart';
import 'package:hospital_mang2/src/views/ambulance/widgets/ambulance_patient_row.dart';
import 'package:provider/provider.dart';

class LastPatientsAmbulanceWidget extends StatelessWidget {
  const LastPatientsAmbulanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.lightBlue2),
      child: ChangeNotifierProvider(
        create: (_) => LastPatientsProvider()..getLastPatient(),
        builder: (context, child) {
          final lastPatientsProvider =
              Provider.of<LastPatientsProvider>(context);
          return lastPatientsProvider.loading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : lastPatientsProvider.exception != null
                  ? Center(
                      child: Text(lastPatientsProvider.exception!),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 16),
                          child: Text(
                              lastPatientsProvider.patients.length.toString()),
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                AmbulancePatientRow(
                                    patient:
                                        lastPatientsProvider.patients[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 4,
                                ),
                            itemCount: lastPatientsProvider.patients.length),
                        Center(
                          child: ElevatedButton(
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              AppColors.white)),
                              onPressed: () {},
                              child: Text(
                                S.of(context).showAllPatients,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.primary),
                              )),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
