import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/view_models/ambulance/last_patient_provider.dart';
import 'package:hospital_mang2/src/views/ambulance/patients/add_patient.dart';
import 'package:hospital_mang2/src/views/ambulance/patients/search_patients.dart';
import 'package:hospital_mang2/src/views/ambulance/widgets/ambulance_patient_row.dart';
import 'package:provider/provider.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ambulanceDepartment),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchPatient()));
            },
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                  iconColor: AppColors.grey,
                  filled: true,
                  fillColor: AppColors.white,
                  hintText: S.of(context).searchPatient,
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
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
          Container(
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
                                child: Text(lastPatientsProvider.patients.length
                                    .toString()),
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      AmbulancePatientRow(
                                          patient: lastPatientsProvider
                                              .patients[index]),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 4,
                                      ),
                                  itemCount:
                                      lastPatientsProvider.patients.length),
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
          ),
        ],
      ),
    );
  }
}
