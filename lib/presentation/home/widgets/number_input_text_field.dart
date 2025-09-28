import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_calculator_tdd/presentation/home/bloc/home_bloc.dart';
import 'package:string_calculator_tdd/utils/app_strings.dart';

class NumberInputTextField extends StatelessWidget {
  const NumberInputTextField({super.key, required this.numbersTextController});

  final TextEditingController numbersTextController;

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select(
      (HomeBloc bloc) => bloc.state.errorMessage,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.inputWithDelimiterHint,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: numbersTextController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
            ),
            hintText: AppStrings.numberInputHint,
            errorText: errorMessage.isNotEmpty ? errorMessage : null,
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
