import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/features/presentation/components/password_list_item.dart';

void main() {
  String password = '';

  setUp(() {
    password = Password.generate(length: 20).first;
  });

  testWidgets('PasswordListItem has a password', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PasswordListItem(
          password: password,
        ),
      ),
    );

    final passwordFinder = find.text(password);
    expect(passwordFinder, findsOneWidget);
  });
}
