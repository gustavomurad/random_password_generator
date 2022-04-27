import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/core/util/password.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_list_item.dart';

void main() {
  late List<String> passwords;

  setUp(() async {
    passwords = await Password.generate(length: 20);
  });

  testWidgets('PasswordListItem has a password', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PasswordListItem(
          password: passwords.first,
          onPressed: (value) {
            expect(passwords.first, value);
          },
        ),
      ),
    );

    await tester.tap(find.text(passwords.first));

    final passwordFinder = find.text(passwords.first);
    expect(passwordFinder, findsOneWidget);
  });
}
