import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';

class PasswordAndConfirmSection extends StatelessWidget {
  const PasswordAndConfirmSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Password',
          function: (value) {
            if (value!.isEmpty) {
              return 'enter your password';
            }
            return null;
          },
          iconPrefix: Icons.lock,
          controller: sl<RegisterCubit>().passwordController,
          obSecure: true,
          inputType: TextInputType.visiblePassword,
          iconSuffix: Icons.remove_red_eye,
        ),
        CustomTextFormField(
          hintText: 'Confirm Password',
          function: (value) {
            if (value!.isEmpty) {
              return 'enter your password again';
            }
            return null;
          },
          iconPrefix: Icons.lock,
          controller: sl<RegisterCubit>().confirmPasswordController,
          obSecure: true,
          inputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
