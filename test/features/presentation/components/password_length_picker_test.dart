import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/presentation/components/password_length_picker.dart';

main() {
  setUp(() {});

  group('Test label, value, buttons, increment and decrement', () {
    int value = 3;

    Widget getSubject() => MaterialApp(
          home: Scaffold(
            body: PasswordLengthPicker(
              length: value,
              onChanged: (newValue) => value = newValue,
            ),
          ),
        );

    testWidgets('Subject has a label, value, decrement and increment buttons', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final labelFinder = find.text('Length');
      expect(labelFinder, findsOneWidget);

      final valueFinder = find.text(value.toString());
      expect(valueFinder, findsOneWidget);

      final removeIconFinder = find.byIcon(Icons.remove);
      expect(removeIconFinder, findsOneWidget);

      final addIconFinder = find.byIcon(Icons.add);
      expect(addIconFinder, findsOneWidget);
    });

    testWidgets('Subject can decrement a value', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final removeButton = find.byKey(Key('icon-button-remove'));
      await tester.tap(removeButton);
      expect(value, equals(2));
    });

    testWidgets('Subject can increment a value', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final addButton = find.byKey(Key('icon-button-add'));
      await tester.tap(addButton);
      expect(value, equals(3));
    });
  });
}
