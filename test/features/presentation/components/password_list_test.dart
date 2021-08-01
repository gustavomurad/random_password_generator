import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/features/presentation/components/password_list.dart';
import 'package:random_password_generator/features/presentation/components/password_list_item.dart';

void main() {
  List<String> passwords = [];

  setUp(() {
    passwords = Password.generate(length: 20, quantity: 5);
  });

  testWidgets('PasswordList has 5 passwords', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PasswordList(
          passwords: passwords,
        ),
      ),
    );

    passwords.forEach((element) {
      final passwordFinder = find.widgetWithText(PasswordListItem, element);
      expect(passwordFinder, findsOneWidget);
    });
  });
}
