import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/presentation/bloc/password_bloc.dart';
import 'package:random_password_generator/features/presentation/bloc/password_events.dart';
import 'package:random_password_generator/features/presentation/bloc/password_state.dart';
import 'package:random_password_generator/features/presentation/components/error_dialog.dart';
import 'package:random_password_generator/features/presentation/components/password_generation_controller.dart';
import 'package:random_password_generator/features/presentation/components/password_list.dart';

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

  List<bool> toggleButtonSelectionItems = [true, true, true, true, true];
  final List<String> toggleButtonsLabels = ['abc', 'ABC', '123', '!@%', 'Âæß'];

  late AppLocalizations? l10n;

  @override
  void initState() {
    super.initState();
    generateNewPassword();
  }

  @override
  Widget build(BuildContext context) {
    this.l10n = AppLocalizations.of(context);
    final currentBrightness = MediaQuery.of(context).platformBrightness;
    final systemColor = Theme.of(context).primaryColorDark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: systemColor,
        systemNavigationBarColor: systemColor,
        systemNavigationBarDividerColor: systemColor,
        statusBarBrightness: currentBrightness,
        statusBarIconBrightness: currentBrightness,
        systemNavigationBarIconBrightness: currentBrightness,
      ),
      child: Scaffold(
        body: BlocConsumer<PasswordBloc, PasswordState>(
          listener: (context, state) {
            if (state.pageState.hasError) {
              ErrorDialog(
                context: context,
                message: state.errorMessage ?? '',
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
                      passwords: state.password,
                    ),
                  ),
                  PasswordGenerationController(
                    refreshButtonLabel: this.l10n?.refresh,
                    onRefreshButtonPressed: () => generateNewPassword(),
                    copyAllButtonLabel: this.l10n?.copyAll,
                    onCopyAllButtonPressed: () => _copyAllPasswords(
                      passwords: state.password,
                    ),
                    quantityPickerLabel: this.l10n?.passwords,
                    quantityPickerValue: this.quantity,
                    quantityPickerChanged: (quantity) => setState(() {
                      this.quantity = quantity;
                    }),
                    lengthPickerLabel: this.l10n?.length,
                    lengthPickerValue: this.length,
                    lengthPickerChanged: (length) => setState(
                      () => this.length = length,
                    ),
                    onToggleButtonPressed: (index) =>
                        _canPressCharacterToggle(index)
                            ? setState(() {
                                this.toggleButtonSelectionItems[index] =
                                    !this.toggleButtonSelectionItems[index];
                                generateNewPassword();
                              })
                            : null,
                    onToggleButtonChildren: this.toggleButtonsLabels,
                    onToggleButtonSelectedItems:
                        this.toggleButtonSelectionItems,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void generateNewPassword() {
    BlocProvider.of<PasswordBloc>(context).add(
      GenerateNewPassword(
        passwordModel: PasswordModel(
          length: this.length,
          quantity: this.quantity,
          lowercaseLetters: this.toggleButtonSelectionItems[0],
          uppercaseLetters: this.toggleButtonSelectionItems[1],
          numbers: this.toggleButtonSelectionItems[2],
          specialCharacters: this.toggleButtonSelectionItems[3],
          latin1Characters: this.toggleButtonSelectionItems[4],
        ),
      ),
    );
  }

  bool _canPressCharacterToggle(int index) => (this
              .toggleButtonSelectionItems
              .where(
                (element) => element,
              )
              .length !=
          1 ||
      index !=
          this.toggleButtonSelectionItems.lastIndexWhere(
                (element) => element,
              ));

  void _copyAllPasswords({required List<String> passwords}) {
    Clipboard.setData(
      ClipboardData(text: passwords.join(' ; ')),
    );

    _showSnackBar(message: this.l10n?.copyAllSnackBarMessage ?? '');
  }

  void _showSnackBar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
