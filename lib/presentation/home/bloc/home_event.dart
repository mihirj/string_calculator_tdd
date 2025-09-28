part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class AddEvent extends HomeEvent {
  final String input;

  const AddEvent({required this.input});

  @override
  List<Object> get props => [input];
}
