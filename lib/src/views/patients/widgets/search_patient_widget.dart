import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/views/patients/search_patients.dart';

class SearchPatientWidget extends StatelessWidget {
  const SearchPatientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          );
  }
}