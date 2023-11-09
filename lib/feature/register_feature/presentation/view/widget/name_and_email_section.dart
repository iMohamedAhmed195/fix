import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';

class NameAndEmailSection extends StatelessWidget {
  const NameAndEmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Name',
          function: (value) {
            if (value!.isEmpty) {
              return 'enter your name';
            }
            return null;
          },
          iconPrefix: Icons.person,
          controller: sl<RegisterCubit>().nameController,
          obSecure: false,
          inputType: TextInputType.text,
        ),
        CustomTextFormField(
          hintText: 'Email',
          function: (value) {
            if (value!.isEmpty) {
              return 'enter your email';
            }
            return null;
          },
          iconPrefix: Icons.email,
          controller: sl<RegisterCubit>().emailController,
          obSecure: false,
          inputType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
