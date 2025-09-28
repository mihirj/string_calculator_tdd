import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_calculator_tdd/presentation/home/bloc/home_bloc.dart';
import 'package:string_calculator_tdd/presentation/home/widgets/calculate_sum_button.dart';
import 'package:string_calculator_tdd/presentation/home/widgets/number_input_text_field.dart';
import 'package:string_calculator_tdd/presentation/home/widgets/result_card.dart';
import 'package:string_calculator_tdd/utils/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final TextEditingController numbersTextController = TextEditingController();

  @override
  void dispose() {
    numbersTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 8,
        backgroundColor: Colors.blue.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumberInputTextField(numbersTextController: numbersTextController),
            const SizedBox(height: 24),
            const ResultCard(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CalculateSumButton(
                numbersTextController: numbersTextController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
