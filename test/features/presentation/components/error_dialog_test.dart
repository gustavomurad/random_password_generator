import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/presentation/components/error_dialog.dart';

MaterialApp _buildAppWithDialog(Widget dialog,
    {ThemeData? theme, double textScaleFactor = 1.0}) {
  return MaterialApp(
    theme: theme,
    home: Material(
      child: Builder(
        builder: (BuildContext context) {
          return Center(
            child: ElevatedButton(
              child: const Text('X'),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaleFactor: textScaleFactor),
                      child: dialog,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    ),
  );
}

main() {
  group('Test dialog, button, icon and message', () {
    testWidgets('Subject exist, has a icon, button and message', (
      WidgetTester tester,
    ) async {
      final Widget errorDialog = ErrorDialog(
        message: 'This is a error message',
      );

      await tester.pumpWidget(_buildAppWithDialog(errorDialog));

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

    testWidgets('Subject exist, has a icon, button and message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: Center(
              child: ElevatedButton(
                onPressed: null,
                child: Text('Go'),
              ),
            ),
          ),
        ),
      );

      final BuildContext context = tester.element(find.text('Go'));

      final Future<bool?> result = showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(
            message: 'This is a error message',
          );
        },
      );

      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byKey(Key('error-ok-button')));
      expect(await result, equals(true));
    });
  });
}
