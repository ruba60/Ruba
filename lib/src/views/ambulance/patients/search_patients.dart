import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/view_models/patients/search_patients_provider.dart';
import 'package:hospital_mang2/src/views/ambulance/widgets/ambulance_patient_row.dart';
import 'package:provider/provider.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({super.key});

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  String _patient = "";

  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).searchPatient),
      ),
      body: ChangeNotifierProvider(
          create: (_) => SearchPatientProvider(),
          builder: (context, child) {
            final searchProvider = Provider.of<SearchPatientProvider>(context);
            return Form(
              key: _globalKey,
              child: searchProvider.loading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : searchProvider.exception != null
                      ? Center(
                          child: Text(searchProvider.exception!),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      onSaved: (value) => _patient = value!,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return S.of(context).required;
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          iconColor: AppColors.grey,
                                          filled: true,
                                          fillColor: AppColors.white,
                                          hintText: S.of(context).searchPatient,
                                          suffixIcon: const Icon(Icons.search)),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                      onPressed: () {
                                        _globalKey.currentState!.save();
                                        if(_globalKey.currentState!.validate()){
                                          Provider.of<SearchPatientProvider>(
                                                context,
                                                listen: false)
                                            .getPatients(_patient);
                                        }
                                        
                                      },
                                      child: Text(S.of(context).search))
                                ],
                              ),
                              Expanded(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return AmbulancePatientRow(
                                          patient:
                                              searchProvider.patients[index]);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 8,
                                        ),
                                    itemCount: searchProvider.patients.length),
                              )
                            ],
                          ),
                        ),
            );
          }),
    );
  }
}
