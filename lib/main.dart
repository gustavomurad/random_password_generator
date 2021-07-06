import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_password_generator/password.dart';
import 'package:random_password_generator/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Password Generator',
      theme: AppTheme.theme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int length = 20;
  bool lowercaseLetters = true;
  bool uppercaseLetters = true;
  bool numbers = true;
  bool specialCharacters = true;
  bool latin1Characters = true;

  String password = '';

  @override
  void initState() {
    super.initState();
    generateNewPassword();
  }

  void generateNewPassword() {
    this.password = Password.generate(
      length: this.length,
      includeLowercaseLetters: this.lowercaseLetters,
      includeUppercaseLetters: this.uppercaseLetters,
      includeNumbers: this.numbers,
      includeSpecialCharacters: this.specialCharacters,
      includeLatin1Characters: this.latin1Characters,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Password Generator'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: SelectableText(
                      '${this.password}',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
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
                              ClipboardData(text: this.password),
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
                      max: 50,
                      onChanged: (value) {
                        setState(() {
                          this.length = value.toInt();
                          generateNewPassword();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Lowercase letters'),
                      value: this.lowercaseLetters,
                      onChanged: (value) {
                        setState(() {
                          this.lowercaseLetters = value;
                          generateNewPassword();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Uppercase letters'),
                      value: this.uppercaseLetters,
                      onChanged: (value) {
                        setState(() {
                          this.uppercaseLetters = value;
                          generateNewPassword();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Numbers'),
                      value: this.numbers,
                      onChanged: (value) {
                        setState(() {
                          this.numbers = value;
                          generateNewPassword();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Special characters'),
                      value: this.specialCharacters,
                      onChanged: (value) {
                        setState(() {
                          this.specialCharacters = value;
                          generateNewPassword();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Latin1 characters'),
                      value: this.latin1Characters,
                      onChanged: (value) {
                        setState(() {
                          this.latin1Characters = value;
                          generateNewPassword();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
