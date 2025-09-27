import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    _setupEventListener();
  }

  void _setupEventListener() {
    on<CalculateSumEvent>(_onCalculateSumEvent);
  }

  void _onCalculateSumEvent(CalculateSumEvent event, Emitter<HomeState> emit) {
    final numbers = event.input.split(',').map(int.parse).toList();
    final sum = numbers.fold(0, (prev, element) => prev + element);
    emit(state.copyWith(calculatorResult: sum));
  }
}
