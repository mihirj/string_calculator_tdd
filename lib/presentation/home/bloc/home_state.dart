part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.calculatorResult});

  final int calculatorResult;

  HomeState copyWith({int? calculatorResult}) {
    return HomeState(
      calculatorResult: calculatorResult ?? this.calculatorResult,
    );
  }

  factory HomeState.initial() {
    return const HomeState(calculatorResult: 0);
  }

  @visibleForTesting
  const HomeState.test({int? calculatorResult})
    : calculatorResult = calculatorResult ?? 0;

  @override
  List<Object> get props => [calculatorResult];
}
