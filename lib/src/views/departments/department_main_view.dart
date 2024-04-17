import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../theme/app_colors.dart';
import '../ambulance/patients/search_patients.dart';

class DepartmentMain extends StatefulWidget {
  const DepartmentMain({super.key});

  @override
  State<DepartmentMain> createState() => _DepartmentMainState();
}

class _DepartmentMainState extends State<DepartmentMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.account_balance_rounded),
        title: Text("Department 1"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                Text("Search for patient"),
                SizedBox(height: 5.0,),
                Container(
                  width: MediaQuery.of(context).size.width *0.50   ,
                  child: GestureDetector(
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
                ),


              ],),
              ),
              Row(children: [],

              ),

            ],
          ),
        ),
      ),

    );
  }
}
