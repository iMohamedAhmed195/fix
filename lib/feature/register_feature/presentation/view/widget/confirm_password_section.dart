import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordSection extends StatelessWidget {
  const ConfirmPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomTextFormField(
          hintText: 'Confirm Password',
          function: (value) {
            if (value!.isEmpty) {
              return 'enter your password';
            } else if (sl<RegisterCubit>().checkPassword()) {
              return "The password and confirm password must match";
            }
            return null;
          },
          iconPrefix: Icons.lock,
          controller: sl<RegisterCubit>().confirmPasswordController,
          obSecure: true,
          inputType: TextInputType.visiblePassword,
        );
      },
    );
  }
}
