import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_calculator_tdd/presentation/home/bloc/home_bloc.dart';
import 'package:string_calculator_tdd/utils/app_strings.dart';

class CalculateSumButton extends StatelessWidget {
  const CalculateSumButton({super.key, required this.numbersTextController});

  final TextEditingController numbersTextController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final input = numbersTextController.text;
        context.read<HomeBloc>().add(AddEvent(input: input.trim()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade600,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      child: const Text(
        AppStrings.calculateSum,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
