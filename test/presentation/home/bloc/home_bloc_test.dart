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
        bloc.add(CalculateSumEvent(input: "1,1"));
      },
      // assert
      expect: () => <HomeState>[HomeState(calculatorResult: 2)],
    );
  });
}
