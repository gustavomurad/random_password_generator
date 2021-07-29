import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/core/styles/colors_theme_dark.dart';
import 'package:random_password_generator/core/styles/colors_theme_light.dart';
import 'package:random_password_generator/core/styles/theme_dark.dart';
import 'package:random_password_generator/core/styles/theme_light.dart';
import 'package:random_password_generator/features/presentation/bloc/password_bloc.dart';
import 'package:random_password_generator/features/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final brightness = SchedulerBinding.instance?.window.platformBrightness;
  final bool isDarkModeOn = brightness == Brightness.dark;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: isDarkModeOn
        ? ColorsThemeDark.primaryColor
        : ColorsThemeLight.primaryLightColor,
    systemNavigationBarColor: isDarkModeOn
        ? ColorsThemeDark.primaryColor
        : ColorsThemeLight.primaryLightColor,
    systemNavigationBarDividerColor: isDarkModeOn
        ? ColorsThemeDark.primaryColor
        : ColorsThemeLight.primaryLightColor,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Password Generator',
      theme: AppThemeLight.get(),
      darkTheme: AppThemeDark.get(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: BlocProvider<PasswordBloc>(
        create: (context) => PasswordBloc(),
        child: HomePage(),
      ),
    );
  }
}
