import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/presentation/bloc/password/password_bloc.dart';
import 'package:random_password_generator/features/presentation/bloc/preference/preference_bloc.dart';
import 'package:random_password_generator/features/presentation/components/error_dialog.dart';
import 'package:random_password_generator/features/presentation/components/password_bottom_sheet.dart';
import 'package:random_password_generator/features/presentation/components/password_list.dart';
import 'package:random_password_generator/features/presentation/pages/password_options_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int length = 20;
  int quantity = 1;

  List<bool> toggleValues = [true, true, true, true, true];

  late AppLocalizations? l10n;

  @override
  Widget build(BuildContext context) {
    this.l10n = AppLocalizations.of(context);
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
        body: BlocConsumer<PasswordBloc, PasswordState>(
          listener: (context, state) {
            if (state is PasswordErrorState) {
              ErrorDialog(
                context: context,
                message: state.errorMessage,
              ).show();
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: PasswordList(
                      onPressed: (value) => _copyPassword(password: value),
                      passwords:
                          (state is PasswordSuccessState) ? state.password : [],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showPasswordOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return PasswordBottomSheet(
          child: PasswordOptionsPage(
            okButtonLabel: this.l10n?.ok,
            onOkButtonPressed: (value) {
              BlocProvider.of<PreferenceBloc>(context).add(
                SavePreferences(passwordModel: value),
              );
              setState(() {
                this.length = value.length;
                this.quantity = value.quantity;
                this.toggleValues = [
                  value.lowercaseLetters,
                  value.uppercaseLetters,
                  value.numbers,
                  value.specialCharacters,
                  value.latin1Characters,
                ];
              });
              Navigator.of(context).pop();
              _generateNewPassword(value);
            },
            cancelButtonLabel: this.l10n?.cancel,
            onCancelButtonPressed: () {
              Navigator.of(context).pop();
            },
            quantityPickerLabel: this.l10n?.passwords,
            quantityPickerValue: this.quantity,
            lengthPickerLabel: this.l10n?.length,
            lengthPickerValue: this.length,
            toggleValues: this.toggleValues,
          ),
        );
      },
    );
  }

  void _generateNewPassword(PasswordModel model) {
    BlocProvider.of<PasswordBloc>(context).add(
      GenerateNewPassword(
        passwordModel: model,
      ),
    );
  }

  void _copyPassword({required String password}) {
    Clipboard.setData(
      ClipboardData(text: password),
    );

    _showSnackBar(message: this.l10n?.copyAllSnackBarMessage ?? '');
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
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white),
        ),
      ),
    );
  }
}
