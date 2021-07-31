import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/core/styles/colors_theme_dark.dart';
import 'package:random_password_generator/core/styles/colors_theme_light.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/presentation/bloc/password_bloc.dart';
import 'package:random_password_generator/features/presentation/bloc/password_events.dart';
import 'package:random_password_generator/features/presentation/bloc/password_state.dart';
import 'package:random_password_generator/features/presentation/components/character_choice_toggle_button.dart';
import 'package:random_password_generator/features/presentation/components/error_dialog.dart';
import 'package:random_password_generator/features/presentation/components/password_legth_picker.dart';
import 'package:random_password_generator/features/presentation/components/password_list.dart';
import 'package:random_password_generator/features/presentation/components/password_quantity_picker.dart';
import 'package:random_password_generator/features/presentation/components/rounded_button.dart';

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

  @override
  void initState() {
    super.initState();
    generateNewPassword();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: _getThemeColor(),
          systemNavigationBarColor: _getThemeColor(),
          systemNavigationBarDividerColor: _getThemeColor(),
        ),
        child: Scaffold(
          body: BlocConsumer<PasswordBloc, PasswordState>(
            listener: (context, state) {
              if (state.pageState == PageState.error) {
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
                        items: state.password,
                        onSelect: (value) => _copyPassword(password: value),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 5,
                                child: RoundedButton(
                                  onPressed: () => generateNewPassword(),
                                  label: 'REFRESH',
                                  icon: Icons.refresh,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 5,
                                child: RoundedButton(
                                  onPressed: () => _copyAllPasswords(
                                    passwords: state.password,
                                  ),
                                  icon: Icons.copy,
                                  label: 'COPY ALL',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: PasswordQuantityPicker(
                                  quantity: this.quantity,
                                  onChanged: (quantity) => setState(() {
                                    this.quantity = quantity;
                                  }),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: PasswordLengthPicker(
                                  length: this.length,
                                  onChanged: (length) => setState(
                                    () => this.length = length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CharacterChoiceToggleButton(
                            onPressed: (index) => _canPressCharacterToggle(index)
                                ? setState(() {
                                    this.toggleButtonSelectionItems[index] =
                                        !this.toggleButtonSelectionItems[index];
                                    generateNewPassword();
                                  })
                                : null,
                            isSelected: this.toggleButtonSelectionItems,
                            children: this.toggleButtonsLabels,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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

  Color _getThemeColor() {
    final bool isDarkModeOn =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isDarkModeOn
        ? ColorsThemeDark.primaryColor
        : ColorsThemeLight.primaryLightColor;
  }

  bool _canPressCharacterToggle(int index) => (this
              .toggleButtonSelectionItems
              .where((element) => element)
              .length !=
          1 ||
      index !=
          this.toggleButtonSelectionItems.lastIndexWhere((element) => element));

  void _copyAllPasswords({required List<String> passwords}) {
    Clipboard.setData(
      ClipboardData(text: passwords.join(' ; ')),
    );

    _showSnackBar(message: 'All password\'s copied to clipboard!');
  }

  void _showSnackBar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  void _copyPassword({required String password}) {
    Clipboard.setData(
      ClipboardData(text: password),
    );

    _showSnackBar(message: 'Password copied to clipboard!');
  }
}
