import 'package:flutter/material.dart';
import 'package:hospital_mang2/gen/assets.gen.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/handcheck/sections_data.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/view_models/handcheck/handcheck_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  String? _password;
  String? _userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).welcome),
      ),
      body: ChangeNotifierProvider<HandCheckProvider>(
        create: (_) => HandCheckProvider()..getData(),
        builder: (context, child) {
          final handCheckProvider = Provider.of<HandCheckProvider>(context);

          return handCheckProvider.loading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : handCheckProvider.exception != null
                  ? Center(child: Text(handCheckProvider.exception!))
                  : Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Form(
                              key: _globalKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(S.of(context).appTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  DropdownButtonFormField(
                                    value: _userType,
                                    onSaved: (value) => _userType = value,
                                    icon: const Icon(Icons.keyboard_arrow_down,
                                        color: AppColors.lightBlue),
                                    isExpanded: true,
                                    items: handCheckProvider
                                        .handCheckData.sections
                                        .map<DropdownMenuItem<String>>(
                                            (SectionsData e) {
                                      return DropdownMenuItem(
                                        value: e.sectionId.toString(),
                                        child: Text(e.sectionName),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {},
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    obscureText: true,
                                    onSaved: (value) => _password = value,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.length < 4 ||
                                          value.length > 10) {
                                        return S.of(context).passwordChecker;
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 50),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                            40),
                                      ),
                                      onPressed: () {
                                        _globalKey.currentState!.save();

                                        if (_globalKey.currentState!
                                            .validate()) {
                                          _userType == 'Ambulance_Department'
                                              ? print("MainScreen")
                                              : print("Screen");
                                        }
                                      },
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontFamily: 'Segoe UI',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(child: Assets.images.doctors.image()),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
