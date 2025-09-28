import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/presentation/home/bloc/home_bloc.dart';

void main() {
  group('home bloc test', () {
    blocTest<HomeBloc, HomeState>(
      'calculate sum event test',
      // arrange
      build: () => HomeBloc(),
      // act
      act: (bloc) {
        bloc.add(AddEvent(input: "1,1"));
      },
      // assert
      expect: () => <HomeState>[HomeState(calculatorResult: 2)],
    );

    blocTest<HomeBloc, HomeState>(
      'calculate sum event with ";" as a delimiter',
      // arrange
      build: () => HomeBloc(),

      // act
      act: (bloc) {
        bloc.add(AddEvent(input: "1;1;2"));
      },

      // assert
      expect: () => <HomeState>[HomeState(calculatorResult: 4)],
    );

    blocTest<HomeBloc, HomeState>(
      'calculate sum event with "/n" escape character',
      // arrange
      build: () => HomeBloc(),

      // act
      act: (bloc) {
        bloc.add(AddEvent(input: "1\n1,2"));
      },

      // assert
      expect: () => <HomeState>[HomeState(calculatorResult: 4)],
    );

    blocTest<HomeBloc, HomeState>(
      'calculate sum event with custom delimiter format "//delimiter\\nX;Y"',
      // arrange
      build: () => HomeBloc(),

      // act
      act: (bloc) {
        bloc.add(AddEvent(input: "//;\n1;2"));
      },

      // assert
      expect: () => <HomeState>[HomeState(calculatorResult: 3)],
    );
  });
}
