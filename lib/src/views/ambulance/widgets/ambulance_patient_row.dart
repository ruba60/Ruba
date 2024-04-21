import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/views/patients/show_patient.dart';

class AmbulancePatientRow extends StatelessWidget {
  final Patient patient;
  const AmbulancePatientRow({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowPatientScreen(patient: patient)));
        },
        leading: CachedNetworkImage(
          imageUrl: patient.patientImage,
          width: 20,
          height: 20,
        ),
        title: Row(
          children: [
            Text(
              patient.patientName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            Text(patient.patientStatus,
                style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
        trailing: Text(
          patient.patientDepartment,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
