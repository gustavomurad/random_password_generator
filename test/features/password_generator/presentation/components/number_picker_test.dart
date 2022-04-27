import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/number_picker.dart';

main() {
  const String label = 'NumberPicker';
  const int minValue = 1;
  const int maxValue = 6;

  group('Test label, value, buttons, increment and decrement', () {
    testWidgets('Subject has a label, value, decrement and increment buttons', (
      WidgetTester tester,
    ) async {
      int value = 3;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: NumberPicker(
            label: label,
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            onChanged: (newValue) => value = newValue,
          ),
        ),
      ));

      final labelFinder = find.text(label);
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
      int value = 3;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: NumberPicker(
            label: label,
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            onChanged: (newValue) => value = newValue,
          ),
        ),
      ));

      final removeButton = find.byKey(Key('icon-button-remove'));
      await tester.tap(removeButton);
      expect(value, equals(2));
    });

    testWidgets('Subject can decrement a value to minimum', (
      WidgetTester tester,
    ) async {
      int value = 1;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: NumberPicker(
            label: label,
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            onChanged: (newValue) => value = newValue,
          ),
        ),
      ));

      final removeButton = find.byKey(Key('icon-button-remove'));
      await tester.tap(removeButton);
      expect(value, equals(maxValue));
    });

    testWidgets('Subject can increment a value', (
      WidgetTester tester,
    ) async {
      int value = 3;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: NumberPicker(
            label: label,
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            onChanged: (newValue) => value = newValue,
          ),
        ),
      ));

      final addButton = find.byKey(Key('icon-button-add'));
      await tester.tap(addButton);
      expect(value, equals(4));
    });

    testWidgets('Subject can increment a value to maximum', (
      WidgetTester tester,
    ) async {
      int value = 6;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: NumberPicker(
            label: label,
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            onChanged: (newValue) => value = newValue,
          ),
        ),
      ));

      final addButton = find.byKey(Key('icon-button-add'));
      await tester.tap(addButton);
      expect(value, equals(1));
    });
  });
}
