import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomTextFormField(
          hintText: 'Email',
          function: (value) {
            if (!sl<RegisterCubit>().isValidEmail()) {
              return 'Please Enter a Valid email';
            } else if (value!.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
          iconPrefix: Icons.email,
          controller: sl<RegisterCubit>().emailController,
          obSecure: false,
          inputType: TextInputType.emailAddress,
        );
      },
    );
  }
}
