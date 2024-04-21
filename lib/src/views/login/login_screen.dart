import 'package:flutter/material.dart';
import 'package:hospital_mang2/gen/assets.gen.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/models/department/department_data.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/view_models/handcheck/handcheck_provider.dart';
import 'package:hospital_mang2/src/view_models/login/login_view_model.dart';
import 'package:hospital_mang2/src/views/departments/department_main_screen.dart';
import 'package:provider/provider.dart';

import '../ambulance/ambulance_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  String? _password;
  Department? _userDepartment;

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
          if (!handCheckProvider.loading &&
              handCheckProvider.exception == null) {
            _userDepartment = handCheckProvider.userSectionsData;
          }

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
                                      DropdownButtonFormField<Department>(
                                        value: _userDepartment,
                                        onSaved: (value) =>
                                            _userDepartment = value,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppColors.lightBlue),
                                        isExpanded: true,
                                        items: handCheckProvider
                                            .handCheckData.sections
                                            .map<
                                                    DropdownMenuItem<
                                                        Department>>(
                                                (Department e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(e.departmentName),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {},
                                      ),
                                      const SizedBox(height: 20),
                                      TextFormField(
                                        obscureText: true,
                                        onSaved: (value) => _password = value,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value!.length < 4 ||
                                              value.length > 10) {
                                            return S
                                                .of(context)
                                                .passwordChecker;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: S.of(context).password,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 50),
                                          child: ChangeNotifierProvider<
                                                  LoginProvider>(
                                              create: (_) => LoginProvider(),
                                              builder: (context, child) {
                                                final loginProvider =
                                                    Provider.of<LoginProvider>(
                                                        context,
                                                        listen: true);

                                                if (loginProvider.department !=
                                                    null) {
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    if (loginProvider
                                                            .department!
                                                            .departmentId ==
                                                        0) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const AmbulanceScreen()),
                                                      );
                                                    } else {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DepartmentMainScreen(
                                                                    department:
                                                                        loginProvider
                                                                            .department!)),
                                                      );
                                                    }
                                                  });
                                                }
                                                return loginProvider.loading
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator
                                                                .adaptive())
                                                    : ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize: Size(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.35,
                                                              40),
                                                        ),
                                                        onPressed: () {
                                                          _globalKey
                                                              .currentState!
                                                              .save();

                                                          if (_globalKey
                                                              .currentState!
                                                              .validate()) {
                                                            loginProvider.login(
                                                                _userDepartment!,
                                                                _password!);
                                                          }
                                                        },
                                                        child: Text(
                                                          S.of(context).login,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      );
                                              }))
                                    ]),
                              )),
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
