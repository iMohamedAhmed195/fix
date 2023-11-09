import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';

class AddressAndNationalIdSection extends StatelessWidget {
  const AddressAndNationalIdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Address',
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
        ),
        CustomTextFormField(
          hintText: 'National ID',
          function: (value) {
            if (value!.isEmpty) {
              return 'National Id must not be empty';
            }
            return null;
          },
          iconPrefix: Icons.card_membership,
          controller: sl<RegisterCubit>().Nidcontroller,
          obSecure: true,
          inputType: TextInputType.number,
        ),
      ],
    );
  }
}
