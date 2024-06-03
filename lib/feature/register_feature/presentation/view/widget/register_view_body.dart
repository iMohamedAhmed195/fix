import 'package:fix/core/widget_components/image_text_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/container_of_text_field_for_register.dart';
import 'package:flutter/material.dart';



class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          child:  Column(
            children: [
              ImageAndTextSection(namePage: 'Join Us!',),
              RegisterOfTextFieldForRegister()
            ],
          )
      ),
    );
  }
}
