import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/core/widget_components/image_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatelessWidget {
   ForgetPasswordViewBody({super.key});
   var forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageAndTextSection(namePage: 'Search About Email',),

        Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Styles.kPrimaryColor, width: 3.w)),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.0.h),
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Search by your email',
                    iconPrefix: Icons.email,
                    controller: forgetPasswordController,
                    obSecure: false,
                    inputType: TextInputType.emailAddress,
                  ),
                  CustomButton(function: () {  }, buttonName: 'Search',)
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
