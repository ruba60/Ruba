import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';

class AddPatient extends StatefulWidget {
  final Patient? patient;
  const AddPatient({super.key, this.patient});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  String patientName = "";
  String patientAddress = "";
  DateTime patientDate = DateTime.now();
  String patientMothersName = "";
  String patientBirthPlace = "";
  String patientGender = "Man";
  String patientState = "";
  String? moreDetails = "";

  @override
  void initState() {
    patientDate = widget.patient != null
        ? DateTime.parse(widget.patient!.patientBirthDate)
        : DateTime.now();
    patientGender =
        widget.patient != null ? widget.patient!.patientGender : "Man";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.patient == null
            ? S.of(context).addPatient
            : S.of(context).editPatient),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    // Full Name
                    Expanded(
                      child: TextFormField(
                          initialValue: widget.patient?.patientName,
                          onSaved: (value) => patientName = value!,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null && value!.isEmpty) {
                              return S.of(context).required;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: S.of(context).fullName,
                          )),
                    ),

                    SizedBox(
                      width: 10,
                    ),
                    // Address
                    Expanded(
                      child: TextFormField(
                        initialValue: widget.patient?.patientAddress,
                        onSaved: (value) => patientAddress = value!,
                        keyboardType: TextInputType.streetAddress,
                        validator: (value) {
                          if (value == null && value!.isEmpty) {
                            return S.of(context).required;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: S.of(context).address,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),



                // Birth date
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: patientDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null && picked != patientDate) {
                      setState(() {
                        patientDate = picked;
                      });
                    }
                  },
                  child: TextFormField(
                    enabled: false,
                    validator: (value) {
                      if (value == null && value!.isEmpty) {
                        return S.of(context).required;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText:
                          "${patientDate.year}-${patientDate.month}-${patientDate.day}",
                      disabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: AppColors.secondary)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),


                const SizedBox(height: 8),

                // Gender
                DropdownButtonFormField(
                  value: patientGender,
                  onSaved: (value) => patientGender = value!,
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: AppColors.secondary),
                  isExpanded: true,
                  items: ["Man", "Woman"]
                      .map<DropdownMenuItem<String>>((String e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (newValue) {},
                  validator: (value) {
                    if (value == null) {
                      return S.of(context).required;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: S.of(context).gender,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                TextFormField(
                  initialValue: widget.patient?.patientStatus,
                  onSaved: (value) => patientState = value!,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return S.of(context).required;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: S.of(context).description,
                  ),
                ),
                const SizedBox(height: 8),

                // Treatment
                TextFormField(
                  initialValue: widget.patient?.suggestedTreatment,
                  onSaved: (value) => moreDetails = value!,
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: S.of(context).treatment,
                      counterText: S.of(context).optional),
                ),
                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 90.0 ),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).saveDate,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.white),
                      )),
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 90.0 ),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).scanDate,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
