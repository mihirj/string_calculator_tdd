part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class CalculateSumEvent extends HomeEvent {
  final String input;

  const CalculateSumEvent({required this.input});

  @override
  List<Object> get props => [input];
}
