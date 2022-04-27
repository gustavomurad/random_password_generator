import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_password_generator/core/dependency_injection/cubit_dependency_injection.dart';
import 'package:random_password_generator/features/password_generator/presentation/business_components/password_generator_cubit.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/error_dialog.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_bottom_sheet.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_list.dart';
import 'package:random_password_generator/features/password_generator/presentation/user_interfaces/preferences_ui.dart';

class PasswordUI extends StatefulWidget {
  PasswordUI({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordUIState createState() => _PasswordUIState();
}

class _PasswordUIState extends State<PasswordUI> {
  final PasswordGeneratorCubit _cubit = CubitFactory.passwordGeneratorCubit;
  var _passwords = <String>[];
  late AppLocalizations? _l10n;

  @override
  Widget build(BuildContext context) {
    _l10n = AppLocalizations.of(context);
    final currentBrightness = MediaQuery.of(context).platformBrightness;
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.primaryColorDark,
        systemNavigationBarColor: theme.primaryColorDark,
        systemNavigationBarDividerColor: theme.primaryColorDark,
        statusBarBrightness: currentBrightness,
        statusBarIconBrightness: currentBrightness,
        systemNavigationBarIconBrightness: currentBrightness,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () => _showPasswordOptions(),
          child: Icon(Icons.add),
        ),
        body: BlocListener<PasswordGeneratorCubit, PasswordGeneratorState>(
          bloc: _cubit,
          listener: passwordListener,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: PasswordList(
                    onPressed: (value) => _copyPassword(password: value),
                    passwords: _passwords,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void passwordListener(
    BuildContext context,
    PasswordGeneratorState state,
  ) {
    if (state is PasswordGeneratorErrorState) {
      showDialog<void>(
        useSafeArea: true,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => ErrorDialog(message: state.message),
      );
    } else if (state is PasswordGeneratorSuccessState) {
      setState(() {
        _passwords = state.passwords ?? [];
      });
    }
  }

  void _showPasswordOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return PasswordBottomSheet(
          child: PreferencesUI(
            onOkButtonPressed: (preferenceModel) {
              setState(() {
                Navigator.of(context).pop();
                _cubit.savePreferences(preferenceModel: preferenceModel);
                _cubit.generatePassword(preferenceModel: preferenceModel);
              });
            },
            onCancelButtonPressed: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  void _copyPassword({required String password}) {
    Clipboard.setData(
      ClipboardData(text: password),
    );

    _showSnackBar(message: _l10n?.copyAllSnackBarMessage ?? '');
  }

  void _showSnackBar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
