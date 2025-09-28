import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

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
    final regex = RegExp(r'-?\d+');

    final numbers = regex
        .allMatches(event.input)
        .map((match) => int.parse(match.group(0)!))
        .toList();

    if (numbers.any((number) => number < 0)) {
      final negativeNumbers = numbers.where((number) => number < 0).toList();
      emit(
        state.copyWith(
          errorMessage:
              'Negative numbers not allowed: ${negativeNumbers.join(', ')}',
        ),
      );
      return;
    }

    final sum = numbers.fold(0, (prev, element) => prev + element);

    emit(state.copyWith(calculatorResult: sum, errorMessage: ''));
  }
}
