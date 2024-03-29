import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_list.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_list_item.dart';

void main() {
  List<String> passwords = [];

  setUp(() async {
    passwords = Password.generate(length: 20, quantity: 5);
  });

  testWidgets('PasswordList has 5 passwords', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PasswordList(
          passwords: passwords,
          onPressed: (value) => expect(passwords.contains(value), true),
        ),
      ),
    );

    await tester.tap(find.text(passwords.first));

    for (var password in passwords) {
      final passwordFinder = find.widgetWithText(PasswordListItem, password);

      expect(passwordFinder, findsOneWidget);
    }
  });
}
