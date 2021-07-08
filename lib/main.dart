import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/core/styles/theme.dart';
import 'package:random_password_generator/features/presentation/bloc/password_bloc.dart';
import 'package:random_password_generator/features/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Password Generator',
      theme: AppTheme.getTheme,
      home: BlocProvider<PasswordBloc>(
        create: (context) => PasswordBloc(),
        child: HomePage(),
      ),
    );
  }
}
