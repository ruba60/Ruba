import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hospital_mang2/generated/l10n.dart';
import 'package:hospital_mang2/src/views/ambulance/ambulance_screen.dart';
import 'package:hospital_mang2/src/views/ambulance/patients/add_patient.dart';
import 'package:hospital_mang2/src/views/departments/department_main_view.dart';
import 'package:hospital_mang2/src/views/login/login_screen.dart';
import 'package:hospital_mang2/src/localization/current_language.dart';
import 'package:hospital_mang2/src/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentLanguageProvider>(
        create: (_) => CurrentLanguageProvider()..initializeLanguage(),
        builder: (context, child) {
          final currentLanguageProvider =
              Provider.of<CurrentLanguageProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lighTheme(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(currentLanguageProvider.currentLanguage),
            home: const DepartmentMain(),
          );
        });
  }
}
