import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:string_calculator_tdd/utils/app_constants.dart';
import 'package:string_calculator_tdd/utils/app_strings.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    _setupEventListener();
  }

  void _setupEventListener() {
    on<AddEvent>(_onAddEvent);
  }

  void _onAddEvent(AddEvent event, Emitter<HomeState> emit) {
    final regex = RegExp(AppConstants.kNumberPattern);

    final numbers = regex
        .allMatches(event.input)
        .map((match) => int.parse(match.group(0)!))
        .where((number) => number <= AppConstants.kBiggestSupportedNumber)
        .toList();

    if (numbers.any((number) => number < 0)) {
      final negativeNumbers = numbers.where((number) => number < 0).toList();
      emit(
        state.copyWith(
          calculatorResult: 0,
          errorMessage:
              '${AppStrings.negativeNumbersNotAllowed} ${negativeNumbers.join(', ')}',
        ),
      );
      return;
    }

    final sum = numbers.fold(0, (prev, element) => prev + element);

    emit(state.copyWith(calculatorResult: sum, errorMessage: ''));
  }
}
