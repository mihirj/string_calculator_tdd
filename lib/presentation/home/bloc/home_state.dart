part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  HomeState copyWith() {
    return HomeState();
  }

  factory HomeState.initial() {
    return const HomeState();
  }
  @override
  List<Object> get props => [];
}
