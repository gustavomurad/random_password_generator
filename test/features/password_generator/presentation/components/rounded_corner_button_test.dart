import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/rounded_corner_button.dart';

main() {
  testWidgets('RoundedCornerButton has a icon and label',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RoundedCornerButton(
          label: 'REFRESH',
          icon: Icons.refresh,
        ),
      ),
    );

    final iconFinder = find.byIcon(Icons.refresh);
    expect(iconFinder, findsOneWidget);

    final labelFinder = find.text('REFRESH');
    expect(labelFinder, findsOneWidget);
  });
}
