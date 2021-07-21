import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/presentation/bloc/password_bloc.dart';
import 'package:random_password_generator/features/presentation/bloc/password_events.dart';
import 'package:random_password_generator/features/presentation/bloc/password_state.dart';
import 'package:random_password_generator/features/presentation/widgets/character_choice_toggle_button.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int length = 20;
  bool showBanner = false;
  List<bool> toggleButtonSelectionItems = [true, true, true, true, true];
  final List<String> toggleButtonsLabels = ['abc', 'ABC', '123', '!@%', 'Âæß'];

  @override
  void initState() {
    super.initState();
    generateNewPassword();
  }

  void generateNewPassword() {
    BlocProvider.of<PasswordBloc>(context).add(
      GenerateNewPassword(
        passwordModel: PasswordModel(
          length: this.length,
          lowercaseLetters: this.toggleButtonSelectionItems[0],
          uppercaseLetters: this.toggleButtonSelectionItems[1],
          numbers: this.toggleButtonSelectionItems[2],
          specialCharacters: this.toggleButtonSelectionItems[3],
          latin1Characters: this.toggleButtonSelectionItems[4],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Password Generator'),
      ),
      body: BlocConsumer<PasswordBloc, PasswordState>(
        listener: (context, state) {
          if (state.pageState == PageState.error) {
            setState(() {
              this.showBanner = true;
            });
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Visibility(
                  visible: this.showBanner,
                  child: MaterialBanner(
                    padding: EdgeInsets.all(20),
                    content: Text(
                      state.errorMessage ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    leading: Icon(Icons.error),
                    backgroundColor: Color(0xFFE0E0E0),
                    actions: <Widget>[
                      TextButton(
                        child: Text('DISMISS'),
                        onPressed: () => setState(() {
                          this.showBanner = false;
                        }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: SelectableText(
                                '${state.password}',
                                style: Theme.of(context).textTheme.headline4,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 5,
                                      child: TextButton(
                                        onPressed: () => setState(
                                            () => generateNewPassword()),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.refresh),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('REFRESH')
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      flex: 5,
                                      child: TextButton(
                                        onPressed: () {
                                          Clipboard.setData(
                                            ClipboardData(text: state.password),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: Duration(seconds: 1),
                                              content: Text(
                                                'Password copied to clipboard!',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.copy),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('COPY')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Password length: ${this.length}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Slider(
                                  value: this.length.toDouble(),
                                  min: 1,
                                  max: 100,
                                  onChanged: (value) {
                                    setState(() {
                                      this.length = value.toInt();
                                      generateNewPassword();
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CharacterChoiceToggleButton(
                                  onPressed: (index) => setState(() {
                                    this.toggleButtonSelectionItems[index] =
                                        !this.toggleButtonSelectionItems[index];
                                    generateNewPassword();
                                  }),
                                  isSelected: this.toggleButtonSelectionItems,
                                  children: this.toggleButtonsLabels,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
