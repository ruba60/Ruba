import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';
import 'package:hospital_mang2/src/view_models/department/department_provider.dart';
import 'package:provider/provider.dart';

class SelectTransictionDepartment extends StatelessWidget {
  const SelectTransictionDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select a department :',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Send',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
      content: ChangeNotifierProvider<DepartmentProvider>(
          create: (_) => DepartmentProvider()..getAllDepartments(),
          builder: (context, child) {
            final departmentProvider = Provider.of<DepartmentProvider>(context);

            return departmentProvider.loading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : departmentProvider.exception != null
                    ? Center(child: Text(departmentProvider.exception!))
                    : SizedBox(
                        height: MediaQuery.sizeOf(context).height / 1.2,
                        width: 300,
                        child: ListView.separated(
                            itemBuilder: (context, index) => SizedBox(
                                  height: 50,
                                  child: ListTile(
                                      onTap: () {
                                        departmentProvider
                                            .changeSelectedId(index);
                                      },
                                      tileColor:
                                          departmentProvider.selectedId == index
                                              ? AppColors.lightBlue
                                              : AppColors.black,
                                      title: Text(departmentProvider
                                          .departments[index].departmentName)),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: departmentProvider.departments.length),
                      );
          }),
    );
  }
}
