import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:string_calculator_tdd/main.dart';

void main() {
  // Note: `framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive` causes issues in iOS
  patrolTest('Home page test', ($) async {
    await $.pumpWidgetAndSettle(const MyApp());
    await $.pumpAndSettle();

    expect(find.text('String Calculator TDD'), findsOneWidget);

    // Basic test to check Add function
    await $(find.byType(TextField)).enterText('1,2,3');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('6'), findsOneWidget);

    // New line as a delimiter
    await $(find.byType(TextField)).enterText('1\\n2,3');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('6'), findsOneWidget);

    // Custom delimiter test
    await $(find.byType(TextField)).enterText('//;\n1;2');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('3'), findsOneWidget);

    // Negative number should show error message
    await $(find.byType(TextField)).enterText('1,-2,3');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Negative numbers not allowed: -2'), findsOneWidget);

    // Empty text field should return 0
    await $(find.byType(TextField)).enterText('');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);

    // Single number should return the same number
    await $(find.byType(TextField)).enterText('5');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('5'), findsNWidgets(2));

    // Bigger than 1000 number should be ignored
    await $(find.byType(TextField)).enterText('1,1001,2');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('3'), findsOneWidget);
  });
}
