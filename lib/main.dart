import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_password_generator/core/styles/theme_dark.dart';
import 'package:random_password_generator/core/styles/theme_light.dart';
import 'package:random_password_generator/features/password_generator/presentation/user_interfaces/password_ui.dart';

void main() {
  runApp(RandomPasswordGeneratorApp());
}

class RandomPasswordGeneratorApp extends StatelessWidget {
  const RandomPasswordGeneratorApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppLocalizations.of(context)?.appTitle ?? '',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeLight.themeData,
      darkTheme: AppThemeDark.themeData,
      themeMode: ThemeMode.system,
      home: PasswordUI(),
    );
  }
}
