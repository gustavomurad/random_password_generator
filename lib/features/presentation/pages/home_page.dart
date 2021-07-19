import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_password_generator/features/domain/models/password_model.dart';
import 'package:random_password_generator/features/presentation/bloc/password_bloc.dart';
import 'package:random_password_generator/features/presentation/bloc/password_events.dart';
import 'package:random_password_generator/features/presentation/bloc/password_state.dart';
import 'package:random_password_generator/features/presentation/widgets/character_choice_chip.dart';
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

  // bool lowercaseLetters = true;
  // bool uppercaseLetters = true;
  // bool numbers = true;
  // bool specialCharacters = true;
  // bool latin1Characters = true;

  List<bool> toggleButtonSelectionItems = [true, true, true, true, true];
  List<String> toggleButtonsLabels = ['abc', 'ABC', '123', '!@%', 'Âæß'];

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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 5),
                content: Text(
                  state.errorMessage ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            );

            setState(() {
              // this.lowercaseLetters = true;
              // this.uppercaseLetters = true;
              // this.numbers = true;
              // this.specialCharacters = true;
              // this.latin1Characters = true;
            });

            generateNewPassword();
          }
        },
        builder: (context, state) {
          return Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
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
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 5,
                              child: TextButton(
                                onPressed: () =>
                                    setState(() => generateNewPassword()),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                onPressed: () => Clipboard.setData(
                                  ClipboardData(text: state.password),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     CharacterChoiceChip(
                        //       label: 'abc',
                        //       selectedChip: this.lowercaseLetters,
                        //       onSelected: (value) => setState(() {
                        //         this.lowercaseLetters = value;
                        //         generateNewPassword();
                        //       }),
                        //     ),
                        //     CharacterChoiceChip(
                        //       label: 'ABC',
                        //       selectedChip: this.uppercaseLetters,
                        //       onSelected: (value) => setState(() {
                        //         this.uppercaseLetters = value;
                        //         generateNewPassword();
                        //       }),
                        //     ),
                        //     CharacterChoiceChip(
                        //       label: '123',
                        //       selectedChip: this.numbers,
                        //       onSelected: (value) => setState(() {
                        //         this.numbers = value;
                        //         generateNewPassword();
                        //       }),
                        //     ),
                        //     CharacterChoiceChip(
                        //       label: '!@%',
                        //       selectedChip: this.specialCharacters,
                        //       onSelected: (value) => setState(() {
                        //         this.specialCharacters = value;
                        //         generateNewPassword();
                        //       }),
                        //     ),
                        //     CharacterChoiceChip(
                        //       label: 'Âæß',
                        //       selectedChip: this.latin1Characters,
                        //       onSelected: (value) => setState(() {
                        //         this.latin1Characters = value;
                        //         generateNewPassword();
                        //       }),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
