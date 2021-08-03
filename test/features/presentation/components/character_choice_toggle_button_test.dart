import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/presentation/components/character_choice_toggle_button.dart';

main() {
  setUp(() {});

  group('', () {
    List<bool> toggleButtonSelectionItems = [true, true, true, true, true];
    List<String> toggleButtonsLabels = ['abc', 'ABC', '123', '!@%', 'Âæß'];

    Widget getSubject() => MaterialApp(
          home: Scaffold(
            body: CharacterChoiceToggleButton(
              onPressed: (index) {
                toggleButtonSelectionItems[index] =
                    !toggleButtonSelectionItems[index];
              },
              isSelected: toggleButtonSelectionItems,
              children: toggleButtonsLabels,
            ),
          ),
        );

    testWidgets('Subject has 5 buttons', (WidgetTester tester) async {
      await tester.pumpWidget(getSubject());

      final lowercaseButton = find.text('abc');
      expect(lowercaseButton, findsOneWidget);

      final uppercaseButton = find.text('ABC');
      expect(uppercaseButton, findsOneWidget);

      final numbersButton = find.text('123');
      expect(numbersButton, findsOneWidget);

      final specialCharsButton = find.text('!@%');
      expect(specialCharsButton, findsOneWidget);

      final latin1Buttons = find.text('Âæß');
      expect(latin1Buttons, findsOneWidget);
    });

    testWidgets('Subject has lowercase characters button pressed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final button = find.text('abc');
      expect(button, findsOneWidget);

      await tester.tap(button);
      expect(toggleButtonSelectionItems[0], equals(false));
    });

    testWidgets('Subject has uppercase characters button pressed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final button = find.text('ABC');
      expect(button, findsOneWidget);

      await tester.tap(button);
      expect(toggleButtonSelectionItems[0], equals(false));
      expect(toggleButtonSelectionItems[1], equals(false));
    });

    testWidgets('Subject has numbers button pressed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final button = find.text('123');
      expect(button, findsOneWidget);

      await tester.tap(button);
      expect(toggleButtonSelectionItems[0], equals(false));
      expect(toggleButtonSelectionItems[1], equals(false));
      expect(toggleButtonSelectionItems[2], equals(false));
    });

    testWidgets('Subject has special characters button pressed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final button = find.text('!@%');
      expect(button, findsOneWidget);

      await tester.tap(button);
      expect(toggleButtonSelectionItems[0], equals(false));
      expect(toggleButtonSelectionItems[1], equals(false));
      expect(toggleButtonSelectionItems[2], equals(false));
      expect(toggleButtonSelectionItems[3], equals(false));
    });
    testWidgets('Subject has latin1 button pressed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      final button = find.text('Âæß');
      expect(button, findsOneWidget);

      await tester.tap(button);
      expect(toggleButtonSelectionItems[0], equals(false));
      expect(toggleButtonSelectionItems[1], equals(false));
      expect(toggleButtonSelectionItems[2], equals(false));
      expect(toggleButtonSelectionItems[3], equals(false));
      expect(toggleButtonSelectionItems[4], equals(false));
    });
  });
}
