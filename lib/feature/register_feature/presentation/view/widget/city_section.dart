import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySectionComponent extends StatelessWidget {
  const CitySectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomTextFormField(
          hintText: 'City',
          function: (value) {
            if (value!.isEmpty) {
              return 'Address must not be empty';
            }
            return null;
          },
          iconPrefix: Icons.streetview,
          controller: sl<RegisterCubit>().cityController,
          obSecure: false,
          inputType: TextInputType.text,
        );
      },
    );
  }
}
