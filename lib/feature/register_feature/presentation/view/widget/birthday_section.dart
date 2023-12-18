import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirthDateSection extends StatelessWidget {
  const BirthDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            controller:  sl<RegisterCubit>().dateController,
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFFAFAFA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 18),
              labelText: 'Select Birth Date',
              suffixIcon: GestureDetector(
                onTap: () {
                  sl<RegisterCubit>().selectDate(context);
                },
                child: const Icon(Icons.calendar_today),
              ),
            ),
            keyboardType: TextInputType.datetime,
          ),
        );
      },
    );
  }
}
