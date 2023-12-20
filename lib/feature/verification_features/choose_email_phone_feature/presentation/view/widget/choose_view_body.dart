import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/utils/go_routes/route_names.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/core/widget_components/image_text_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChooseViewBody extends StatelessWidget {
  ChooseViewBody({super.key});
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageAndTextSection(
          namePage: 'Choose send to Email or Phone',
        ),
        Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Styles.kPrimaryColor, width: 3.w)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h),
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Your code',
                    iconPrefix: Icons.lock_outline,
                    controller: passwordController,
                    obSecure: false,
                    inputType: TextInputType.visiblePassword,
                    function: (value) {
                      return null;
                    },
                  ),
                  CustomButton(
                    function: () {
                      GoRouter.of(context).push(AppRouter.kNewPassword);
                    },
                    buttonName: 'Next',
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
