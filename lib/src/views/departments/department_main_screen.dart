import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/department/department_data.dart';
import 'package:hospital_mang2/src/views/departments/all_patient_screen.dart';
import 'package:hospital_mang2/src/views/departments/patients_details_list.dart';
import 'package:hospital_mang2/src/views/departments/widgets/last_patients_department_widget.dart';
import 'package:hospital_mang2/src/views/patients/widgets/search_patient_widget.dart';

class DepartmentMainScreen extends StatefulWidget {
  final Department department;
  const DepartmentMainScreen({super.key, required this.department});

  @override
  State<DepartmentMainScreen> createState() => _DepartmentMainScreenState();
}

class _DepartmentMainScreenState extends State<DepartmentMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_balance_rounded),
        title: Text(widget.department.departmentName),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllPatientScreen()));
                },
                child: Text(
                  S.of(context).patientsList,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  S.of(context).close,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text("Search for patient"),
            const SizedBox(
              height: 8.0,
            ),
            const SearchPatientWidget(),
            const LastPatientsDepartmentWidget(),
            const SizedBox(height: 8.0),
            Text(S.of(context).patientDetailsAndAdmission),
            const PateintDetailsList(),
            Text(S.of(context).testsManagement),
            const PateintDetailsList(),
          ],
        ),
      ),
    );
  }
}
