import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneSection extends StatelessWidget {
  const PhoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              IntlPhoneField(
                controller: sl<RegisterCubit>().phoneController,
                decoration: const InputDecoration(
                  labelText: 'Enter Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\d{0,2}$')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
