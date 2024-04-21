import 'package:flutter/material.dart';
import 'package:hospital_mang2/generated/l10n.dart';

class RequestDialog extends StatefulWidget {
  final String typeOfRequest;
  const RequestDialog({super.key, required this.typeOfRequest});

  @override
  State<RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  String? xrayRequest;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: AlertDialog(
        title: const Text('Enter your request'),
        content: TextFormField(
          onSaved: (value) => xrayRequest = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).required;
            }
            return null;
          },
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text(
              'Send',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            onPressed: () {
              _globalKey.currentState!.save();
              if (_globalKey.currentState!.validate()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
