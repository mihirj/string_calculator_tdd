import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/presentation/home/bloc/home_bloc.dart';

void main() {
  group('home bloc test', () {
    blocTest<HomeBloc, HomeState>(
      'calculate sum event test',
      build: () => HomeBloc(),
      act: (bloc) {
        bloc.add(CalculateSumEvent(input: "1,1"));
      },
      expect: () => <HomeState>[HomeState(calculatorResult: 2)],
    );
  });
}
