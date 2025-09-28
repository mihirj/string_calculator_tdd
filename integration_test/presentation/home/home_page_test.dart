import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:string_calculator_tdd/main.dart';

void main() {
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

    // Basic test to check Add function with new line
    await $(find.byType(TextField)).enterText('1\\n2,3');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('6'), findsOneWidget);

    // Basic test to checkAdd function with custom delimiter
    await $(find.byType(TextField)).enterText('//;\n1;2');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('3'), findsOneWidget);

    // Basic test to check Add function with negative number
    await $(find.byType(TextField)).enterText('1,-2,3');
    // await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Negative numbers not allowed: -2'), findsOneWidget);

    // Basic test to check Add function with empty string
    await $(find.byType(TextField)).enterText('');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);

    // Basic test to check Add function with only one number
    await $(find.byType(TextField)).enterText('5');
    await $.pumpAndSettle();
    await $(find.text('Calculate Sum')).tap();
    await $.pumpAndSettle();
    expect(find.text('5'), findsNWidgets(2));
  });
}
