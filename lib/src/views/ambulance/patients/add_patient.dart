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
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Full Name
                TextFormField(
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
                const SizedBox(height: 8),

                // Address
                TextFormField(
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

                // mother's name
                TextFormField(
                  initialValue: widget.patient?.patientMothersDay,
                  onSaved: (value) => patientMothersName = value!,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return S.of(context).required;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: S.of(context).mothersname,
                  ),
                ),
                const SizedBox(height: 8),

                // place
                TextFormField(
                  initialValue: widget.patient?.patientBirthPlace,
                  onSaved: (value) => patientBirthPlace = value!,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return S.of(context).required;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: S.of(context).birthPlace,
                  ),
                ),
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

                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).saveDate,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
