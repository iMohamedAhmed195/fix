import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordSection extends StatelessWidget {
  const PasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomTextFormField(
            hintText: 'Password',
            function: (value) {
              if (value!.isEmpty) {
                return 'enter your password';
              } else if (sl<RegisterCubit>().checkPassword()) {
                return "The password and confirm password must match";
              }
              return null;
            },
            iconPrefix: Icons.lock,
            controller: sl<RegisterCubit>().passwordController,
            obSecure: sl<RegisterCubit>().passwordVisible,
            inputType: TextInputType.visiblePassword,
            iconSuffix: Icons.remove_red_eye,
            sufFunction: () => sl<RegisterCubit>().changePasswordVisibility());
      },
    );
  }
}
