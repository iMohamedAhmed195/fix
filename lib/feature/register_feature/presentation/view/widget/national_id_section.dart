import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalIdSection extends StatelessWidget {
  const NationalIdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomTextFormField(
          formatList: [
            FilteringTextInputFormatter.allow(
                RegExp(r'^\d*\d{0,2}$')),
            LengthLimitingTextInputFormatter(14)
          ],
          hintText: 'National ID',
          function: (value) {
            if (value!.isEmpty) {
              return 'National Id must not be empty';
            }else if(value.length < 14){
              return 'National Id must be 14 digit';
            }
            return null;
          },

          iconPrefix: Icons.card_membership,
          controller: sl<RegisterCubit>().nIdController,
          obSecure: false,
          inputType:  TextInputType.number,
        );
      },
    );
  }
}
