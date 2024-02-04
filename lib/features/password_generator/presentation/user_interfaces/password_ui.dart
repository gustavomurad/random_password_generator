import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_password_generator/core/factories/cubit_factory.dart';
import 'package:random_password_generator/features/password_generator/presentation/business_components/password_generator_cubit.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/error_dialog.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_bottom_sheet.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_list.dart';
import 'package:random_password_generator/features/password_generator/presentation/user_interfaces/preferences_ui.dart';

class PasswordUI extends StatefulWidget {
  const PasswordUI({
    super.key,
  });

  @override
  State<PasswordUI> createState() => _PasswordUIState();
}

class _PasswordUIState extends State<PasswordUI> {
  late AppLocalizations? _l10n;
  final _cubit = CubitFactory.passwordGeneratorCubit;

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
          onPressed: () => _showPasswordOptions(_cubit),
          child: const Icon(Icons.add),
        ),
        body: BlocConsumer<PasswordGeneratorCubit, PasswordGeneratorState>(
          bloc: _cubit,
          listener: (_, currentState) {
            if (currentState.cubitState.isError) {
              showDialog<void>(
                useSafeArea: true,
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => ErrorDialog(message: currentState.errorMessage ?? ''),
              );
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
                      passwords: state.passwords,
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

  void _showPasswordOptions(PasswordGeneratorCubit cubit) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return PasswordBottomSheet(
          child: PreferencesUI(cubit: cubit),
        );
      },
    );
  }

  void _copyPassword({required String password}) {
    Clipboard.setData(ClipboardData(text: password));

    _showSnackBar(message: _l10n?.copyAllSnackBarMessage ?? '');
  }

  void _showSnackBar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: const Key("SnackBarMessage"),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
