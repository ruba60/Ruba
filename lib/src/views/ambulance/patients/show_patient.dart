import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/views/ambulance/patients/add_patient.dart';

class ShowPatientScreen extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  final Patient patient;

   ShowPatientScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).patientDetails),
      ),
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.lightBlue2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(S.of(context).medicalFile,
                          style: Theme.of(context).textTheme.titleLarge),
                      Expanded(
                          child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          Text(
                            S.of(context).fullName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(patient.patientName),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            S.of(context).patientStatusDescription,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(patient.patientStatus),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            S.of(context).suggestedTreatment,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(patient.suggestedTreatment),
                        ],
                      )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPatient(
                                          patient: patient,
                                        )));
                          },
                          child: Text(
                            S.of(context).edit,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.white),
                          )),
                    ],
                  ),
                ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [


                //transfer to department
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        List<String> selectedItems = []; //

                        return StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            return AlertDialog(
                              title: Text('Select a department :'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  CheckboxListTile(
                                    title: Text('Item 1'),
                                    value: selectedItems.contains('Item 1'),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedItems.add('Item 1');
                                        } else {
                                          selectedItems.remove('Item 1');
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Item 2'),
                                    value: selectedItems.contains('Item 2'),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedItems.add('Item 2');
                                        } else {
                                          selectedItems.remove('Item 2');
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Item 3'),
                                    value: selectedItems.contains('Item 3'),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedItems.add('Item 3');
                                        } else {
                                          selectedItems.remove('Item 3');
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {

                                    print('Selected items: $selectedItems');
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Send'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    S.of(context).transferTo,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),


                const SizedBox(height: 16),


                //request x_ray
                ElevatedButton (
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Enter your request'),
                          content: TextField(
                            controller: textController,
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Send'),
                              onPressed: () {
                                String request = textController.text;

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    S.of(context).requestXray,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),


                const SizedBox(height: 16),

                //requestEmergencyTests
                ElevatedButton (
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Enter your request'),
                          content: TextField(
                            controller: textController2,
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Send'),
                              onPressed: () {
                                String request = textController2.text;

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    S.of(context).requestEmergencyTests,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),

                const SizedBox(height: 16),



                //viewFileAttachments
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).viewFileAttachments,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.white),
                    )),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
