import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/presentation/components/error_dialog.dart';

main() {
  setUp(() {});

  group('Test dialog, button, icon and message', () {
    Widget getSubject() => MaterialApp(
          home: Material(
            child: Builder(
              builder: (BuildContext context) {
                return Center(
                  child: ElevatedButton(
                    child: const Text('X'),
                    onPressed: () {
                      ErrorDialog(
                        context: context,
                        message: 'This is a error message',
                      ).show();
                    },
                  ),
                );
              },
            ),
          ),
        );

    testWidgets('Subject exist, has a icon, button and message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(getSubject());

      await tester.tap(find.text('X'));
      await tester.pumpAndSettle();

      final dialog = find.byKey(Key('error-dialog'));
      expect(dialog, findsOneWidget);

      final icon = find.byKey(Key('error-dialog-icon'));
      expect(icon, findsOneWidget);

      final message = find.byKey(Key('error-dialog-message'));
      expect(message, findsOneWidget);

      final okButton = find.byKey(Key('error-ok-button'));
      expect(okButton, findsOneWidget);
    });
  });
}
