import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/presentation/home/home_page.dart';

void main() {
  group('Home page widget test', () {
    testWidgets('App bar test in home page', (tester) async {
      //arrange

      //act
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const HomePage(),
        ),
      );

      // assert
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('String Calculator TDD'), findsOneWidget);
    });

    testWidgets('text field hint text widget in home page', (tester) async {
      //arrange

      //act
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const HomePage(),
        ),
      );

      // assert
      expect(
        find.text('Enter any numbers separated by comma (e.g., 1,2,3)'),
        findsOneWidget,
      );
    });

    testWidgets('text field in home page', (tester) async {
      //arrange

      //act
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const HomePage(),
        ),
      );

      // assert
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Enter numbers here'), findsOneWidget);
    });

    testWidgets('result display card in home page', (tester) async {
      //arrange

      //act
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const HomePage(),
        ),
      );

      // assert
      expect(find.text('Result'), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.byIcon(Icons.calculate), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('calculate sum button in home page', (tester) async {
      //arrange

      //act
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const HomePage(),
        ),
      );

      // assert
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Calculate Sum'), findsOneWidget);
    });
  });
}
