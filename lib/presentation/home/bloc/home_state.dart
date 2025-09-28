part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.calculatorResult, this.errorMessage = ''});

  final int calculatorResult;
  final String errorMessage;

  HomeState copyWith({int? calculatorResult, String? errorMessage}) {
    return HomeState(
      calculatorResult: calculatorResult ?? this.calculatorResult,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory HomeState.initial() {
    return const HomeState(calculatorResult: 0);
  }

  @visibleForTesting
  const HomeState.test({int? calculatorResult, String? errorMessage})
    : calculatorResult = calculatorResult ?? 0,
      errorMessage = errorMessage ?? '';

  @override
  List<Object> get props => [calculatorResult, errorMessage];
}
