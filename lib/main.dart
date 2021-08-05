import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/core/styles/theme_dark.dart';
import 'package:random_password_generator/core/styles/theme_light.dart';
import 'package:random_password_generator/features/data/repositories/password_repository_impl.dart';
import 'package:random_password_generator/features/data/services/password_service_impl.dart';
import 'package:random_password_generator/features/presentation/bloc/password_bloc.dart';
import 'package:random_password_generator/features/presentation/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(RandomPasswordGeneratorApp());
}

class RandomPasswordGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalizations.of(context)?.appTitle ?? '',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeLight.themeData,
      darkTheme: AppThemeDark.themeData,
      themeMode: ThemeMode.system,
      home: BlocProvider<PasswordBloc>(
        create: (context) => PasswordBloc(
          repository: PasswordRepositoryImpl(
            service: PasswordServiceImpl(),
          ),
        ),
        child: HomePage(),
      ),
    );
  }
}
