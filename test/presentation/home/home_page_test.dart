import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:string_calculator_tdd/presentation/home/bloc/home_bloc.dart';
import 'package:string_calculator_tdd/presentation/home/home_page.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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

  // Golden test cases
  testExecutable(() {
    goldenTest(
      'Home page UI test',
      fileName: 'home_page',
      builder: () {
        // arrange
        final homeBloc = MockHomeBloc();
        when(() => homeBloc.state).thenReturn(HomeState.test());

        final homeBlocWithAddEventResult = MockHomeBloc();
        when(
          () => homeBlocWithAddEventResult.state,
        ).thenReturn(HomeState.test(calculatorResult: 14));

        final homeBlocWithError = MockHomeBloc();
        when(() => homeBlocWithError.state).thenReturn(
          HomeState.test(errorMessage: 'Negative numbers not allowed: -1'),
        );

        // act, assert
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'home page with initial state',
              providers: [BlocProvider<HomeBloc>.value(value: homeBloc)],
              child: const HomePageBody(),
            ),

            createTestScenario(
              name: 'home page with result in add event',
              providers: [
                BlocProvider<HomeBloc>.value(value: homeBlocWithAddEventResult),
              ],
              child: const HomePageBody(),
            ),
            createTestScenario(
              name: 'home page with error in add event',
              providers: [
                BlocProvider<HomeBloc>.value(value: homeBlocWithError),
              ],
              child: const HomePageBody(),
            ),
          ],
        );
      },
    );
  });
}
