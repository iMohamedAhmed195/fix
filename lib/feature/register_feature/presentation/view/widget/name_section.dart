import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameSection extends StatelessWidget {
  const NameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormField(
              hintText: 'Name',
              function: (value) {
                if (value!.isEmpty) {
                  return 'This Field Cannot Be Empty';
                }
                return null;
              },
              iconPrefix: Icons.person,
              controller: sl<RegisterCubit>().nameController,
              obSecure: false,
              inputType: TextInputType.text,
            ),
          ],
        );
      },
    );
  }
}
